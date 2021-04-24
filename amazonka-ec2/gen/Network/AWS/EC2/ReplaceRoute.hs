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
-- Module      : Network.AWS.EC2.ReplaceRoute
-- Copyright   : (c) 2013-2021 Brendan Hay
-- License     : Mozilla Public License, v. 2.0.
-- Maintainer  : Brendan Hay <brendan.g.hay+amazonka@gmail.com>
-- Stability   : auto-generated
-- Portability : non-portable (GHC extensions)
--
-- Replaces an existing route within a route table in a VPC. You must provide only one of the following: internet gateway, virtual private gateway, NAT instance, NAT gateway, VPC peering connection, network interface, egress-only internet gateway, or transit gateway.
--
--
-- For more information, see <https://docs.aws.amazon.com/vpc/latest/userguide/VPC_Route_Tables.html Route Tables> in the /Amazon Virtual Private Cloud User Guide/ .
module Network.AWS.EC2.ReplaceRoute
  ( -- * Creating a Request
    replaceRoute,
    ReplaceRoute,

    -- * Request Lenses
    rrInstanceId,
    rrLocalTarget,
    rrVPCPeeringConnectionId,
    rrDryRun,
    rrVPCEndpointId,
    rrDestinationPrefixListId,
    rrDestinationIPv6CidrBlock,
    rrLocalGatewayId,
    rrEgressOnlyInternetGatewayId,
    rrCarrierGatewayId,
    rrDestinationCidrBlock,
    rrNetworkInterfaceId,
    rrNatGatewayId,
    rrGatewayId,
    rrTransitGatewayId,
    rrRouteTableId,

    -- * Destructuring the Response
    replaceRouteResponse,
    ReplaceRouteResponse,
  )
where

import Network.AWS.EC2.Types
import Network.AWS.Lens
import Network.AWS.Prelude
import Network.AWS.Request
import Network.AWS.Response

-- | /See:/ 'replaceRoute' smart constructor.
data ReplaceRoute = ReplaceRoute'
  { _rrInstanceId ::
      !(Maybe Text),
    _rrLocalTarget :: !(Maybe Bool),
    _rrVPCPeeringConnectionId :: !(Maybe Text),
    _rrDryRun :: !(Maybe Bool),
    _rrVPCEndpointId :: !(Maybe Text),
    _rrDestinationPrefixListId :: !(Maybe Text),
    _rrDestinationIPv6CidrBlock :: !(Maybe Text),
    _rrLocalGatewayId :: !(Maybe Text),
    _rrEgressOnlyInternetGatewayId ::
      !(Maybe Text),
    _rrCarrierGatewayId :: !(Maybe Text),
    _rrDestinationCidrBlock :: !(Maybe Text),
    _rrNetworkInterfaceId :: !(Maybe Text),
    _rrNatGatewayId :: !(Maybe Text),
    _rrGatewayId :: !(Maybe Text),
    _rrTransitGatewayId :: !(Maybe Text),
    _rrRouteTableId :: !Text
  }
  deriving (Eq, Read, Show, Data, Typeable, Generic)

-- | Creates a value of 'ReplaceRoute' with the minimum fields required to make a request.
--
-- Use one of the following lenses to modify other fields as desired:
--
-- * 'rrInstanceId' - The ID of a NAT instance in your VPC.
--
-- * 'rrLocalTarget' - Specifies whether to reset the local route to its default target (@local@ ).
--
-- * 'rrVPCPeeringConnectionId' - The ID of a VPC peering connection.
--
-- * 'rrDryRun' - Checks whether you have the required permissions for the action, without actually making the request, and provides an error response. If you have the required permissions, the error response is @DryRunOperation@ . Otherwise, it is @UnauthorizedOperation@ .
--
-- * 'rrVPCEndpointId' - The ID of a VPC endpoint. Supported for Gateway Load Balancer endpoints only.
--
-- * 'rrDestinationPrefixListId' - The ID of the prefix list for the route.
--
-- * 'rrDestinationIPv6CidrBlock' - The IPv6 CIDR address block used for the destination match. The value that you provide must match the CIDR of an existing route in the table.
--
-- * 'rrLocalGatewayId' - The ID of the local gateway.
--
-- * 'rrEgressOnlyInternetGatewayId' - [IPv6 traffic only] The ID of an egress-only internet gateway.
--
-- * 'rrCarrierGatewayId' - [IPv4 traffic only] The ID of a carrier gateway.
--
-- * 'rrDestinationCidrBlock' - The IPv4 CIDR address block used for the destination match. The value that you provide must match the CIDR of an existing route in the table.
--
-- * 'rrNetworkInterfaceId' - The ID of a network interface.
--
-- * 'rrNatGatewayId' - [IPv4 traffic only] The ID of a NAT gateway.
--
-- * 'rrGatewayId' - The ID of an internet gateway or virtual private gateway.
--
-- * 'rrTransitGatewayId' - The ID of a transit gateway.
--
-- * 'rrRouteTableId' - The ID of the route table.
replaceRoute ::
  -- | 'rrRouteTableId'
  Text ->
  ReplaceRoute
