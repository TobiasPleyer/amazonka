{-# LANGUAGE DataKinds           #-}
{-# LANGUAGE FlexibleContexts    #-}
{-# LANGUAGE FlexibleInstances   #-}
{-# LANGUAGE GADTs               #-}
{-# LANGUAGE KindSignatures      #-}
{-# LANGUAGE OverloadedStrings   #-}
{-# LANGUAGE ScopedTypeVariables #-}
{-# LANGUAGE StandaloneDeriving  #-}

-- Module      : Network.AWS.Data.Time
-- Copyright   : (c) 2013-2014 Brendan Hay <brendan.g.hay@gmail.com>
-- License     : This Source Code Form is subject to the terms of
--               the Mozilla Public License, v. 2.0.
--               A copy of the MPL can be found in the LICENSE file or
--               you can obtain it at http://mozilla.org/MPL/2.0/.
-- Maintainer  : Brendan Hay <brendan.g.hay@gmail.com>
-- Stability   : experimental
-- Portability : non-portable (GHC extensions)

module Network.AWS.Data.Time where

import           Control.Applicative
import           Control.Monad
import           Data.Attoparsec.Text        (Parser)
import qualified Data.Attoparsec.Text        as AText
import           Data.ByteString             (ByteString)
import qualified Data.ByteString.Char8       as BS
import           Data.Tagged
import qualified Data.Text                   as Text
import           Data.Time
import           Network.AWS.Data.ByteString
import           Network.AWS.Data.Text
import           Network.AWS.Data.XML
import           System.Locale

data Format
    = RFC822Format
    | ISO8601Format
    | BasicFormat
    | AWSFormat
      deriving (Eq, Show)

data Time :: Format -> * where
    Time       :: UTCTime    -> Time a
    LocaleTime :: TimeLocale -> UTCTime -> Time a

deriving instance Show (Time a)
deriving instance Eq   (Time a)

type RFC822    = Time RFC822Format
type ISO8601   = Time ISO8601Format
type BasicTime = Time BasicFormat
type AWSTime   = Time AWSFormat

class TimeFormat a where
    format :: Tagged a String

instance TimeFormat RFC822    where format = Tagged "%a, %d %b %Y %H:%M:%S GMT"
instance TimeFormat ISO8601   where format = Tagged (iso8601DateFormat (Just "%XZ"))
instance TimeFormat BasicTime where format = Tagged "%Y%m%d"
instance TimeFormat AWSTime   where format = Tagged "%Y%m%dT%H%M%SZ"

instance ToByteString RFC822    where toBS = renderFormattedTime
instance ToByteString ISO8601   where toBS = renderFormattedTime
instance ToByteString BasicTime where toBS = renderFormattedTime
instance ToByteString AWSTime   where toBS = renderFormattedTime

renderFormattedTime :: forall a. TimeFormat (Time a) => Time a -> ByteString
renderFormattedTime x = BS.pack (formatTime l (untag f) t)
  where
    (l, t) = case x of
        Time          t' -> (defaultTimeLocale, t')
        LocaleTime l' t' -> (l', t')

    f :: Tagged (Time a) String
    f = format

instance FromText RFC822    where parser = parseFormattedTime
instance FromText ISO8601   where parser = parseFormattedTime
instance FromText BasicTime where parser = parseFormattedTime
instance FromText AWSTime   where parser = parseFormattedTime

parseFormattedTime :: forall a. TimeFormat (Time a) => Parser (Time a)
parseFormattedTime = do
    x <- Text.unpack <$> AText.takeText
    p (parseTime defaultTimeLocale (untag f) x) x
  where
    p :: Maybe UTCTime -> String -> Parser (Time a)
    p Nothing  s = fail   ("Unable to parse " ++ untag f ++ " from " ++ s)
    p (Just x) _ = return (Time x)

    f :: Tagged (Time a) String
    f = format

instance FromXML RFC822 where
    fromXMLRoot = fromRoot "Date"
    fromXML     = const fromNodeContent
