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
-- Module      : Network.AWS.WorkSpaces.UpdateRulesOfIPGroup
-- Copyright   : (c) 2013-2021 Brendan Hay
-- License     : Mozilla Public License, v. 2.0.
-- Maintainer  : Brendan Hay <brendan.g.hay+amazonka@gmail.com>
-- Stability   : auto-generated
-- Portability : non-portable (GHC extensions)
--
-- Replaces the current rules of the specified IP access control group with the specified rules.
module Network.AWS.WorkSpaces.UpdateRulesOfIPGroup
  ( -- * Creating a Request
    updateRulesOfIPGroup,
    UpdateRulesOfIPGroup,

    -- * Request Lenses
    uroigGroupId,
    uroigUserRules,

    -- * Destructuring the Response
    updateRulesOfIPGroupResponse,
    UpdateRulesOfIPGroupResponse,

    -- * Response Lenses
    uroigrrsResponseStatus,
  )
where

import Network.AWS.Lens
import Network.AWS.Prelude
import Network.AWS.Request
import Network.AWS.Response
import Network.AWS.WorkSpaces.Types

-- | /See:/ 'updateRulesOfIPGroup' smart constructor.
data UpdateRulesOfIPGroup = UpdateRulesOfIPGroup'
  { _uroigGroupId ::
      !Text,
    _uroigUserRules ::
      ![IPRuleItem]
  }
  deriving (Eq, Read, Show, Data, Typeable, Generic)

-- | Creates a value of 'UpdateRulesOfIPGroup' with the minimum fields required to make a request.
--
-- Use one of the following lenses to modify other fields as desired:
--
-- * 'uroigGroupId' - The identifier of the group.
--
-- * 'uroigUserRules' - One or more rules.
updateRulesOfIPGroup ::
  -- | 'uroigGroupId'
  Text ->
  UpdateRulesOfIPGroup
updateRulesOfIPGroup pGroupId_ =
  UpdateRulesOfIPGroup'
    { _uroigGroupId = pGroupId_,
      _uroigUserRules = mempty
    }

-- | The identifier of the group.
uroigGroupId :: Lens' UpdateRulesOfIPGroup Text
uroigGroupId = lens _uroigGroupId (\s a -> s {_uroigGroupId = a})

-- | One or more rules.
uroigUserRules :: Lens' UpdateRulesOfIPGroup [IPRuleItem]
uroigUserRules = lens _uroigUserRules (\s a -> s {_uroigUserRules = a}) . _Coerce

instance AWSRequest UpdateRulesOfIPGroup where
  type
    Rs UpdateRulesOfIPGroup =
      UpdateRulesOfIPGroupResponse
  request = postJSON workSpaces
  response =
    receiveEmpty
      ( \s h x ->
          UpdateRulesOfIPGroupResponse'
            <$> (pure (fromEnum s))
      )

instance Hashable UpdateRulesOfIPGroup

instance NFData UpdateRulesOfIPGroup

instance ToHeaders UpdateRulesOfIPGroup where
  toHeaders =
    const
      ( mconcat
          [ "X-Amz-Target"
              =# ( "WorkspacesService.UpdateRulesOfIpGroup" ::
                     ByteString
                 ),
            "Content-Type"
              =# ("application/x-amz-json-1.1" :: ByteString)
          ]
      )

instance ToJSON UpdateRulesOfIPGroup where
  toJSON UpdateRulesOfIPGroup' {..} =
    object
      ( catMaybes
          [ Just ("GroupId" .= _uroigGroupId),
            Just ("UserRules" .= _uroigUserRules)
          ]
      )

instance ToPath UpdateRulesOfIPGroup where
  toPath = const "/"

instance ToQuery UpdateRulesOfIPGroup where
  toQuery = const mempty

-- | /See:/ 'updateRulesOfIPGroupResponse' smart constructor.
newtype UpdateRulesOfIPGroupResponse = UpdateRulesOfIPGroupResponse'
  { _uroigrrsResponseStatus ::
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

-- | Creates a value of 'UpdateRulesOfIPGroupResponse' with the minimum fields required to make a request.
--
-- Use one of the following lenses to modify other fields as desired:
--
-- * 'uroigrrsResponseStatus' - -- | The response status code.
updateRulesOfIPGroupResponse ::
  -- | 'uroigrrsResponseStatus'
  Int ->
  UpdateRulesOfIPGroupResponse
updateRulesOfIPGroupResponse pResponseStatus_ =
  UpdateRulesOfIPGroupResponse'
    { _uroigrrsResponseStatus =
        pResponseStatus_
    }

-- | -- | The response status code.
uroigrrsResponseStatus :: Lens' UpdateRulesOfIPGroupResponse Int
uroigrrsResponseStatus = lens _uroigrrsResponseStatus (\s a -> s {_uroigrrsResponseStatus = a})

instance NFData UpdateRulesOfIPGroupResponse
