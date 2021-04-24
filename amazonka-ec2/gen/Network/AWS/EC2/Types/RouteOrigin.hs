{-# LANGUAGE DeriveDataTypeable #-}
{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE PatternSynonyms #-}
{-# OPTIONS_GHC -fno-warn-unused-imports #-}

-- Derived from AWS service descriptions, licensed under Apache 2.0.

-- |
-- Module      : Network.AWS.EC2.Types.RouteOrigin
-- Copyright   : (c) 2013-2021 Brendan Hay
-- License     : Mozilla Public License, v. 2.0.
-- Maintainer  : Brendan Hay <brendan.g.hay+amazonka@gmail.com>
-- Stability   : auto-generated
-- Portability : non-portable (GHC extensions)
module Network.AWS.EC2.Types.RouteOrigin
  ( RouteOrigin
      ( ..,
        CreateRoute,
        CreateRouteTable,
        EnableVGWRoutePropagation
      ),
  )
where

import Data.CaseInsensitive
import Network.AWS.EC2.Internal
import Network.AWS.Prelude

data RouteOrigin = RouteOrigin' (CI Text)
  deriving
    ( Eq,
      Ord,
      Read,
      Show,
      Data,
      Typeable,
      Generic
    )

pattern CreateRoute :: RouteOrigin
pattern CreateRoute = RouteOrigin' "CreateRoute"

pattern CreateRouteTable :: RouteOrigin
pattern CreateRouteTable = RouteOrigin' "CreateRouteTable"

pattern EnableVGWRoutePropagation :: RouteOrigin
pattern EnableVGWRoutePropagation = RouteOrigin' "EnableVgwRoutePropagation"

{-# COMPLETE
  CreateRoute,
  CreateRouteTable,
  EnableVGWRoutePropagation,
  RouteOrigin'
  #-}

instance FromText RouteOrigin where
  parser = (RouteOrigin' . mk) <$> takeText

instance ToText RouteOrigin where
  toText (RouteOrigin' ci) = original ci

instance Hashable RouteOrigin

instance NFData RouteOrigin

instance ToByteString RouteOrigin

instance ToQuery RouteOrigin

instance ToHeader RouteOrigin

instance FromXML RouteOrigin where
  parseXML = parseXMLText "RouteOrigin"
