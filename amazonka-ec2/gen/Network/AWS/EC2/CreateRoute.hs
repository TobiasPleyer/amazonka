{-# LANGUAGE DeriveDataTypeable #-}
{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE TypeFamilies #-}
{-# OPTIONS_GHC -fno-warn-unused-binds #-}
{-# OPTIONS_GHC -fno-warn-unused-imports #-}
{-# OPTIONS_GHC -fno-warn-unused-matches #-}

-- Derived from AWS service descriptions, licensed under Apache 2.0.

-- |
-- Module      : Network.AWS.EC2.CreateRoute
-- Copyright   : (c) 2013-2021 Brendan Hay
-- License     : Mozilla Public License, v. 2.0.
-- Maintainer  : Brendan Hay <brendan.g.hay+amazonka@gmail.com>
-- Stability   : auto-generated
-- Portability : non-portable (GHC extensions)
--
-- Creates a route in a route table within a VPC.
--
--
-- You must specify one of the following targets: internet gateway or virtual private gateway, NAT instance, NAT gateway, VPC peering connection, network interface, egress-only internet gateway, or transit gateway.
--
-- When determining how to route traffic, we use the route with the most specific match. For example, traffic is destined for the IPv4 address @192.0.2.3@ , and the route table includes the following two IPv4 routes:
--
--     * @192.0.2.0/24@ (goes to some target A)
--
--     * @192.0.2.0/28@ (goes to some target B)
--
--
--
-- Both routes apply to the traffic destined for @192.0.2.3@ . However, the second route in the list covers a smaller number of IP addresses and is therefore more specific, so we use that route to determine where to target the traffic.
--
-- For more information about route tables, see <https://docs.aws.amazon.com/vpc/latest/userguide/VPC_Route_Tables.html Route Tables> in the /Amazon Virtual Private Cloud User Guide/ .
module Network.AWS.EC2.CreateRoute
  ( -- * Creating a Request
    createRoute,
    CreateRoute,

    -- * Request Lenses
    crInstanceId,
    crVPCPeeringConnectionId,
    crDryRun,
    crVPCEndpointId,
    crDestinationPrefixListId,
    crDestinationIPv6CidrBlock,
    crLocalGatewayId,
    crEgressOnlyInternetGatewayId,
    crCarrierGatewayId,
    crDestinationCidrBlock,
    crNetworkInterfaceId,
    crNatGatewayId,
    crGatewayId,
    crTransitGatewayId,
    crRouteTableId,

    -- * Destructuring the Response
    createRouteResponse,
    CreateRouteResponse,

    -- * Response Lenses
    crrrsReturn,
    crrrsResponseStatus,
  )
where

import Network.AWS.EC2.Types
import Network.AWS.Lens
import Network.AWS.Prelude
import Network.AWS.Request
import Network.AWS.Response

-- | /See:/ 'createRoute' smart constructor.
data CreateRoute = CreateRoute'
  { _crInstanceId ::
      !(Maybe Text),
    _crVPCPeeringConnectionId :: !(Maybe Text),
    _crDryRun :: !(Maybe Bool),
    _crVPCEndpointId :: !(Maybe Text),
    _crDestinationPrefixListId :: !(Maybe Text),
    _crDestinationIPv6CidrBlock :: !(Maybe Text),
    _crLocalGatewayId :: !(Maybe Text),
    _crEgressOnlyInternetGatewayId :: !(Maybe Text),
    _crCarrierGatewayId :: !(Maybe Text),
    _crDestinationCidrBlock :: !(Maybe Text),
    _crNetworkInterfaceId :: !(Maybe Text),
    _crNatGatewayId :: !(Maybe Text),
    _crGatewayId :: !(Maybe Text),
    _crTransitGatewayId :: !(Maybe Text),
    _crRouteTableId :: !Text
  }
  deriving (Eq, Read, Show, Data, Typeable, Generic)

-- | Creates a value of 'CreateRoute' with the minimum fields required to make a request.
--
-- Use one of the following lenses to modify other fields as desired:
--
-- * 'crInstanceId' - The ID of a NAT instance in your VPC. The operation fails if you specify an instance ID unless exactly one network interface is attached.
--
-- * 'crVPCPeeringConnectionId' - The ID of a VPC peering connection.
--
-- * 'crDryRun' - Checks whether you have the required permissions for the action, without actually making the request, and provides an error response. If you have the required permissions, the error response is @DryRunOperation@ . Otherwise, it is @UnauthorizedOperation@ .
--
-- * 'crVPCEndpointId' - The ID of a VPC endpoint. Supported for Gateway Load Balancer endpoints only.
--
-- * 'crDestinationPrefixListId' - The ID of a prefix list used for the destination match.
--
-- * 'crDestinationIPv6CidrBlock' - The IPv6 CIDR block used for the destination match. Routing decisions are based on the most specific match.
--
-- * 'crLocalGatewayId' - The ID of the local gateway.
--
-- * 'crEgressOnlyInternetGatewayId' - [IPv6 traffic only] The ID of an egress-only internet gateway.
--
-- * 'crCarrierGatewayId' - The ID of the carrier gateway. You can only use this option when the VPC contains a subnet which is associated with a Wavelength Zone.
--
-- * 'crDestinationCidrBlock' - The IPv4 CIDR address block used for the destination match. Routing decisions are based on the most specific match. We modify the specified CIDR block to its canonical form; for example, if you specify @100.68.0.18/18@ , we modify it to @100.68.0.0/18@ .
--
-- * 'crNetworkInterfaceId' - The ID of a network interface.
--
-- * 'crNatGatewayId' - [IPv4 traffic only] The ID of a NAT gateway.
--
-- * 'crGatewayId' - The ID of an internet gateway or virtual private gateway attached to your VPC.
--
-- * 'crTransitGatewayId' - The ID of a transit gateway.
--
-- * 'crRouteTableId' - The ID of the route table for the route.
createRoute ::
  -- | 'crRouteTableId'
  Text ->
  CreateRoute
createRoute pRouteTableId_ =
  CreateRoute'
    { _crInstanceId = Nothing,
      _crVPCPeeringConnectionId = Nothing,
      _crDryRun = Nothing,
      _crVPCEndpointId = Nothing,
      _crDestinationPrefixListId = Nothing,
      _crDestinationIPv6CidrBlock = Nothing,
      _crLocalGatewayId = Nothing,
      _crEgressOnlyInternetGatewayId = Nothing,
      _crCarrierGatewayId = Nothing,
      _crDestinationCidrBlock = Nothing,
      _crNetworkInterfaceId = Nothing,
      _crNatGatewayId = Nothing,
      _crGatewayId = Nothing,
      _crTransitGatewayId = Nothing,
      _crRouteTableId = pRouteTableId_
    }

-- | The ID of a NAT instance in your VPC. The operation fails if you specify an instance ID unless exactly one network interface is attached.
crInstanceId :: Lens' CreateRoute (Maybe Text)
crInstanceId = lens _crInstanceId (\s a -> s {_crInstanceId = a})

-- | The ID of a VPC peering connection.
crVPCPeeringConnectionId :: Lens' CreateRoute (Maybe Text)
crVPCPeeringConnectionId = lens _crVPCPeeringConnectionId (\s a -> s {_crVPCPeeringConnectionId = a})

-- | Checks whether you have the required permissions for the action, without actually making the request, and provides an error response. If you have the required permissions, the error response is @DryRunOperation@ . Otherwise, it is @UnauthorizedOperation@ .
crDryRun :: Lens' CreateRoute (Maybe Bool)
crDryRun = lens _crDryRun (\s a -> s {_crDryRun = a})

-- | The ID of a VPC endpoint. Supported for Gateway Load Balancer endpoints only.
crVPCEndpointId :: Lens' CreateRoute (Maybe Text)
crVPCEndpointId = lens _crVPCEndpointId (\s a -> s {_crVPCEndpointId = a})

-- | The ID of a prefix list used for the destination match.
crDestinationPrefixListId :: Lens' CreateRoute (Maybe Text)
crDestinationPrefixListId = lens _crDestinationPrefixListId (\s a -> s {_crDestinationPrefixListId = a})

-- | The IPv6 CIDR block used for the destination match. Routing decisions are based on the most specific match.
crDestinationIPv6CidrBlock :: Lens' CreateRoute (Maybe Text)
crDestinationIPv6CidrBlock = lens _crDestinationIPv6CidrBlock (\s a -> s {_crDestinationIPv6CidrBlock = a})

-- | The ID of the local gateway.
crLocalGatewayId :: Lens' CreateRoute (Maybe Text)
crLocalGatewayId = lens _crLocalGatewayId (\s a -> s {_crLocalGatewayId = a})

-- | [IPv6 traffic only] The ID of an egress-only internet gateway.
crEgressOnlyInternetGatewayId :: Lens' CreateRoute (Maybe Text)
crEgressOnlyInternetGatewayId = lens _crEgressOnlyInternetGatewayId (\s a -> s {_crEgressOnlyInternetGatewayId = a})

-- | The ID of the carrier gateway. You can only use this option when the VPC contains a subnet which is associated with a Wavelength Zone.
crCarrierGatewayId :: Lens' CreateRoute (Maybe Text)
crCarrierGatewayId = lens _crCarrierGatewayId (\s a -> s {_crCarrierGatewayId = a})

-- | The IPv4 CIDR address block used for the destination match. Routing decisions are based on the most specific match. We modify the specified CIDR block to its canonical form; for example, if you specify @100.68.0.18/18@ , we modify it to @100.68.0.0/18@ .
crDestinationCidrBlock :: Lens' CreateRoute (Maybe Text)
crDestinationCidrBlock = lens _crDestinationCidrBlock (\s a -> s {_crDestinationCidrBlock = a})

-- | The ID of a network interface.
crNetworkInterfaceId :: Lens' CreateRoute (Maybe Text)
crNetworkInterfaceId = lens _crNetworkInterfaceId (\s a -> s {_crNetworkInterfaceId = a})

-- | [IPv4 traffic only] The ID of a NAT gateway.
crNatGatewayId :: Lens' CreateRoute (Maybe Text)
crNatGatewayId = lens _crNatGatewayId (\s a -> s {_crNatGatewayId = a})

-- | The ID of an internet gateway or virtual private gateway attached to your VPC.
crGatewayId :: Lens' CreateRoute (Maybe Text)
crGatewayId = lens _crGatewayId (\s a -> s {_crGatewayId = a})

-- | The ID of a transit gateway.
crTransitGatewayId :: Lens' CreateRoute (Maybe Text)
crTransitGatewayId = lens _crTransitGatewayId (\s a -> s {_crTransitGatewayId = a})

-- | The ID of the route table for the route.
crRouteTableId :: Lens' CreateRoute Text
crRouteTableId = lens _crRouteTableId (\s a -> s {_crRouteTableId = a})

instance AWSRequest CreateRoute where
  type Rs CreateRoute = CreateRouteResponse
  request = postQuery ec2
  response =
    receiveXML
      ( \s h x ->
          CreateRouteResponse'
            <$> (x .@? "return") <*> (pure (fromEnum s))
      )

instance Hashable CreateRoute

instance NFData CreateRoute

instance ToHeaders CreateRoute where
  toHeaders = const mempty

instance ToPath CreateRoute where
  toPath = const "/"

instance ToQuery CreateRoute where
  toQuery CreateRoute' {..} =
    mconcat
      [ "Action" =: ("CreateRoute" :: ByteString),
        "Version" =: ("2016-11-15" :: ByteString),
        "InstanceId" =: _crInstanceId,
        "VpcPeeringConnectionId"
          =: _crVPCPeeringConnectionId,
        "DryRun" =: _crDryRun,
        "VpcEndpointId" =: _crVPCEndpointId,
        "DestinationPrefixListId"
          =: _crDestinationPrefixListId,
        "DestinationIpv6CidrBlock"
          =: _crDestinationIPv6CidrBlock,
        "LocalGatewayId" =: _crLocalGatewayId,
        "EgressOnlyInternetGatewayId"
          =: _crEgressOnlyInternetGatewayId,
        "CarrierGatewayId" =: _crCarrierGatewayId,
        "DestinationCidrBlock" =: _crDestinationCidrBlock,
        "NetworkInterfaceId" =: _crNetworkInterfaceId,
        "NatGatewayId" =: _crNatGatewayId,
        "GatewayId" =: _crGatewayId,
        "TransitGatewayId" =: _crTransitGatewayId,
        "RouteTableId" =: _crRouteTableId
      ]

-- | /See:/ 'createRouteResponse' smart constructor.
data CreateRouteResponse = CreateRouteResponse'
  { _crrrsReturn ::
      !(Maybe Bool),
    _crrrsResponseStatus :: !Int
  }
  deriving (Eq, Read, Show, Data, Typeable, Generic)

-- | Creates a value of 'CreateRouteResponse' with the minimum fields required to make a request.
--
-- Use one of the following lenses to modify other fields as desired:
--
-- * 'crrrsReturn' - Returns @true@ if the request succeeds; otherwise, it returns an error.
--
-- * 'crrrsResponseStatus' - -- | The response status code.
createRouteResponse ::
  -- | 'crrrsResponseStatus'
  Int ->
  CreateRouteResponse
createRouteResponse pResponseStatus_ =
  CreateRouteResponse'
    { _crrrsReturn = Nothing,
      _crrrsResponseStatus = pResponseStatus_
    }

-- | Returns @true@ if the request succeeds; otherwise, it returns an error.
crrrsReturn :: Lens' CreateRouteResponse (Maybe Bool)
crrrsReturn = lens _crrrsReturn (\s a -> s {_crrrsReturn = a})

-- | -- | The response status code.
crrrsResponseStatus :: Lens' CreateRouteResponse Int
crrrsResponseStatus = lens _crrrsResponseStatus (\s a -> s {_crrrsResponseStatus = a})

instance NFData CreateRouteResponse
