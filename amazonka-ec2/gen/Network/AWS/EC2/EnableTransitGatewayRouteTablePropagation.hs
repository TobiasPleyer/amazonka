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
-- Module      : Network.AWS.EC2.EnableTransitGatewayRouteTablePropagation
-- Copyright   : (c) 2013-2021 Brendan Hay
-- License     : Mozilla Public License, v. 2.0.
-- Maintainer  : Brendan Hay <brendan.g.hay+amazonka@gmail.com>
-- Stability   : auto-generated
-- Portability : non-portable (GHC extensions)
--
-- Enables the specified attachment to propagate routes to the specified propagation route table.
module Network.AWS.EC2.EnableTransitGatewayRouteTablePropagation
  ( -- * Creating a Request
    enableTransitGatewayRouteTablePropagation,
    EnableTransitGatewayRouteTablePropagation,

    -- * Request Lenses
    etgrtpDryRun,
    etgrtpTransitGatewayRouteTableId,
    etgrtpTransitGatewayAttachmentId,

    -- * Destructuring the Response
    enableTransitGatewayRouteTablePropagationResponse,
    EnableTransitGatewayRouteTablePropagationResponse,

    -- * Response Lenses
    etgrtprrsPropagation,
    etgrtprrsResponseStatus,
  )
where

import Network.AWS.EC2.Types
import Network.AWS.Lens
import Network.AWS.Prelude
import Network.AWS.Request
import Network.AWS.Response

-- | /See:/ 'enableTransitGatewayRouteTablePropagation' smart constructor.
data EnableTransitGatewayRouteTablePropagation = EnableTransitGatewayRouteTablePropagation'
  { _etgrtpDryRun ::
      !( Maybe
           Bool
       ),
    _etgrtpTransitGatewayRouteTableId ::
      !Text,
    _etgrtpTransitGatewayAttachmentId ::
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

-- | Creates a value of 'EnableTransitGatewayRouteTablePropagation' with the minimum fields required to make a request.
--
-- Use one of the following lenses to modify other fields as desired:
--
-- * 'etgrtpDryRun' - Checks whether you have the required permissions for the action, without actually making the request, and provides an error response. If you have the required permissions, the error response is @DryRunOperation@ . Otherwise, it is @UnauthorizedOperation@ .
--
-- * 'etgrtpTransitGatewayRouteTableId' - The ID of the propagation route table.
--
-- * 'etgrtpTransitGatewayAttachmentId' - The ID of the attachment.
enableTransitGatewayRouteTablePropagation ::
  -- | 'etgrtpTransitGatewayRouteTableId'
  Text ->
  -- | 'etgrtpTransitGatewayAttachmentId'
  Text ->
  EnableTransitGatewayRouteTablePropagation
enableTransitGatewayRouteTablePropagation
  pTransitGatewayRouteTableId_
  pTransitGatewayAttachmentId_ =
    EnableTransitGatewayRouteTablePropagation'
      { _etgrtpDryRun =
          Nothing,
        _etgrtpTransitGatewayRouteTableId =
          pTransitGatewayRouteTableId_,
        _etgrtpTransitGatewayAttachmentId =
          pTransitGatewayAttachmentId_
      }

-- | Checks whether you have the required permissions for the action, without actually making the request, and provides an error response. If you have the required permissions, the error response is @DryRunOperation@ . Otherwise, it is @UnauthorizedOperation@ .
etgrtpDryRun :: Lens' EnableTransitGatewayRouteTablePropagation (Maybe Bool)
etgrtpDryRun = lens _etgrtpDryRun (\s a -> s {_etgrtpDryRun = a})

-- | The ID of the propagation route table.
etgrtpTransitGatewayRouteTableId :: Lens' EnableTransitGatewayRouteTablePropagation Text
etgrtpTransitGatewayRouteTableId = lens _etgrtpTransitGatewayRouteTableId (\s a -> s {_etgrtpTransitGatewayRouteTableId = a})

-- | The ID of the attachment.
etgrtpTransitGatewayAttachmentId :: Lens' EnableTransitGatewayRouteTablePropagation Text
etgrtpTransitGatewayAttachmentId = lens _etgrtpTransitGatewayAttachmentId (\s a -> s {_etgrtpTransitGatewayAttachmentId = a})

instance
  AWSRequest
    EnableTransitGatewayRouteTablePropagation
  where
  type
    Rs EnableTransitGatewayRouteTablePropagation =
      EnableTransitGatewayRouteTablePropagationResponse
  request = postQuery ec2
  response =
    receiveXML
      ( \s h x ->
          EnableTransitGatewayRouteTablePropagationResponse'
            <$> (x .@? "propagation") <*> (pure (fromEnum s))
      )

instance
  Hashable
    EnableTransitGatewayRouteTablePropagation

instance
  NFData
    EnableTransitGatewayRouteTablePropagation

instance
  ToHeaders
    EnableTransitGatewayRouteTablePropagation
  where
  toHeaders = const mempty

instance
  ToPath
    EnableTransitGatewayRouteTablePropagation
  where
  toPath = const "/"

instance
  ToQuery
    EnableTransitGatewayRouteTablePropagation
  where
  toQuery
    EnableTransitGatewayRouteTablePropagation' {..} =
      mconcat
        [ "Action"
            =: ( "EnableTransitGatewayRouteTablePropagation" ::
                   ByteString
               ),
          "Version" =: ("2016-11-15" :: ByteString),
          "DryRun" =: _etgrtpDryRun,
          "TransitGatewayRouteTableId"
            =: _etgrtpTransitGatewayRouteTableId,
          "TransitGatewayAttachmentId"
            =: _etgrtpTransitGatewayAttachmentId
        ]

-- | /See:/ 'enableTransitGatewayRouteTablePropagationResponse' smart constructor.
data EnableTransitGatewayRouteTablePropagationResponse = EnableTransitGatewayRouteTablePropagationResponse'
  { _etgrtprrsPropagation ::
      !( Maybe
           TransitGatewayPropagation
       ),
    _etgrtprrsResponseStatus ::
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

-- | Creates a value of 'EnableTransitGatewayRouteTablePropagationResponse' with the minimum fields required to make a request.
--
-- Use one of the following lenses to modify other fields as desired:
--
-- * 'etgrtprrsPropagation' - Information about route propagation.
--
-- * 'etgrtprrsResponseStatus' - -- | The response status code.
enableTransitGatewayRouteTablePropagationResponse ::
  -- | 'etgrtprrsResponseStatus'
  Int ->
  EnableTransitGatewayRouteTablePropagationResponse
enableTransitGatewayRouteTablePropagationResponse
  pResponseStatus_ =
    EnableTransitGatewayRouteTablePropagationResponse'
      { _etgrtprrsPropagation =
          Nothing,
        _etgrtprrsResponseStatus =
          pResponseStatus_
      }

-- | Information about route propagation.
etgrtprrsPropagation :: Lens' EnableTransitGatewayRouteTablePropagationResponse (Maybe TransitGatewayPropagation)
etgrtprrsPropagation = lens _etgrtprrsPropagation (\s a -> s {_etgrtprrsPropagation = a})

-- | -- | The response status code.
etgrtprrsResponseStatus :: Lens' EnableTransitGatewayRouteTablePropagationResponse Int
etgrtprrsResponseStatus = lens _etgrtprrsResponseStatus (\s a -> s {_etgrtprrsResponseStatus = a})

instance
  NFData
    EnableTransitGatewayRouteTablePropagationResponse
