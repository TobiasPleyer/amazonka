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
-- Module      : Network.AWS.EC2.DeleteVPNConnection
-- Copyright   : (c) 2013-2021 Brendan Hay
-- License     : Mozilla Public License, v. 2.0.
-- Maintainer  : Brendan Hay <brendan.g.hay+amazonka@gmail.com>
-- Stability   : auto-generated
-- Portability : non-portable (GHC extensions)
--
-- Deletes the specified VPN connection.
--
--
-- If you're deleting the VPC and its associated components, we recommend that you detach the virtual private gateway from the VPC and delete the VPC before deleting the VPN connection. If you believe that the tunnel credentials for your VPN connection have been compromised, you can delete the VPN connection and create a new one that has new keys, without needing to delete the VPC or virtual private gateway. If you create a new VPN connection, you must reconfigure the customer gateway device using the new configuration information returned with the new VPN connection ID.
--
-- For certificate-based authentication, delete all AWS Certificate Manager (ACM) private certificates used for the AWS-side tunnel endpoints for the VPN connection before deleting the VPN connection.
module Network.AWS.EC2.DeleteVPNConnection
  ( -- * Creating a Request
    deleteVPNConnection,
    DeleteVPNConnection,

    -- * Request Lenses
    dvpncDryRun,
    dvpncVPNConnectionId,

    -- * Destructuring the Response
    deleteVPNConnectionResponse,
    DeleteVPNConnectionResponse,
  )
where

import Network.AWS.EC2.Types
import Network.AWS.Lens
import Network.AWS.Prelude
import Network.AWS.Request
import Network.AWS.Response

-- | Contains the parameters for DeleteVpnConnection.
--
--
--
-- /See:/ 'deleteVPNConnection' smart constructor.
data DeleteVPNConnection = DeleteVPNConnection'
  { _dvpncDryRun ::
      !(Maybe Bool),
    _dvpncVPNConnectionId :: !Text
  }
  deriving (Eq, Read, Show, Data, Typeable, Generic)

-- | Creates a value of 'DeleteVPNConnection' with the minimum fields required to make a request.
--
-- Use one of the following lenses to modify other fields as desired:
--
-- * 'dvpncDryRun' - Checks whether you have the required permissions for the action, without actually making the request, and provides an error response. If you have the required permissions, the error response is @DryRunOperation@ . Otherwise, it is @UnauthorizedOperation@ .
--
-- * 'dvpncVPNConnectionId' - The ID of the VPN connection.
deleteVPNConnection ::
  -- | 'dvpncVPNConnectionId'
  Text ->
  DeleteVPNConnection
deleteVPNConnection pVPNConnectionId_ =
  DeleteVPNConnection'
    { _dvpncDryRun = Nothing,
      _dvpncVPNConnectionId = pVPNConnectionId_
    }

-- | Checks whether you have the required permissions for the action, without actually making the request, and provides an error response. If you have the required permissions, the error response is @DryRunOperation@ . Otherwise, it is @UnauthorizedOperation@ .
dvpncDryRun :: Lens' DeleteVPNConnection (Maybe Bool)
dvpncDryRun = lens _dvpncDryRun (\s a -> s {_dvpncDryRun = a})

-- | The ID of the VPN connection.
dvpncVPNConnectionId :: Lens' DeleteVPNConnection Text
dvpncVPNConnectionId = lens _dvpncVPNConnectionId (\s a -> s {_dvpncVPNConnectionId = a})

instance AWSRequest DeleteVPNConnection where
  type
    Rs DeleteVPNConnection =
      DeleteVPNConnectionResponse
  request = postQuery ec2
  response = receiveNull DeleteVPNConnectionResponse'

instance Hashable DeleteVPNConnection

instance NFData DeleteVPNConnection

instance ToHeaders DeleteVPNConnection where
  toHeaders = const mempty

instance ToPath DeleteVPNConnection where
  toPath = const "/"

instance ToQuery DeleteVPNConnection where
  toQuery DeleteVPNConnection' {..} =
    mconcat
      [ "Action" =: ("DeleteVpnConnection" :: ByteString),
        "Version" =: ("2016-11-15" :: ByteString),
        "DryRun" =: _dvpncDryRun,
        "VpnConnectionId" =: _dvpncVPNConnectionId
      ]

-- | /See:/ 'deleteVPNConnectionResponse' smart constructor.
data DeleteVPNConnectionResponse = DeleteVPNConnectionResponse'
  deriving
    ( Eq,
      Read,
      Show,
      Data,
      Typeable,
      Generic
    )

-- | Creates a value of 'DeleteVPNConnectionResponse' with the minimum fields required to make a request.
deleteVPNConnectionResponse ::
  DeleteVPNConnectionResponse
deleteVPNConnectionResponse =
  DeleteVPNConnectionResponse'

instance NFData DeleteVPNConnectionResponse
