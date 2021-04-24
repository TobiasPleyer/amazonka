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
-- Module      : Network.AWS.EC2.RejectTransitGatewayVPCAttachment
-- Copyright   : (c) 2013-2021 Brendan Hay
-- License     : Mozilla Public License, v. 2.0.
-- Maintainer  : Brendan Hay <brendan.g.hay+amazonka@gmail.com>
-- Stability   : auto-generated
-- Portability : non-portable (GHC extensions)
--
-- Rejects a request to attach a VPC to a transit gateway.
--
--
-- The VPC attachment must be in the @pendingAcceptance@ state. Use 'DescribeTransitGatewayVpcAttachments' to view your pending VPC attachment requests. Use 'AcceptTransitGatewayVpcAttachment' to accept a VPC attachment request.
module Network.AWS.EC2.RejectTransitGatewayVPCAttachment
  ( -- * Creating a Request
    rejectTransitGatewayVPCAttachment,
    RejectTransitGatewayVPCAttachment,

    -- * Request Lenses
    rtgvaDryRun,
    rtgvaTransitGatewayAttachmentId,

    -- * Destructuring the Response
    rejectTransitGatewayVPCAttachmentResponse,
    RejectTransitGatewayVPCAttachmentResponse,

    -- * Response Lenses
    rtgvarrsTransitGatewayVPCAttachment,
    rtgvarrsResponseStatus,
  )
where

import Network.AWS.EC2.Types
import Network.AWS.Lens
import Network.AWS.Prelude
import Network.AWS.Request
import Network.AWS.Response

-- | /See:/ 'rejectTransitGatewayVPCAttachment' smart constructor.
data RejectTransitGatewayVPCAttachment = RejectTransitGatewayVPCAttachment'
  { _rtgvaDryRun ::
      !( Maybe
           Bool
       ),
    _rtgvaTransitGatewayAttachmentId ::
      !Text
  }
  deriving
    ( Eq,
      Read,
      Show,
      Data,
      Typeable,
      Generic
    )

-- | Creates a value of 'RejectTransitGatewayVPCAttachment' with the minimum fields required to make a request.
--
-- Use one of the following lenses to modify other fields as desired:
--
-- * 'rtgvaDryRun' - Checks whether you have the required permissions for the action, without actually making the request, and provides an error response. If you have the required permissions, the error response is @DryRunOperation@ . Otherwise, it is @UnauthorizedOperation@ .
--
-- * 'rtgvaTransitGatewayAttachmentId' - The ID of the attachment.
rejectTransitGatewayVPCAttachment ::
  -- | 'rtgvaTransitGatewayAttachmentId'
  Text ->
  RejectTransitGatewayVPCAttachment
rejectTransitGatewayVPCAttachment
  pTransitGatewayAttachmentId_ =
    RejectTransitGatewayVPCAttachment'
      { _rtgvaDryRun =
          Nothing,
        _rtgvaTransitGatewayAttachmentId =
          pTransitGatewayAttachmentId_
      }

-- | Checks whether you have the required permissions for the action, without actually making the request, and provides an error response. If you have the required permissions, the error response is @DryRunOperation@ . Otherwise, it is @UnauthorizedOperation@ .
rtgvaDryRun :: Lens' RejectTransitGatewayVPCAttachment (Maybe Bool)
rtgvaDryRun = lens _rtgvaDryRun (\s a -> s {_rtgvaDryRun = a})

-- | The ID of the attachment.
rtgvaTransitGatewayAttachmentId :: Lens' RejectTransitGatewayVPCAttachment Text
rtgvaTransitGatewayAttachmentId = lens _rtgvaTransitGatewayAttachmentId (\s a -> s {_rtgvaTransitGatewayAttachmentId = a})

instance AWSRequest RejectTransitGatewayVPCAttachment where
  type
    Rs RejectTransitGatewayVPCAttachment =
      RejectTransitGatewayVPCAttachmentResponse
  request = postQuery ec2
  response =
    receiveXML
      ( \s h x ->
          RejectTransitGatewayVPCAttachmentResponse'
            <$> (x .@? "transitGatewayVpcAttachment")
            <*> (pure (fromEnum s))
      )

instance Hashable RejectTransitGatewayVPCAttachment

instance NFData RejectTransitGatewayVPCAttachment

instance ToHeaders RejectTransitGatewayVPCAttachment where
  toHeaders = const mempty

instance ToPath RejectTransitGatewayVPCAttachment where
  toPath = const "/"

instance ToQuery RejectTransitGatewayVPCAttachment where
  toQuery RejectTransitGatewayVPCAttachment' {..} =
    mconcat
      [ "Action"
          =: ("RejectTransitGatewayVpcAttachment" :: ByteString),
        "Version" =: ("2016-11-15" :: ByteString),
        "DryRun" =: _rtgvaDryRun,
        "TransitGatewayAttachmentId"
          =: _rtgvaTransitGatewayAttachmentId
      ]

-- | /See:/ 'rejectTransitGatewayVPCAttachmentResponse' smart constructor.
data RejectTransitGatewayVPCAttachmentResponse = RejectTransitGatewayVPCAttachmentResponse'
  { _rtgvarrsTransitGatewayVPCAttachment ::
      !( Maybe
           TransitGatewayVPCAttachment
       ),
    _rtgvarrsResponseStatus ::
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

-- | Creates a value of 'RejectTransitGatewayVPCAttachmentResponse' with the minimum fields required to make a request.
--
-- Use one of the following lenses to modify other fields as desired:
--
-- * 'rtgvarrsTransitGatewayVPCAttachment' - Information about the attachment.
--
-- * 'rtgvarrsResponseStatus' - -- | The response status code.
rejectTransitGatewayVPCAttachmentResponse ::
  -- | 'rtgvarrsResponseStatus'
  Int ->
  RejectTransitGatewayVPCAttachmentResponse
rejectTransitGatewayVPCAttachmentResponse
  pResponseStatus_ =
    RejectTransitGatewayVPCAttachmentResponse'
      { _rtgvarrsTransitGatewayVPCAttachment =
          Nothing,
        _rtgvarrsResponseStatus =
          pResponseStatus_
      }

-- | Information about the attachment.
rtgvarrsTransitGatewayVPCAttachment :: Lens' RejectTransitGatewayVPCAttachmentResponse (Maybe TransitGatewayVPCAttachment)
rtgvarrsTransitGatewayVPCAttachment = lens _rtgvarrsTransitGatewayVPCAttachment (\s a -> s {_rtgvarrsTransitGatewayVPCAttachment = a})

-- | -- | The response status code.
rtgvarrsResponseStatus :: Lens' RejectTransitGatewayVPCAttachmentResponse Int
rtgvarrsResponseStatus = lens _rtgvarrsResponseStatus (\s a -> s {_rtgvarrsResponseStatus = a})

instance
  NFData
    RejectTransitGatewayVPCAttachmentResponse
