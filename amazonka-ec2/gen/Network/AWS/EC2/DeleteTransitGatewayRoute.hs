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
-- Module      : Network.AWS.EC2.DeleteTransitGatewayRoute
-- Copyright   : (c) 2013-2021 Brendan Hay
-- License     : Mozilla Public License, v. 2.0.
-- Maintainer  : Brendan Hay <brendan.g.hay+amazonka@gmail.com>
-- Stability   : auto-generated
-- Portability : non-portable (GHC extensions)
--
-- Deletes the specified route from the specified transit gateway route table.
module Network.AWS.EC2.DeleteTransitGatewayRoute
  ( -- * Creating a Request
    deleteTransitGatewayRoute,
    DeleteTransitGatewayRoute,

    -- * Request Lenses
    dtgrDryRun,
    dtgrTransitGatewayRouteTableId,
    dtgrDestinationCidrBlock,

    -- * Destructuring the Response
    deleteTransitGatewayRouteResponse,
    DeleteTransitGatewayRouteResponse,

    -- * Response Lenses
    dtgrrrsRoute,
    dtgrrrsResponseStatus,
  )
where

import Network.AWS.EC2.Types
import Network.AWS.Lens
import Network.AWS.Prelude
import Network.AWS.Request
import Network.AWS.Response

-- | /See:/ 'deleteTransitGatewayRoute' smart constructor.
data DeleteTransitGatewayRoute = DeleteTransitGatewayRoute'
  { _dtgrDryRun ::
      !(Maybe Bool),
    _dtgrTransitGatewayRouteTableId ::
      !Text,
    _dtgrDestinationCidrBlock ::
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

-- | Creates a value of 'DeleteTransitGatewayRoute' with the minimum fields required to make a request.
--
-- Use one of the following lenses to modify other fields as desired:
--
-- * 'dtgrDryRun' - Checks whether you have the required permissions for the action, without actually making the request, and provides an error response. If you have the required permissions, the error response is @DryRunOperation@ . Otherwise, it is @UnauthorizedOperation@ .
--
-- * 'dtgrTransitGatewayRouteTableId' - The ID of the transit gateway route table.
--
-- * 'dtgrDestinationCidrBlock' - The CIDR range for the route. This must match the CIDR for the route exactly.
deleteTransitGatewayRoute ::
  -- | 'dtgrTransitGatewayRouteTableId'
  Text ->
  -- | 'dtgrDestinationCidrBlock'
  Text ->
  DeleteTransitGatewayRoute
deleteTransitGatewayRoute
  pTransitGatewayRouteTableId_
  pDestinationCidrBlock_ =
    DeleteTransitGatewayRoute'
      { _dtgrDryRun = Nothing,
        _dtgrTransitGatewayRouteTableId =
          pTransitGatewayRouteTableId_,
        _dtgrDestinationCidrBlock =
          pDestinationCidrBlock_
      }

-- | Checks whether you have the required permissions for the action, without actually making the request, and provides an error response. If you have the required permissions, the error response is @DryRunOperation@ . Otherwise, it is @UnauthorizedOperation@ .
dtgrDryRun :: Lens' DeleteTransitGatewayRoute (Maybe Bool)
dtgrDryRun = lens _dtgrDryRun (\s a -> s {_dtgrDryRun = a})

-- | The ID of the transit gateway route table.
dtgrTransitGatewayRouteTableId :: Lens' DeleteTransitGatewayRoute Text
dtgrTransitGatewayRouteTableId = lens _dtgrTransitGatewayRouteTableId (\s a -> s {_dtgrTransitGatewayRouteTableId = a})

-- | The CIDR range for the route. This must match the CIDR for the route exactly.
dtgrDestinationCidrBlock :: Lens' DeleteTransitGatewayRoute Text
dtgrDestinationCidrBlock = lens _dtgrDestinationCidrBlock (\s a -> s {_dtgrDestinationCidrBlock = a})

instance AWSRequest DeleteTransitGatewayRoute where
  type
    Rs DeleteTransitGatewayRoute =
      DeleteTransitGatewayRouteResponse
  request = postQuery ec2
  response =
    receiveXML
      ( \s h x ->
          DeleteTransitGatewayRouteResponse'
            <$> (x .@? "route") <*> (pure (fromEnum s))
      )

instance Hashable DeleteTransitGatewayRoute

instance NFData DeleteTransitGatewayRoute

instance ToHeaders DeleteTransitGatewayRoute where
  toHeaders = const mempty

instance ToPath DeleteTransitGatewayRoute where
  toPath = const "/"

instance ToQuery DeleteTransitGatewayRoute where
  toQuery DeleteTransitGatewayRoute' {..} =
    mconcat
      [ "Action"
          =: ("DeleteTransitGatewayRoute" :: ByteString),
        "Version" =: ("2016-11-15" :: ByteString),
        "DryRun" =: _dtgrDryRun,
        "TransitGatewayRouteTableId"
          =: _dtgrTransitGatewayRouteTableId,
        "DestinationCidrBlock" =: _dtgrDestinationCidrBlock
      ]

-- | /See:/ 'deleteTransitGatewayRouteResponse' smart constructor.
data DeleteTransitGatewayRouteResponse = DeleteTransitGatewayRouteResponse'
  { _dtgrrrsRoute ::
      !( Maybe
           TransitGatewayRoute
       ),
    _dtgrrrsResponseStatus ::
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

-- | Creates a value of 'DeleteTransitGatewayRouteResponse' with the minimum fields required to make a request.
--
-- Use one of the following lenses to modify other fields as desired:
--
-- * 'dtgrrrsRoute' - Information about the route.
--
-- * 'dtgrrrsResponseStatus' - -- | The response status code.
deleteTransitGatewayRouteResponse ::
  -- | 'dtgrrrsResponseStatus'
  Int ->
  DeleteTransitGatewayRouteResponse
deleteTransitGatewayRouteResponse pResponseStatus_ =
  DeleteTransitGatewayRouteResponse'
    { _dtgrrrsRoute =
        Nothing,
      _dtgrrrsResponseStatus =
        pResponseStatus_
    }

-- | Information about the route.
dtgrrrsRoute :: Lens' DeleteTransitGatewayRouteResponse (Maybe TransitGatewayRoute)
dtgrrrsRoute = lens _dtgrrrsRoute (\s a -> s {_dtgrrrsRoute = a})

-- | -- | The response status code.
dtgrrrsResponseStatus :: Lens' DeleteTransitGatewayRouteResponse Int
dtgrrrsResponseStatus = lens _dtgrrrsResponseStatus (\s a -> s {_dtgrrrsResponseStatus = a})

instance NFData DeleteTransitGatewayRouteResponse
