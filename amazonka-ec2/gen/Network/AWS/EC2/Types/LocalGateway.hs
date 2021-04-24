{-# LANGUAGE DeriveDataTypeable #-}
{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE RecordWildCards #-}
{-# OPTIONS_GHC -fno-warn-unused-imports #-}

-- Derived from AWS service descriptions, licensed under Apache 2.0.

-- |
-- Module      : Network.AWS.EC2.Types.LocalGateway
-- Copyright   : (c) 2013-2021 Brendan Hay
-- License     : Mozilla Public License, v. 2.0.
-- Maintainer  : Brendan Hay <brendan.g.hay+amazonka@gmail.com>
-- Stability   : auto-generated
-- Portability : non-portable (GHC extensions)
module Network.AWS.EC2.Types.LocalGateway where

import Network.AWS.EC2.Internal
import Network.AWS.EC2.Types.Tag
import Network.AWS.Lens
import Network.AWS.Prelude

-- | Describes a local gateway.
--
--
--
-- /See:/ 'localGateway' smart constructor.
data LocalGateway = LocalGateway'
  { _lgOwnerId ::
      !(Maybe Text),
    _lgOutpostARN :: !(Maybe Text),
    _lgLocalGatewayId :: !(Maybe Text),
    _lgState :: !(Maybe Text),
    _lgTags :: !(Maybe [Tag])
  }
  deriving (Eq, Read, Show, Data, Typeable, Generic)

-- | Creates a value of 'LocalGateway' with the minimum fields required to make a request.
--
-- Use one of the following lenses to modify other fields as desired:
--
-- * 'lgOwnerId' - The AWS account ID that owns the local gateway.
--
-- * 'lgOutpostARN' - The Amazon Resource Name (ARN) of the Outpost.
--
-- * 'lgLocalGatewayId' - The ID of the local gateway.
--
-- * 'lgState' - The state of the local gateway.
--
-- * 'lgTags' - The tags assigned to the local gateway.
localGateway ::
  LocalGateway
localGateway =
  LocalGateway'
    { _lgOwnerId = Nothing,
      _lgOutpostARN = Nothing,
      _lgLocalGatewayId = Nothing,
      _lgState = Nothing,
      _lgTags = Nothing
    }

-- | The AWS account ID that owns the local gateway.
lgOwnerId :: Lens' LocalGateway (Maybe Text)
lgOwnerId = lens _lgOwnerId (\s a -> s {_lgOwnerId = a})

-- | The Amazon Resource Name (ARN) of the Outpost.
lgOutpostARN :: Lens' LocalGateway (Maybe Text)
lgOutpostARN = lens _lgOutpostARN (\s a -> s {_lgOutpostARN = a})

-- | The ID of the local gateway.
lgLocalGatewayId :: Lens' LocalGateway (Maybe Text)
lgLocalGatewayId = lens _lgLocalGatewayId (\s a -> s {_lgLocalGatewayId = a})

-- | The state of the local gateway.
lgState :: Lens' LocalGateway (Maybe Text)
lgState = lens _lgState (\s a -> s {_lgState = a})

-- | The tags assigned to the local gateway.
lgTags :: Lens' LocalGateway [Tag]
lgTags = lens _lgTags (\s a -> s {_lgTags = a}) . _Default . _Coerce

instance FromXML LocalGateway where
  parseXML x =
    LocalGateway'
      <$> (x .@? "ownerId")
      <*> (x .@? "outpostArn")
      <*> (x .@? "localGatewayId")
      <*> (x .@? "state")
      <*> ( x .@? "tagSet" .!@ mempty
              >>= may (parseXMLList "item")
          )

instance Hashable LocalGateway

instance NFData LocalGateway
