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
-- Module      : Network.AWS.WorkSpaces.ModifyWorkspaceState
-- Copyright   : (c) 2013-2021 Brendan Hay
-- License     : Mozilla Public License, v. 2.0.
-- Maintainer  : Brendan Hay <brendan.g.hay+amazonka@gmail.com>
-- Stability   : auto-generated
-- Portability : non-portable (GHC extensions)
--
-- Sets the state of the specified WorkSpace.
--
--
-- To maintain a WorkSpace without being interrupted, set the WorkSpace state to @ADMIN_MAINTENANCE@ . WorkSpaces in this state do not respond to requests to reboot, stop, start, rebuild, or restore. An AutoStop WorkSpace in this state is not stopped. Users cannot log into a WorkSpace in the @ADMIN_MAINTENANCE@ state.
module Network.AWS.WorkSpaces.ModifyWorkspaceState
  ( -- * Creating a Request
    modifyWorkspaceState,
    ModifyWorkspaceState,

    -- * Request Lenses
    mwsWorkspaceId,
    mwsWorkspaceState,

    -- * Destructuring the Response
    modifyWorkspaceStateResponse,
    ModifyWorkspaceStateResponse,

    -- * Response Lenses
    mwsrrsResponseStatus,
  )
where

import Network.AWS.Lens
import Network.AWS.Prelude
import Network.AWS.Request
import Network.AWS.Response
import Network.AWS.WorkSpaces.Types

-- | /See:/ 'modifyWorkspaceState' smart constructor.
data ModifyWorkspaceState = ModifyWorkspaceState'
  { _mwsWorkspaceId ::
      !Text,
    _mwsWorkspaceState ::
      !TargetWorkspaceState
  }
  deriving (Eq, Read, Show, Data, Typeable, Generic)

-- | Creates a value of 'ModifyWorkspaceState' with the minimum fields required to make a request.
--
-- Use one of the following lenses to modify other fields as desired:
--
-- * 'mwsWorkspaceId' - The identifier of the WorkSpace.
--
-- * 'mwsWorkspaceState' - The WorkSpace state.
modifyWorkspaceState ::
  -- | 'mwsWorkspaceId'
  Text ->
  -- | 'mwsWorkspaceState'
  TargetWorkspaceState ->
  ModifyWorkspaceState
modifyWorkspaceState pWorkspaceId_ pWorkspaceState_ =
  ModifyWorkspaceState'
    { _mwsWorkspaceId =
        pWorkspaceId_,
      _mwsWorkspaceState = pWorkspaceState_
    }

-- | The identifier of the WorkSpace.
mwsWorkspaceId :: Lens' ModifyWorkspaceState Text
mwsWorkspaceId = lens _mwsWorkspaceId (\s a -> s {_mwsWorkspaceId = a})

-- | The WorkSpace state.
mwsWorkspaceState :: Lens' ModifyWorkspaceState TargetWorkspaceState
mwsWorkspaceState = lens _mwsWorkspaceState (\s a -> s {_mwsWorkspaceState = a})

instance AWSRequest ModifyWorkspaceState where
  type
    Rs ModifyWorkspaceState =
      ModifyWorkspaceStateResponse
  request = postJSON workSpaces
  response =
    receiveEmpty
      ( \s h x ->
          ModifyWorkspaceStateResponse'
            <$> (pure (fromEnum s))
      )

instance Hashable ModifyWorkspaceState

instance NFData ModifyWorkspaceState

instance ToHeaders ModifyWorkspaceState where
  toHeaders =
    const
      ( mconcat
          [ "X-Amz-Target"
              =# ( "WorkspacesService.ModifyWorkspaceState" ::
                     ByteString
                 ),
            "Content-Type"
              =# ("application/x-amz-json-1.1" :: ByteString)
          ]
      )

instance ToJSON ModifyWorkspaceState where
  toJSON ModifyWorkspaceState' {..} =
    object
      ( catMaybes
          [ Just ("WorkspaceId" .= _mwsWorkspaceId),
            Just ("WorkspaceState" .= _mwsWorkspaceState)
          ]
      )

instance ToPath ModifyWorkspaceState where
  toPath = const "/"

instance ToQuery ModifyWorkspaceState where
  toQuery = const mempty

-- | /See:/ 'modifyWorkspaceStateResponse' smart constructor.
newtype ModifyWorkspaceStateResponse = ModifyWorkspaceStateResponse'
  { _mwsrrsResponseStatus ::
      Int
  }
  deriving
    ( Eq,
      Read,
      Show,
      Data,
      Typeable,
      Generic
    )

-- | Creates a value of 'ModifyWorkspaceStateResponse' with the minimum fields required to make a request.
--
-- Use one of the following lenses to modify other fields as desired:
--
-- * 'mwsrrsResponseStatus' - -- | The response status code.
modifyWorkspaceStateResponse ::
  -- | 'mwsrrsResponseStatus'
  Int ->
  ModifyWorkspaceStateResponse
modifyWorkspaceStateResponse pResponseStatus_ =
  ModifyWorkspaceStateResponse'
    { _mwsrrsResponseStatus =
        pResponseStatus_
    }

-- | -- | The response status code.
mwsrrsResponseStatus :: Lens' ModifyWorkspaceStateResponse Int
mwsrrsResponseStatus = lens _mwsrrsResponseStatus (\s a -> s {_mwsrrsResponseStatus = a})

instance NFData ModifyWorkspaceStateResponse
