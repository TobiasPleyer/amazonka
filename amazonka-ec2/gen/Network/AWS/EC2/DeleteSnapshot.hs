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
-- Module      : Network.AWS.EC2.DeleteSnapshot
-- Copyright   : (c) 2013-2021 Brendan Hay
-- License     : Mozilla Public License, v. 2.0.
-- Maintainer  : Brendan Hay <brendan.g.hay+amazonka@gmail.com>
-- Stability   : auto-generated
-- Portability : non-portable (GHC extensions)
--
-- Deletes the specified snapshot.
--
--
-- When you make periodic snapshots of a volume, the snapshots are incremental, and only the blocks on the device that have changed since your last snapshot are saved in the new snapshot. When you delete a snapshot, only the data not needed for any other snapshot is removed. So regardless of which prior snapshots have been deleted, all active snapshots will have access to all the information needed to restore the volume.
--
-- You cannot delete a snapshot of the root device of an EBS volume used by a registered AMI. You must first de-register the AMI before you can delete the snapshot.
--
-- For more information, see <https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ebs-deleting-snapshot.html Deleting an Amazon EBS snapshot> in the /Amazon Elastic Compute Cloud User Guide/ .
module Network.AWS.EC2.DeleteSnapshot
  ( -- * Creating a Request
    deleteSnapshot,
    DeleteSnapshot,

    -- * Request Lenses
    dsDryRun,
    dsSnapshotId,

    -- * Destructuring the Response
    deleteSnapshotResponse,
    DeleteSnapshotResponse,
  )
where

import Network.AWS.EC2.Types
import Network.AWS.Lens
import Network.AWS.Prelude
import Network.AWS.Request
import Network.AWS.Response

-- | /See:/ 'deleteSnapshot' smart constructor.
data DeleteSnapshot = DeleteSnapshot'
  { _dsDryRun ::
      !(Maybe Bool),
    _dsSnapshotId :: !Text
  }
  deriving (Eq, Read, Show, Data, Typeable, Generic)

-- | Creates a value of 'DeleteSnapshot' with the minimum fields required to make a request.
--
-- Use one of the following lenses to modify other fields as desired:
--
-- * 'dsDryRun' - Checks whether you have the required permissions for the action, without actually making the request, and provides an error response. If you have the required permissions, the error response is @DryRunOperation@ . Otherwise, it is @UnauthorizedOperation@ .
--
-- * 'dsSnapshotId' - The ID of the EBS snapshot.
deleteSnapshot ::
  -- | 'dsSnapshotId'
  Text ->
  DeleteSnapshot
deleteSnapshot pSnapshotId_ =
  DeleteSnapshot'
    { _dsDryRun = Nothing,
      _dsSnapshotId = pSnapshotId_
    }

-- | Checks whether you have the required permissions for the action, without actually making the request, and provides an error response. If you have the required permissions, the error response is @DryRunOperation@ . Otherwise, it is @UnauthorizedOperation@ .
dsDryRun :: Lens' DeleteSnapshot (Maybe Bool)
dsDryRun = lens _dsDryRun (\s a -> s {_dsDryRun = a})

-- | The ID of the EBS snapshot.
dsSnapshotId :: Lens' DeleteSnapshot Text
dsSnapshotId = lens _dsSnapshotId (\s a -> s {_dsSnapshotId = a})

instance AWSRequest DeleteSnapshot where
  type Rs DeleteSnapshot = DeleteSnapshotResponse
  request = postQuery ec2
  response = receiveNull DeleteSnapshotResponse'

instance Hashable DeleteSnapshot

instance NFData DeleteSnapshot

instance ToHeaders DeleteSnapshot where
  toHeaders = const mempty

instance ToPath DeleteSnapshot where
  toPath = const "/"

instance ToQuery DeleteSnapshot where
  toQuery DeleteSnapshot' {..} =
    mconcat
      [ "Action" =: ("DeleteSnapshot" :: ByteString),
        "Version" =: ("2016-11-15" :: ByteString),
        "DryRun" =: _dsDryRun,
        "SnapshotId" =: _dsSnapshotId
      ]

-- | /See:/ 'deleteSnapshotResponse' smart constructor.
data DeleteSnapshotResponse = DeleteSnapshotResponse'
  deriving
    ( Eq,
      Read,
      Show,
      Data,
      Typeable,
      Generic
    )

-- | Creates a value of 'DeleteSnapshotResponse' with the minimum fields required to make a request.
deleteSnapshotResponse ::
  DeleteSnapshotResponse
deleteSnapshotResponse = DeleteSnapshotResponse'

instance NFData DeleteSnapshotResponse