replaceRoute pRouteTableId_ =
  ReplaceRoute'
    { _rrInstanceId = Nothing,
      _rrLocalTarget = Nothing,
      _rrVPCPeeringConnectionId = Nothing,
      _rrDryRun = Nothing,
      _rrVPCEndpointId = Nothing,
      _rrDestinationPrefixListId = Nothing,
      _rrDestinationIPv6CidrBlock = Nothing,
      _rrLocalGatewayId = Nothing,
      _rrEgressOnlyInternetGatewayId = Nothing,
      _rrCarrierGatewayId = Nothing,
      _rrDestinationCidrBlock = Nothing,
      _rrNetworkInterfaceId = Nothing,
      _rrNatGatewayId = Nothing,
      _rrGatewayId = Nothing,
      _rrTransitGatewayId = Nothing,
      _rrRouteTableId = pRouteTableId_
    }

-- | The ID of a NAT instance in your VPC.
rrInstanceId :: Lens' ReplaceRoute (Maybe Text)
rrInstanceId = lens _rrInstanceId (\s a -> s {_rrInstanceId = a})

-- | Specifies whether to reset the local route to its default target (@local@ ).
rrLocalTarget :: Lens' ReplaceRoute (Maybe Bool)
rrLocalTarget = lens _rrLocalTarget (\s a -> s {_rrLocalTarget = a})

-- | The ID of a VPC peering connection.
rrVPCPeeringConnectionId :: Lens' ReplaceRoute (Maybe Text)
rrVPCPeeringConnectionId = lens _rrVPCPeeringConnectionId (\s a -> s {_rrVPCPeeringConnectionId = a})

-- | Checks whether you have the required permissions for the action, without actually making the request, and provides an error response. If you have the required permissions, the error response is @DryRunOperation@ . Otherwise, it is @UnauthorizedOperation@ .
rrDryRun :: Lens' ReplaceRoute (Maybe Bool)
rrDryRun = lens _rrDryRun (\s a -> s {_rrDryRun = a})

-- | The ID of a VPC endpoint. Supported for Gateway Load Balancer endpoints only.
rrVPCEndpointId :: Lens' ReplaceRoute (Maybe Text)
rrVPCEndpointId = lens _rrVPCEndpointId (\s a -> s {_rrVPCEndpointId = a})

-- | The ID of the prefix list for the route.
rrDestinationPrefixListId :: Lens' ReplaceRoute (Maybe Text)
rrDestinationPrefixListId = lens _rrDestinationPrefixListId (\s a -> s {_rrDestinationPrefixListId = a})

-- | The IPv6 CIDR address block used for the destination match. The value that you provide must match the CIDR of an existing route in the table.
rrDestinationIPv6CidrBlock :: Lens' ReplaceRoute (Maybe Text)
rrDestinationIPv6CidrBlock = lens _rrDestinationIPv6CidrBlock (\s a -> s {_rrDestinationIPv6CidrBlock = a})

-- | The ID of the local gateway.
rrLocalGatewayId :: Lens' ReplaceRoute (Maybe Text)
rrLocalGatewayId = lens _rrLocalGatewayId (\s a -> s {_rrLocalGatewayId = a})

