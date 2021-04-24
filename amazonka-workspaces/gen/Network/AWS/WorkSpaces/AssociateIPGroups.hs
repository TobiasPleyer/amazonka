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
-- Module      : Network.AWS.WorkSpaces.AssociateIPGroups
-- Copyright   : (c) 2013-2021 Brendan Hay
-- License     : Mozilla Public License, v. 2.0.
-- Maintainer  : Brendan Hay <brendan.g.hay+amazonka@gmail.com>
-- Stability   : auto-generated
-- Portability : non-portable (GHC extensions)
--
-- Associates the specified IP access control group with the specified directory.
module Network.AWS.WorkSpaces.AssociateIPGroups
  ( -- * Creating a Request
    associateIPGroups,
    AssociateIPGroups,

    -- * Request Lenses
    aigDirectoryId,
    aigGroupIds,

    -- * Destructuring the Response
    associateIPGroupsResponse,
    AssociateIPGroupsResponse,

    -- * Response Lenses
    aigrrsResponseStatus,
  )
where

import Network.AWS.Lens
import Network.AWS.Prelude
import Network.AWS.Request
import Network.AWS.Response
import Network.AWS.WorkSpaces.Types

-- | /See:/ 'associateIPGroups' smart constructor.
data AssociateIPGroups = AssociateIPGroups'
  { _aigDirectoryId ::
      !Text,
    _aigGroupIds :: ![Text]
  }
  deriving (Eq, Read, Show, Data, Typeable, Generic)

-- | Creates a value of 'AssociateIPGroups' with the minimum fields required to make a request.
--
-- Use one of the following lenses to modify other fields as desired:
--
-- * 'aigDirectoryId' - The identifier of the directory.
--
-- * 'aigGroupIds' - The identifiers of one or more IP access control groups.
associateIPGroups ::
  -- | 'aigDirectoryId'
  Text ->
  AssociateIPGroups
associateIPGroups pDirectoryId_ =
  AssociateIPGroups'
    { _aigDirectoryId = pDirectoryId_,
      _aigGroupIds = mempty
    }

-- | The identifier of the directory.
aigDirectoryId :: Lens' AssociateIPGroups Text
aigDirectoryId = lens _aigDirectoryId (\s a -> s {_aigDirectoryId = a})

-- | The identifiers of one or more IP access control groups.
aigGroupIds :: Lens' AssociateIPGroups [Text]
aigGroupIds = lens _aigGroupIds (\s a -> s {_aigGroupIds = a}) . _Coerce

instance AWSRequest AssociateIPGroups where
  type Rs AssociateIPGroups = AssociateIPGroupsResponse
  request = postJSON workSpaces
  response =
    receiveEmpty
      ( \s h x ->
          AssociateIPGroupsResponse' <$> (pure (fromEnum s))
      )

instance Hashable AssociateIPGroups

instance NFData AssociateIPGroups

instance ToHeaders AssociateIPGroups where
  toHeaders =
    const
      ( mconcat
          [ "X-Amz-Target"
              =# ( "WorkspacesService.AssociateIpGroups" ::
                     ByteString
                 ),
            "Content-Type"
              =# ("application/x-amz-json-1.1" :: ByteString)
          ]
      )

instance ToJSON AssociateIPGroups where
  toJSON AssociateIPGroups' {..} =
    object
      ( catMaybes
          [ Just ("DirectoryId" .= _aigDirectoryId),
            Just ("GroupIds" .= _aigGroupIds)
          ]
      )

instance ToPath AssociateIPGroups where
  toPath = const "/"

instance ToQuery AssociateIPGroups where
  toQuery = const mempty

-- | /See:/ 'associateIPGroupsResponse' smart constructor.
newtype AssociateIPGroupsResponse = AssociateIPGroupsResponse'
  { _aigrrsResponseStatus ::
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

-- | Creates a value of 'AssociateIPGroupsResponse' with the minimum fields required to make a request.
--
-- Use one of the following lenses to modify other fields as desired:
--
-- * 'aigrrsResponseStatus' - -- | The response status code.
associateIPGroupsResponse ::
  -- | 'aigrrsResponseStatus'
  Int ->
  AssociateIPGroupsResponse
associateIPGroupsResponse pResponseStatus_ =
  AssociateIPGroupsResponse'
    { _aigrrsResponseStatus =
        pResponseStatus_
    }

-- | -- | The response status code.
aigrrsResponseStatus :: Lens' AssociateIPGroupsResponse Int
aigrrsResponseStatus = lens _aigrrsResponseStatus (\s a -> s {_aigrrsResponseStatus = a})

instance NFData AssociateIPGroupsResponse
