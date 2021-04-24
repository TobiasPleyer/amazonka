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
-- Module      : Network.AWS.WorkSpaces.CreateIPGroup
-- Copyright   : (c) 2013-2021 Brendan Hay
-- License     : Mozilla Public License, v. 2.0.
-- Maintainer  : Brendan Hay <brendan.g.hay+amazonka@gmail.com>
-- Stability   : auto-generated
-- Portability : non-portable (GHC extensions)
--
-- Creates an IP access control group.
--
--
-- An IP access control group provides you with the ability to control the IP addresses from which users are allowed to access their WorkSpaces. To specify the CIDR address ranges, add rules to your IP access control group and then associate the group with your directory. You can add rules when you create the group or at any time using 'AuthorizeIpRules' .
--
-- There is a default IP access control group associated with your directory. If you don't associate an IP access control group with your directory, the default group is used. The default group includes a default rule that allows users to access their WorkSpaces from anywhere. You cannot modify the default IP access control group for your directory.
module Network.AWS.WorkSpaces.CreateIPGroup
  ( -- * Creating a Request
    createIPGroup,
    CreateIPGroup,

    -- * Request Lenses
    cigUserRules,
    cigGroupDesc,
    cigTags,
    cigGroupName,

    -- * Destructuring the Response
    createIPGroupResponse,
    CreateIPGroupResponse,

    -- * Response Lenses
    cigrrsGroupId,
    cigrrsResponseStatus,
  )
where

import Network.AWS.Lens
import Network.AWS.Prelude
import Network.AWS.Request
import Network.AWS.Response
import Network.AWS.WorkSpaces.Types

-- | /See:/ 'createIPGroup' smart constructor.
data CreateIPGroup = CreateIPGroup'
  { _cigUserRules ::
      !(Maybe [IPRuleItem]),
    _cigGroupDesc :: !(Maybe Text),
    _cigTags :: !(Maybe [Tag]),
    _cigGroupName :: !Text
  }
  deriving (Eq, Read, Show, Data, Typeable, Generic)

-- | Creates a value of 'CreateIPGroup' with the minimum fields required to make a request.
--
-- Use one of the following lenses to modify other fields as desired:
--
-- * 'cigUserRules' - The rules to add to the group.
--
-- * 'cigGroupDesc' - The description of the group.
--
-- * 'cigTags' - The tags. Each WorkSpaces resource can have a maximum of 50 tags.
--
-- * 'cigGroupName' - The name of the group.
createIPGroup ::
  -- | 'cigGroupName'
  Text ->
  CreateIPGroup
createIPGroup pGroupName_ =
  CreateIPGroup'
    { _cigUserRules = Nothing,
      _cigGroupDesc = Nothing,
      _cigTags = Nothing,
      _cigGroupName = pGroupName_
    }

-- | The rules to add to the group.
cigUserRules :: Lens' CreateIPGroup [IPRuleItem]
cigUserRules = lens _cigUserRules (\s a -> s {_cigUserRules = a}) . _Default . _Coerce

-- | The description of the group.
cigGroupDesc :: Lens' CreateIPGroup (Maybe Text)
cigGroupDesc = lens _cigGroupDesc (\s a -> s {_cigGroupDesc = a})

-- | The tags. Each WorkSpaces resource can have a maximum of 50 tags.
cigTags :: Lens' CreateIPGroup [Tag]
cigTags = lens _cigTags (\s a -> s {_cigTags = a}) . _Default . _Coerce

-- | The name of the group.
cigGroupName :: Lens' CreateIPGroup Text
cigGroupName = lens _cigGroupName (\s a -> s {_cigGroupName = a})

instance AWSRequest CreateIPGroup where
  type Rs CreateIPGroup = CreateIPGroupResponse
  request = postJSON workSpaces
  response =
    receiveJSON
      ( \s h x ->
          CreateIPGroupResponse'
            <$> (x .?> "GroupId") <*> (pure (fromEnum s))
      )

instance Hashable CreateIPGroup

instance NFData CreateIPGroup

instance ToHeaders CreateIPGroup where
  toHeaders =
    const
      ( mconcat
          [ "X-Amz-Target"
              =# ("WorkspacesService.CreateIpGroup" :: ByteString),
            "Content-Type"
              =# ("application/x-amz-json-1.1" :: ByteString)
          ]
      )

instance ToJSON CreateIPGroup where
  toJSON CreateIPGroup' {..} =
    object
      ( catMaybes
          [ ("UserRules" .=) <$> _cigUserRules,
            ("GroupDesc" .=) <$> _cigGroupDesc,
            ("Tags" .=) <$> _cigTags,
            Just ("GroupName" .= _cigGroupName)
          ]
      )

instance ToPath CreateIPGroup where
  toPath = const "/"

instance ToQuery CreateIPGroup where
  toQuery = const mempty

-- | /See:/ 'createIPGroupResponse' smart constructor.
data CreateIPGroupResponse = CreateIPGroupResponse'
  { _cigrrsGroupId ::
      !(Maybe Text),
    _cigrrsResponseStatus ::
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

-- | Creates a value of 'CreateIPGroupResponse' with the minimum fields required to make a request.
--
-- Use one of the following lenses to modify other fields as desired:
--
-- * 'cigrrsGroupId' - The identifier of the group.
--
-- * 'cigrrsResponseStatus' - -- | The response status code.
createIPGroupResponse ::
  -- | 'cigrrsResponseStatus'
  Int ->
  CreateIPGroupResponse
createIPGroupResponse pResponseStatus_ =
  CreateIPGroupResponse'
    { _cigrrsGroupId = Nothing,
      _cigrrsResponseStatus = pResponseStatus_
    }

-- | The identifier of the group.
cigrrsGroupId :: Lens' CreateIPGroupResponse (Maybe Text)
cigrrsGroupId = lens _cigrrsGroupId (\s a -> s {_cigrrsGroupId = a})

-- | -- | The response status code.
cigrrsResponseStatus :: Lens' CreateIPGroupResponse Int
cigrrsResponseStatus = lens _cigrrsResponseStatus (\s a -> s {_cigrrsResponseStatus = a})

instance NFData CreateIPGroupResponse
