{-# LANGUAGE DeriveDataTypeable #-}
{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE RecordWildCards #-}
{-# OPTIONS_GHC -fno-warn-unused-imports #-}

-- Derived from AWS service descriptions, licensed under Apache 2.0.

-- |
-- Module      : Network.AWS.EC2.Types.PlacementResponse
-- Copyright   : (c) 2013-2021 Brendan Hay
-- License     : Mozilla Public License, v. 2.0.
-- Maintainer  : Brendan Hay <brendan.g.hay+amazonka@gmail.com>
-- Stability   : auto-generated
-- Portability : non-portable (GHC extensions)
module Network.AWS.EC2.Types.PlacementResponse where

import Network.AWS.EC2.Internal
import Network.AWS.Lens
import Network.AWS.Prelude

-- | Describes the placement of an instance.
--
--
--
-- /See:/ 'placementResponse' smart constructor.
newtype PlacementResponse = PlacementResponse'
  { _prGroupName ::
      Maybe Text
  }
  deriving (Eq, Read, Show, Data, Typeable, Generic)

-- | Creates a value of 'PlacementResponse' with the minimum fields required to make a request.
--
-- Use one of the following lenses to modify other fields as desired:
--
-- * 'prGroupName' - The name of the placement group that the instance is in.
placementResponse ::
  PlacementResponse
placementResponse =
  PlacementResponse' {_prGroupName = Nothing}

-- | The name of the placement group that the instance is in.
prGroupName :: Lens' PlacementResponse (Maybe Text)
prGroupName = lens _prGroupName (\s a -> s {_prGroupName = a})

instance FromXML PlacementResponse where
  parseXML x =
    PlacementResponse' <$> (x .@? "groupName")

instance Hashable PlacementResponse

instance NFData PlacementResponse
