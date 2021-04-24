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
-- Module      : Network.AWS.EC2.CreateTransitGatewayConnectPeer
-- Copyright   : (c) 2013-2021 Brendan Hay
-- License     : Mozilla Public License, v. 2.0.
-- Maintainer  : Brendan Hay <brendan.g.hay+amazonka@gmail.com>
-- Stability   : auto-generated
-- Portability : non-portable (GHC extensions)
--
-- Creates a Connect peer for a specified transit gateway Connect attachment between a transit gateway and an appliance.
--
--
-- The peer address and transit gateway address must be the same IP address family (IPv4 or IPv6).
--
-- For more information, see <https://docs.aws.amazon.com/vpc/latest/tgw/tgw-connect.html#tgw-connect-peer Connect peers> in the /Transit Gateways Guide/ .
module Network.AWS.EC2.CreateTransitGatewayConnectPeer
  ( -- * Creating a Request
    createTransitGatewayConnectPeer,
    CreateTransitGatewayConnectPeer,

    -- * Request Lenses
    ctgcpTagSpecifications,
    ctgcpDryRun,
    ctgcpTransitGatewayAddress,
    ctgcpBGPOptions,
    ctgcpTransitGatewayAttachmentId,
    ctgcpPeerAddress,
    ctgcpInsideCidrBlocks,

    -- * Destructuring the Response
    createTransitGatewayConnectPeerResponse,
    CreateTransitGatewayConnectPeerResponse,

    -- * Response Lenses
    ctgcprrsTransitGatewayConnectPeer,
    ctgcprrsResponseStatus,
  )
where

import Network.AWS.EC2.Types
import Network.AWS.Lens
import Network.AWS.Prelude
import Network.AWS.Request
import Network.AWS.Response

-- | /See:/ 'createTransitGatewayConnectPeer' smart constructor.
data CreateTransitGatewayConnectPeer = CreateTransitGatewayConnectPeer'
  { _ctgcpTagSpecifications ::
      !( Maybe
           [TagSpecification]
       ),
    _ctgcpDryRun ::
      !( Maybe
           Bool
       ),
    _ctgcpTransitGatewayAddress ::
      !( Maybe
           Text
       ),
    _ctgcpBGPOptions ::
      !( Maybe
           TransitGatewayConnectRequestBGPOptions
       ),
    _ctgcpTransitGatewayAttachmentId ::
      !Text,
    _ctgcpPeerAddress ::
      !Text,
    _ctgcpInsideCidrBlocks ::
      ![Text]
  }
  deriving
    ( Eq,
      Read,
      Show,
      Data,
      Typeable,
      Generic
    )

-- | Creates a value of 'CreateTransitGatewayConnectPeer' with the minimum fields required to make a request.
--
-- Use one of the following lenses to modify other fields as desired:
--
-- * 'ctgcpTagSpecifications' - The tags to apply to the Connect peer.
--
-- * 'ctgcpDryRun' - Checks whether you have the required permissions for the action, without actually making the request, and provides an error response. If you have the required permissions, the error response is @DryRunOperation@ . Otherwise, it is @UnauthorizedOperation@ .
--
-- * 'ctgcpTransitGatewayAddress' - The peer IP address (GRE outer IP address) on the transit gateway side of the Connect peer, which must be specified from a transit gateway CIDR block. If not specified, Amazon automatically assigns the first available IP address from the transit gateway CIDR block.
--
-- * 'ctgcpBGPOptions' - The BGP options for the Connect peer.
--
-- * 'ctgcpTransitGatewayAttachmentId' - The ID of the Connect attachment.
--
-- * 'ctgcpPeerAddress' - The peer IP address (GRE outer IP address) on the appliance side of the Connect peer.
--
-- * 'ctgcpInsideCidrBlocks' - The range of inside IP addresses that are used for BGP peering. You must specify a size /29 IPv4 CIDR block from the @169.254.0.0/16@ range. The first address from the range must be configured on the appliance as the BGP IP address. You can also optionally specify a size /125 IPv6 CIDR block from the @fd00::/8@ range.
createTransitGatewayConnectPeer ::
  -- | 'ctgcpTransitGatewayAttachmentId'
  Text ->
  -- | 'ctgcpPeerAddress'
  Text ->
  CreateTransitGatewayConnectPeer
createTransitGatewayConnectPeer
  pTransitGatewayAttachmentId_
  pPeerAddress_ =
    CreateTransitGatewayConnectPeer'
      { _ctgcpTagSpecifications =
          Nothing,
        _ctgcpDryRun = Nothing,
        _ctgcpTransitGatewayAddress = Nothing,
        _ctgcpBGPOptions = Nothing,
        _ctgcpTransitGatewayAttachmentId =
          pTransitGatewayAttachmentId_,
        _ctgcpPeerAddress = pPeerAddress_,
        _ctgcpInsideCidrBlocks = mempty
      }

-- | The tags to apply to the Connect peer.
ctgcpTagSpecifications :: Lens' CreateTransitGatewayConnectPeer [TagSpecification]
ctgcpTagSpecifications = lens _ctgcpTagSpecifications (\s a -> s {_ctgcpTagSpecifications = a}) . _Default . _Coerce

-- | Checks whether you have the required permissions for the action, without actually making the request, and provides an error response. If you have the required permissions, the error response is @DryRunOperation@ . Otherwise, it is @UnauthorizedOperation@ .
ctgcpDryRun :: Lens' CreateTransitGatewayConnectPeer (Maybe Bool)
ctgcpDryRun = lens _ctgcpDryRun (\s a -> s {_ctgcpDryRun = a})

