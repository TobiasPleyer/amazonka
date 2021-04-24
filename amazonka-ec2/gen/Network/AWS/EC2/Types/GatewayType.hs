{-# LANGUAGE DeriveDataTypeable #-}
{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE PatternSynonyms #-}
{-# OPTIONS_GHC -fno-warn-unused-imports #-}

-- Derived from AWS service descriptions, licensed under Apache 2.0.

-- |
-- Module      : Network.AWS.EC2.Types.GatewayType
-- Copyright   : (c) 2013-2021 Brendan Hay
-- License     : Mozilla Public License, v. 2.0.
-- Maintainer  : Brendan Hay <brendan.g.hay+amazonka@gmail.com>
-- Stability   : auto-generated
-- Portability : non-portable (GHC extensions)
module Network.AWS.EC2.Types.GatewayType
  ( GatewayType
      ( ..,
        IPsec_1
      ),
  )
where

import Data.CaseInsensitive
import Network.AWS.EC2.Internal
import Network.AWS.Prelude

data GatewayType = GatewayType' (CI Text)
  deriving
    ( Eq,
      Ord,
      Read,
      Show,
      Data,
      Typeable,
      Generic
    )

pattern IPsec_1 :: GatewayType
pattern IPsec_1 = GatewayType' "ipsec.1"

{-# COMPLETE
  IPsec_1,
  GatewayType'
  #-}

instance FromText GatewayType where
  parser = (GatewayType' . mk) <$> takeText

instance ToText GatewayType where
  toText (GatewayType' ci) = original ci

instance Hashable GatewayType

instance NFData GatewayType

instance ToByteString GatewayType

instance ToQuery GatewayType

instance ToHeader GatewayType

instance FromXML GatewayType where
  parseXML = parseXMLText "GatewayType"
