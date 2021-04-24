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
-- Module      : Network.AWS.EC2.BundleInstance
-- Copyright   : (c) 2013-2021 Brendan Hay
-- License     : Mozilla Public License, v. 2.0.
-- Maintainer  : Brendan Hay <brendan.g.hay+amazonka@gmail.com>
-- Stability   : auto-generated
-- Portability : non-portable (GHC extensions)
--
-- Bundles an Amazon instance store-backed Windows instance.
--
--
-- During bundling, only the root device volume (C:\) is bundled. Data on other instance store volumes is not preserved.
module Network.AWS.EC2.BundleInstance
  ( -- * Creating a Request
    bundleInstance,
    BundleInstance,

    -- * Request Lenses
    biDryRun,
    biInstanceId,
    biStorage,

    -- * Destructuring the Response
    bundleInstanceResponse,
    BundleInstanceResponse,

    -- * Response Lenses
    birrsBundleTask,
    birrsResponseStatus,
  )
where

import Network.AWS.EC2.Types
import Network.AWS.Lens
import Network.AWS.Prelude
import Network.AWS.Request
import Network.AWS.Response

-- | Contains the parameters for BundleInstance.
--
--
--
-- /See:/ 'bundleInstance' smart constructor.
data BundleInstance = BundleInstance'
  { _biDryRun ::
      !(Maybe Bool),
    _biInstanceId :: !Text,
    _biStorage :: !Storage
  }
  deriving (Eq, Read, Show, Data, Typeable, Generic)

-- | Creates a value of 'BundleInstance' with the minimum fields required to make a request.
--
-- Use one of the following lenses to modify other fields as desired:
--
-- * 'biDryRun' - Checks whether you have the required permissions for the action, without actually making the request, and provides an error response. If you have the required permissions, the error response is @DryRunOperation@ . Otherwise, it is @UnauthorizedOperation@ .
--
-- * 'biInstanceId' - The ID of the instance to bundle. Type: String Default: None Required: Yes
--
-- * 'biStorage' - The bucket in which to store the AMI. You can specify a bucket that you already own or a new bucket that Amazon EC2 creates on your behalf. If you specify a bucket that belongs to someone else, Amazon EC2 returns an error.
bundleInstance ::
  -- | 'biInstanceId'
  Text ->
  -- | 'biStorage'
  Storage ->
  BundleInstance
bundleInstance pInstanceId_ pStorage_ =
  BundleInstance'
    { _biDryRun = Nothing,
      _biInstanceId = pInstanceId_,
      _biStorage = pStorage_
    }

-- | Checks whether you have the required permissions for the action, without actually making the request, and provides an error response. If you have the required permissions, the error response is @DryRunOperation@ . Otherwise, it is @UnauthorizedOperation@ .
biDryRun :: Lens' BundleInstance (Maybe Bool)
biDryRun = lens _biDryRun (\s a -> s {_biDryRun = a})

-- | The ID of the instance to bundle. Type: String Default: None Required: Yes
biInstanceId :: Lens' BundleInstance Text
biInstanceId = lens _biInstanceId (\s a -> s {_biInstanceId = a})

-- | The bucket in which to store the AMI. You can specify a bucket that you already own or a new bucket that Amazon EC2 creates on your behalf. If you specify a bucket that belongs to someone else, Amazon EC2 returns an error.
biStorage :: Lens' BundleInstance Storage
biStorage = lens _biStorage (\s a -> s {_biStorage = a})

instance AWSRequest BundleInstance where
  type Rs BundleInstance = BundleInstanceResponse
  request = postQuery ec2
  response =
    receiveXML
      ( \s h x ->
          BundleInstanceResponse'
            <$> (x .@? "bundleInstanceTask") <*> (pure (fromEnum s))
      )

instance Hashable BundleInstance

instance NFData BundleInstance

instance ToHeaders BundleInstance where
  toHeaders = const mempty

instance ToPath BundleInstance where
  toPath = const "/"

instance ToQuery BundleInstance where
  toQuery BundleInstance' {..} =
    mconcat
      [ "Action" =: ("BundleInstance" :: ByteString),
        "Version" =: ("2016-11-15" :: ByteString),
        "DryRun" =: _biDryRun,
        "InstanceId" =: _biInstanceId,
        "Storage" =: _biStorage
      ]

-- | Contains the output of BundleInstance.
--
--
--
-- /See:/ 'bundleInstanceResponse' smart constructor.
data BundleInstanceResponse = BundleInstanceResponse'
  { _birrsBundleTask ::
      !(Maybe BundleTask),
    _birrsResponseStatus ::
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

-- | Creates a value of 'BundleInstanceResponse' with the minimum fields required to make a request.
--
-- Use one of the following lenses to modify other fields as desired:
--
-- * 'birrsBundleTask' - Information about the bundle task.
--
-- * 'birrsResponseStatus' - -- | The response status code.
bundleInstanceResponse ::
  -- | 'birrsResponseStatus'
  Int ->
  BundleInstanceResponse
bundleInstanceResponse pResponseStatus_ =
  BundleInstanceResponse'
    { _birrsBundleTask = Nothing,
      _birrsResponseStatus = pResponseStatus_
    }

-- | Information about the bundle task.
birrsBundleTask :: Lens' BundleInstanceResponse (Maybe BundleTask)
birrsBundleTask = lens _birrsBundleTask (\s a -> s {_birrsBundleTask = a})

-- | -- | The response status code.
birrsResponseStatus :: Lens' BundleInstanceResponse Int
birrsResponseStatus = lens _birrsResponseStatus (\s a -> s {_birrsResponseStatus = a})

instance NFData BundleInstanceResponse
