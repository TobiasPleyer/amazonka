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
-- Module      : Network.AWS.EC2.RestoreManagedPrefixListVersion
-- Copyright   : (c) 2013-2021 Brendan Hay
-- License     : Mozilla Public License, v. 2.0.
-- Maintainer  : Brendan Hay <brendan.g.hay+amazonka@gmail.com>
-- Stability   : auto-generated
-- Portability : non-portable (GHC extensions)
--
-- Restores the entries from a previous version of a managed prefix list to a new version of the prefix list.
module Network.AWS.EC2.RestoreManagedPrefixListVersion
  ( -- * Creating a Request
    restoreManagedPrefixListVersion,
    RestoreManagedPrefixListVersion,

    -- * Request Lenses
    rmplvDryRun,
    rmplvPrefixListId,
    rmplvPreviousVersion,
    rmplvCurrentVersion,

    -- * Destructuring the Response
    restoreManagedPrefixListVersionResponse,
    RestoreManagedPrefixListVersionResponse,

    -- * Response Lenses
    rmplvrrsPrefixList,
    rmplvrrsResponseStatus,
  )
where

import Network.AWS.EC2.Types
import Network.AWS.Lens
import Network.AWS.Prelude
import Network.AWS.Request
import Network.AWS.Response

-- | /See:/ 'restoreManagedPrefixListVersion' smart constructor.
data RestoreManagedPrefixListVersion = RestoreManagedPrefixListVersion'
  { _rmplvDryRun ::
      !( Maybe
           Bool
       ),
    _rmplvPrefixListId ::
      !Text,
    _rmplvPreviousVersion ::
      !Integer,
    _rmplvCurrentVersion ::
      !Integer
  }
  deriving
    ( Eq,
      Read,
      Show,
      Data,
      Typeable,
      Generic
    )

-- | Creates a value of 'RestoreManagedPrefixListVersion' with the minimum fields required to make a request.
--
-- Use one of the following lenses to modify other fields as desired:
--
-- * 'rmplvDryRun' - Checks whether you have the required permissions for the action, without actually making the request, and provides an error response. If you have the required permissions, the error response is @DryRunOperation@ . Otherwise, it is @UnauthorizedOperation@ .
--
-- * 'rmplvPrefixListId' - The ID of the prefix list.
--
-- * 'rmplvPreviousVersion' - The version to restore.
--
-- * 'rmplvCurrentVersion' - The current version number for the prefix list.
restoreManagedPrefixListVersion ::
  -- | 'rmplvPrefixListId'
  Text ->
  -- | 'rmplvPreviousVersion'
  Integer ->
  -- | 'rmplvCurrentVersion'
  Integer ->
  RestoreManagedPrefixListVersion
restoreManagedPrefixListVersion
  pPrefixListId_
  pPreviousVersion_
  pCurrentVersion_ =
    RestoreManagedPrefixListVersion'
      { _rmplvDryRun =
          Nothing,
        _rmplvPrefixListId = pPrefixListId_,
        _rmplvPreviousVersion = pPreviousVersion_,
        _rmplvCurrentVersion = pCurrentVersion_
      }

-- | Checks whether you have the required permissions for the action, without actually making the request, and provides an error response. If you have the required permissions, the error response is @DryRunOperation@ . Otherwise, it is @UnauthorizedOperation@ .
rmplvDryRun :: Lens' RestoreManagedPrefixListVersion (Maybe Bool)
rmplvDryRun = lens _rmplvDryRun (\s a -> s {_rmplvDryRun = a})

-- | The ID of the prefix list.
rmplvPrefixListId :: Lens' RestoreManagedPrefixListVersion Text
rmplvPrefixListId = lens _rmplvPrefixListId (\s a -> s {_rmplvPrefixListId = a})

-- | The version to restore.
rmplvPreviousVersion :: Lens' RestoreManagedPrefixListVersion Integer
rmplvPreviousVersion = lens _rmplvPreviousVersion (\s a -> s {_rmplvPreviousVersion = a})

-- | The current version number for the prefix list.
rmplvCurrentVersion :: Lens' RestoreManagedPrefixListVersion Integer
rmplvCurrentVersion = lens _rmplvCurrentVersion (\s a -> s {_rmplvCurrentVersion = a})

instance AWSRequest RestoreManagedPrefixListVersion where
  type
    Rs RestoreManagedPrefixListVersion =
      RestoreManagedPrefixListVersionResponse
  request = postQuery ec2
  response =
    receiveXML
      ( \s h x ->
          RestoreManagedPrefixListVersionResponse'
            <$> (x .@? "prefixList") <*> (pure (fromEnum s))
      )

instance Hashable RestoreManagedPrefixListVersion

instance NFData RestoreManagedPrefixListVersion

instance ToHeaders RestoreManagedPrefixListVersion where
  toHeaders = const mempty

instance ToPath RestoreManagedPrefixListVersion where
  toPath = const "/"

instance ToQuery RestoreManagedPrefixListVersion where
  toQuery RestoreManagedPrefixListVersion' {..} =
    mconcat
      [ "Action"
          =: ("RestoreManagedPrefixListVersion" :: ByteString),
        "Version" =: ("2016-11-15" :: ByteString),
        "DryRun" =: _rmplvDryRun,
        "PrefixListId" =: _rmplvPrefixListId,
        "PreviousVersion" =: _rmplvPreviousVersion,
        "CurrentVersion" =: _rmplvCurrentVersion
      ]

-- | /See:/ 'restoreManagedPrefixListVersionResponse' smart constructor.
data RestoreManagedPrefixListVersionResponse = RestoreManagedPrefixListVersionResponse'
  { _rmplvrrsPrefixList ::
      !( Maybe
           ManagedPrefixList
       ),
    _rmplvrrsResponseStatus ::
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

-- | Creates a value of 'RestoreManagedPrefixListVersionResponse' with the minimum fields required to make a request.
--
-- Use one of the following lenses to modify other fields as desired:
--
-- * 'rmplvrrsPrefixList' - Information about the prefix list.
--
-- * 'rmplvrrsResponseStatus' - -- | The response status code.
restoreManagedPrefixListVersionResponse ::
  -- | 'rmplvrrsResponseStatus'
  Int ->
  RestoreManagedPrefixListVersionResponse
restoreManagedPrefixListVersionResponse
  pResponseStatus_ =
    RestoreManagedPrefixListVersionResponse'
      { _rmplvrrsPrefixList =
          Nothing,
        _rmplvrrsResponseStatus =
          pResponseStatus_
      }

-- | Information about the prefix list.
rmplvrrsPrefixList :: Lens' RestoreManagedPrefixListVersionResponse (Maybe ManagedPrefixList)
rmplvrrsPrefixList = lens _rmplvrrsPrefixList (\s a -> s {_rmplvrrsPrefixList = a})

-- | -- | The response status code.
rmplvrrsResponseStatus :: Lens' RestoreManagedPrefixListVersionResponse Int
rmplvrrsResponseStatus = lens _rmplvrrsResponseStatus (\s a -> s {_rmplvrrsResponseStatus = a})

instance
  NFData
    RestoreManagedPrefixListVersionResponse