-- | [IPv6 traffic only] The ID of an egress-only internet gateway.
rrEgressOnlyInternetGatewayId :: Lens' ReplaceRoute (Maybe Text)
rrEgressOnlyInternetGatewayId = lens _rrEgressOnlyInternetGatewayId (\s a -> s {_rrEgressOnlyInternetGatewayId = a})

-- | [IPv4 traffic only] The ID of a carrier gateway.
rrCarrierGatewayId :: Lens' ReplaceRoute (Maybe Text)
rrCarrierGatewayId = lens _rrCarrierGatewayId (\s a -> s {_rrCarrierGatewayId = a})

-- | The IPv4 CIDR address block used for the destination match. The value that you provide must match the CIDR of an existing route in the table.
rrDestinationCidrBlock :: Lens' ReplaceRoute (Maybe Text)
rrDestinationCidrBlock = lens _rrDestinationCidrBlock (\s a -> s {_rrDestinationCidrBlock = a})

-- | The ID of a network interface.
rrNetworkInterfaceId :: Lens' ReplaceRoute (Maybe Text)
rrNetworkInterfaceId = lens _rrNetworkInterfaceId (\s a -> s {_rrNetworkInterfaceId = a})

-- | [IPv4 traffic only] The ID of a NAT gateway.
rrNatGatewayId :: Lens' ReplaceRoute (Maybe Text)
rrNatGatewayId = lens _rrNatGatewayId (\s a -> s {_rrNatGatewayId = a})

-- | The ID of an internet gateway or virtual private gateway.
rrGatewayId :: Lens' ReplaceRoute (Maybe Text)
rrGatewayId = lens _rrGatewayId (\s a -> s {_rrGatewayId = a})

-- | The ID of a transit gateway.
rrTransitGatewayId :: Lens' ReplaceRoute (Maybe Text)
rrTransitGatewayId = lens _rrTransitGatewayId (\s a -> s {_rrTransitGatewayId = a})

-- | The ID of the route table.
rrRouteTableId :: Lens' ReplaceRoute Text
rrRouteTableId = lens _rrRouteTableId (\s a -> s {_rrRouteTableId = a})

instance AWSRequest ReplaceRoute where
  type Rs ReplaceRoute = ReplaceRouteResponse
  request = postQuery ec2
  response = receiveNull ReplaceRouteResponse'

instance Hashable ReplaceRoute

instance NFData ReplaceRoute

instance ToHeaders ReplaceRoute where
  toHeaders = const mempty

instance ToPath ReplaceRoute where
  toPath = const "/"

instance ToQuery ReplaceRoute where
  toQuery ReplaceRoute' {..} =
    mconcat
      [ "Action" =: ("ReplaceRoute" :: ByteString),
        "Version" =: ("2016-11-15" :: ByteString),
        "InstanceId" =: _rrInstanceId,
        "LocalTarget" =: _rrLocalTarget,
        "VpcPeeringConnectionId"
          =: _rrVPCPeeringConnectionId,
        "DryRun" =: _rrDryRun,
        "VpcEndpointId" =: _rrVPCEndpointId,
        "DestinationPrefixListId"
          =: _rrDestinationPrefixListId,
        "DestinationIpv6CidrBlock"
          =: _rrDestinationIPv6CidrBlock,
        "LocalGatewayId" =: _rrLocalGatewayId,
        "EgressOnlyInternetGatewayId"
          =: _rrEgressOnlyInternetGatewayId,
        "CarrierGatewayId" =: _rrCarrierGatewayId,
        "DestinationCidrBlock" =: _rrDestinationCidrBlock,
        "NetworkInterfaceId" =: _rrNetworkInterfaceId,
        "NatGatewayId" =: _rrNatGatewayId,
        "GatewayId" =: _rrGatewayId,
        "TransitGatewayId" =: _rrTransitGatewayId,
        "RouteTableId" =: _rrRouteTableId
      ]

-- | /See:/ 'replaceRouteResponse' smart constructor.
data ReplaceRouteResponse = ReplaceRouteResponse'
  deriving (Eq, Read, Show, Data, Typeable, Generic)

-- | Creates a value of 'ReplaceRouteResponse' with the minimum fields required to make a request.
replaceRouteResponse ::
  ReplaceRouteResponse
replaceRouteResponse = ReplaceRouteResponse'

instance NFData ReplaceRouteResponse