-- | The peer IP address (GRE outer IP address) on the transit gateway side of the Connect peer, which must be specified from a transit gateway CIDR block. If not specified, Amazon automatically assigns the first available IP address from the transit gateway CIDR block.
ctgcpTransitGatewayAddress :: Lens' CreateTransitGatewayConnectPeer (Maybe Text)
ctgcpTransitGatewayAddress = lens _ctgcpTransitGatewayAddress (\s a -> s {_ctgcpTransitGatewayAddress = a})

-- | The BGP options for the Connect peer.
ctgcpBGPOptions :: Lens' CreateTransitGatewayConnectPeer (Maybe TransitGatewayConnectRequestBGPOptions)
ctgcpBGPOptions = lens _ctgcpBGPOptions (\s a -> s {_ctgcpBGPOptions = a})

-- | The ID of the Connect attachment.
ctgcpTransitGatewayAttachmentId :: Lens' CreateTransitGatewayConnectPeer Text
ctgcpTransitGatewayAttachmentId = lens _ctgcpTransitGatewayAttachmentId (\s a -> s {_ctgcpTransitGatewayAttachmentId = a})

-- | The peer IP address (GRE outer IP address) on the appliance side of the Connect peer.
ctgcpPeerAddress :: Lens' CreateTransitGatewayConnectPeer Text
ctgcpPeerAddress = lens _ctgcpPeerAddress (\s a -> s {_ctgcpPeerAddress = a})

-- | The range of inside IP addresses that are used for BGP peering. You must specify a size /29 IPv4 CIDR block from the @169.254.0.0/16@ range. The first address from the range must be configured on the appliance as the BGP IP address. You can also optionally specify a size /125 IPv6 CIDR block from the @fd00::/8@ range.
ctgcpInsideCidrBlocks :: Lens' CreateTransitGatewayConnectPeer [Text]
ctgcpInsideCidrBlocks = lens _ctgcpInsideCidrBlocks (\s a -> s {_ctgcpInsideCidrBlocks = a}) . _Coerce

instance AWSRequest CreateTransitGatewayConnectPeer where
  type
    Rs CreateTransitGatewayConnectPeer =
      CreateTransitGatewayConnectPeerResponse
  request = postQuery ec2
  response =
    receiveXML
      ( \s h x ->
          CreateTransitGatewayConnectPeerResponse'
            <$> (x .@? "transitGatewayConnectPeer")
            <*> (pure (fromEnum s))
      )

instance Hashable CreateTransitGatewayConnectPeer

instance NFData CreateTransitGatewayConnectPeer

instance ToHeaders CreateTransitGatewayConnectPeer where
  toHeaders = const mempty

instance ToPath CreateTransitGatewayConnectPeer where
  toPath = const "/"

instance ToQuery CreateTransitGatewayConnectPeer where
  toQuery CreateTransitGatewayConnectPeer' {..} =
    mconcat
      [ "Action"
          =: ("CreateTransitGatewayConnectPeer" :: ByteString),
        "Version" =: ("2016-11-15" :: ByteString),
        toQuery
          ( toQueryList "TagSpecification"
              <$> _ctgcpTagSpecifications
          ),
        "DryRun" =: _ctgcpDryRun,
        "TransitGatewayAddress"
          =: _ctgcpTransitGatewayAddress,
        "BgpOptions" =: _ctgcpBGPOptions,
        "TransitGatewayAttachmentId"
          =: _ctgcpTransitGatewayAttachmentId,
        "PeerAddress" =: _ctgcpPeerAddress,
        toQueryList
          "InsideCidrBlocks"
          _ctgcpInsideCidrBlocks
      ]

-- | /See:/ 'createTransitGatewayConnectPeerResponse' smart constructor.
data CreateTransitGatewayConnectPeerResponse = CreateTransitGatewayConnectPeerResponse'
  { _ctgcprrsTransitGatewayConnectPeer ::
      !( Maybe
           TransitGatewayConnectPeer
       ),
    _ctgcprrsResponseStatus ::
      !Int
  }
  deriving
    ( Eq,
      Read,
      Show,
      Data,
      Typeable,
      Generic
    )

-- | Creates a value of 'CreateTransitGatewayConnectPeerResponse' with the minimum fields required to make a request.
--
-- Use one of the following lenses to modify other fields as desired:
--
-- * 'ctgcprrsTransitGatewayConnectPeer' - Information about the Connect peer.
--
-- * 'ctgcprrsResponseStatus' - -- | The response status code.
createTransitGatewayConnectPeerResponse ::
  -- | 'ctgcprrsResponseStatus'
  Int ->
  CreateTransitGatewayConnectPeerResponse
createTransitGatewayConnectPeerResponse
  pResponseStatus_ =
    CreateTransitGatewayConnectPeerResponse'
      { _ctgcprrsTransitGatewayConnectPeer =
          Nothing,
        _ctgcprrsResponseStatus =
          pResponseStatus_
      }

-- | Information about the Connect peer.
ctgcprrsTransitGatewayConnectPeer :: Lens' CreateTransitGatewayConnectPeerResponse (Maybe TransitGatewayConnectPeer)
ctgcprrsTransitGatewayConnectPeer = lens _ctgcprrsTransitGatewayConnectPeer (\s a -> s {_ctgcprrsTransitGatewayConnectPeer = a})

-- | -- | The response status code.
ctgcprrsResponseStatus :: Lens' CreateTransitGatewayConnectPeerResponse Int
ctgcprrsResponseStatus = lens _ctgcprrsResponseStatus (\s a -> s {_ctgcprrsResponseStatus = a})

instance
  NFData
    CreateTransitGatewayConnectPeerResponse
