{-# LANGUAGE DeriveDataTypeable #-}
{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE RecordWildCards #-}
{-# OPTIONS_GHC -fno-warn-unused-imports #-}

-- Derived from AWS service descriptions, licensed under Apache 2.0.

-- |
-- Module      : Network.AWS.WorkSpaces.Types.FailedCreateWorkspaceRequest
-- Copyright   : (c) 2013-2021 Brendan Hay
-- License     : Mozilla Public License, v. 2.0.
-- Maintainer  : Brendan Hay <brendan.g.hay+amazonka@gmail.com>
-- Stability   : auto-generated
-- Portability : non-portable (GHC extensions)
module Network.AWS.WorkSpaces.Types.FailedCreateWorkspaceRequest where

import Network.AWS.Lens
import Network.AWS.Prelude
import Network.AWS.WorkSpaces.Types.WorkspaceRequest

-- | Describes a WorkSpace that cannot be created.
--
--
--
-- /See:/ 'failedCreateWorkspaceRequest' smart constructor.
data FailedCreateWorkspaceRequest = FailedCreateWorkspaceRequest'
  { _fcwrWorkspaceRequest ::
      !( Maybe
           WorkspaceRequest
       ),
    _fcwrErrorMessage ::
      !(Maybe Text),
    _fcwrErrorCode ::
      !(Maybe Text)
  }
  deriving
    ( Eq,
      Read,
      Show,
      Data,
      Typeable,
      Generic
    )

-- | Creates a value of 'FailedCreateWorkspaceRequest' with the minimum fields required to make a request.
--
-- Use one of the following lenses to modify other fields as desired:
--
-- * 'fcwrWorkspaceRequest' - Information about the WorkSpace.
--
-- * 'fcwrErrorMessage' - The text of the error message that is returned if the WorkSpace cannot be created.
--
-- * 'fcwrErrorCode' - The error code that is returned if the WorkSpace cannot be created.
failedCreateWorkspaceRequest ::
  FailedCreateWorkspaceRequest
failedCreateWorkspaceRequest =
  FailedCreateWorkspaceRequest'
    { _fcwrWorkspaceRequest =
        Nothing,
      _fcwrErrorMessage = Nothing,
      _fcwrErrorCode = Nothing
    }

-- | Information about the WorkSpace.
fcwrWorkspaceRequest :: Lens' FailedCreateWorkspaceRequest (Maybe WorkspaceRequest)
fcwrWorkspaceRequest = lens _fcwrWorkspaceRequest (\s a -> s {_fcwrWorkspaceRequest = a})

-- | The text of the error message that is returned if the WorkSpace cannot be created.
fcwrErrorMessage :: Lens' FailedCreateWorkspaceRequest (Maybe Text)
fcwrErrorMessage = lens _fcwrErrorMessage (\s a -> s {_fcwrErrorMessage = a})

-- | The error code that is returned if the WorkSpace cannot be created.
fcwrErrorCode :: Lens' FailedCreateWorkspaceRequest (Maybe Text)
fcwrErrorCode = lens _fcwrErrorCode (\s a -> s {_fcwrErrorCode = a})

instance FromJSON FailedCreateWorkspaceRequest where
  parseJSON =
    withObject
      "FailedCreateWorkspaceRequest"
      ( \x ->
          FailedCreateWorkspaceRequest'
            <$> (x .:? "WorkspaceRequest")
            <*> (x .:? "ErrorMessage")
            <*> (x .:? "ErrorCode")
      )

instance Hashable FailedCreateWorkspaceRequest

instance NFData FailedCreateWorkspaceRequest
