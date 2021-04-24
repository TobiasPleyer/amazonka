{-# LANGUAGE DeriveDataTypeable #-}
{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE RecordWildCards #-}
{-# OPTIONS_GHC -fno-warn-unused-imports #-}

-- Derived from AWS service descriptions, licensed under Apache 2.0.

-- |
-- Module      : Network.AWS.EC2.Types.TransitGatewayMulticastRegisteredGroupMembers
-- Copyright   : (c) 2013-2021 Brendan Hay
-- License     : Mozilla Public License, v. 2.0.
-- Maintainer  : Brendan Hay <brendan.g.hay+amazonka@gmail.com>
-- Stability   : auto-generated
-- Portability : non-portable (GHC extensions)
module Network.AWS.EC2.Types.TransitGatewayMulticastRegisteredGroupMembers where

import Network.AWS.EC2.Internal
import Network.AWS.Lens
import Network.AWS.Prelude

-- | Describes the registered transit gateway multicast group members.
--
--
--
-- /See:/ 'transitGatewayMulticastRegisteredGroupMembers' smart constructor.
data TransitGatewayMulticastRegisteredGroupMembers = TransitGatewayMulticastRegisteredGroupMembers'
  { _tgmrgmTransitGatewayMulticastDomainId ::
      !( Maybe
           Text
       ),
    _tgmrgmGroupIPAddress ::
      !( Maybe
           Text
       ),
    _tgmrgmRegisteredNetworkInterfaceIds ::
      !( Maybe
           [Text]
       )
  }
  deriving
    ( Eq,
      Read,
      Show,
      Data,
      Typeable,
      Generic
    )

-- | Creates a value of 'TransitGatewayMulticastRegisteredGroupMembers' with the minimum fields required to make a request.
--
-- Use one of the following lenses to modify other fields as desired:
--
-- * 'tgmrgmTransitGatewayMulticastDomainId' - The ID of the transit gateway multicast domain.
--
-- * 'tgmrgmGroupIPAddress' - The IP address assigned to the transit gateway multicast group.
--
-- * 'tgmrgmRegisteredNetworkInterfaceIds' - The ID of the registered network interfaces.
transitGatewayMulticastRegisteredGroupMembers ::
  TransitGatewayMulticastRegisteredGroupMembers
transitGatewayMulticastRegisteredGroupMembers =
  TransitGatewayMulticastRegisteredGroupMembers'
    { _tgmrgmTransitGatewayMulticastDomainId =
        Nothing,
      _tgmrgmGroupIPAddress =
        Nothing,
      _tgmrgmRegisteredNetworkInterfaceIds =
        Nothing
    }

-- | The ID of the transit gateway multicast domain.
tgmrgmTransitGatewayMulticastDomainId :: Lens' TransitGatewayMulticastRegisteredGroupMembers (Maybe Text)
tgmrgmTransitGatewayMulticastDomainId = lens _tgmrgmTransitGatewayMulticastDomainId (\s a -> s {_tgmrgmTransitGatewayMulticastDomainId = a})

-- | The IP address assigned to the transit gateway multicast group.
tgmrgmGroupIPAddress :: Lens' TransitGatewayMulticastRegisteredGroupMembers (Maybe Text)
tgmrgmGroupIPAddress = lens _tgmrgmGroupIPAddress (\s a -> s {_tgmrgmGroupIPAddress = a})

-- | The ID of the registered network interfaces.
tgmrgmRegisteredNetworkInterfaceIds :: Lens' TransitGatewayMulticastRegisteredGroupMembers [Text]
tgmrgmRegisteredNetworkInterfaceIds = lens _tgmrgmRegisteredNetworkInterfaceIds (\s a -> s {_tgmrgmRegisteredNetworkInterfaceIds = a}) . _Default . _Coerce

instance
  FromXML
    TransitGatewayMulticastRegisteredGroupMembers
  where
  parseXML x =
    TransitGatewayMulticastRegisteredGroupMembers'
      <$> (x .@? "transitGatewayMulticastDomainId")
      <*> (x .@? "groupIpAddress")
      <*> ( x .@? "registeredNetworkInterfaceIds" .!@ mempty
              >>= may (parseXMLList "item")
          )

instance
  Hashable
    TransitGatewayMulticastRegisteredGroupMembers

instance
  NFData
    TransitGatewayMulticastRegisteredGroupMembers
