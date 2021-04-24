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
-- Module      : Network.AWS.EC2.GetPasswordData
-- Copyright   : (c) 2013-2021 Brendan Hay
-- License     : Mozilla Public License, v. 2.0.
-- Maintainer  : Brendan Hay <brendan.g.hay+amazonka@gmail.com>
-- Stability   : auto-generated
-- Portability : non-portable (GHC extensions)
--
-- Retrieves the encrypted administrator password for a running Windows instance.
--
--
-- The Windows password is generated at boot by the @EC2Config@ service or @EC2Launch@ scripts (Windows Server 2016 and later). This usually only happens the first time an instance is launched. For more information, see <https://docs.aws.amazon.com/AWSEC2/latest/WindowsGuide/UsingConfig_WinAMI.html EC2Config> and <https://docs.aws.amazon.com/AWSEC2/latest/WindowsGuide/ec2launch.html EC2Launch> in the /Amazon EC2 User Guide/ .
--
-- For the @EC2Config@ service, the password is not generated for rebundled AMIs unless @Ec2SetPassword@ is enabled before bundling.
--
-- The password is encrypted using the key pair that you specified when you launched the instance. You must provide the corresponding key pair file.
--
-- When you launch an instance, password generation and encryption may take a few minutes. If you try to retrieve the password before it's available, the output returns an empty string. We recommend that you wait up to 15 minutes after launching an instance before trying to retrieve the generated password.
module Network.AWS.EC2.GetPasswordData
  ( -- * Creating a Request
    getPasswordData,
    GetPasswordData,

    -- * Request Lenses
    gpdDryRun,
    gpdInstanceId,

    -- * Destructuring the Response
    getPasswordDataResponse,
    GetPasswordDataResponse,

    -- * Response Lenses
    gpdrrsResponseStatus,
    gpdrrsInstanceId,
    gpdrrsPasswordData,
    gpdrrsTimestamp,
  )
where

import Network.AWS.EC2.Types
import Network.AWS.Lens
import Network.AWS.Prelude
import Network.AWS.Request
import Network.AWS.Response

-- | /See:/ 'getPasswordData' smart constructor.
data GetPasswordData = GetPasswordData'
  { _gpdDryRun ::
      !(Maybe Bool),
    _gpdInstanceId :: !Text
  }
  deriving (Eq, Read, Show, Data, Typeable, Generic)

-- | Creates a value of 'GetPasswordData' with the minimum fields required to make a request.
--
-- Use one of the following lenses to modify other fields as desired:
--
-- * 'gpdDryRun' - Checks whether you have the required permissions for the action, without actually making the request, and provides an error response. If you have the required permissions, the error response is @DryRunOperation@ . Otherwise, it is @UnauthorizedOperation@ .
--
-- * 'gpdInstanceId' - The ID of the Windows instance.
getPasswordData ::
  -- | 'gpdInstanceId'
  Text ->
  GetPasswordData
getPasswordData pInstanceId_ =
  GetPasswordData'
    { _gpdDryRun = Nothing,
      _gpdInstanceId = pInstanceId_
    }

-- | Checks whether you have the required permissions for the action, without actually making the request, and provides an error response. If you have the required permissions, the error response is @DryRunOperation@ . Otherwise, it is @UnauthorizedOperation@ .
gpdDryRun :: Lens' GetPasswordData (Maybe Bool)
gpdDryRun = lens _gpdDryRun (\s a -> s {_gpdDryRun = a})

-- | The ID of the Windows instance.
gpdInstanceId :: Lens' GetPasswordData Text
gpdInstanceId = lens _gpdInstanceId (\s a -> s {_gpdInstanceId = a})

instance AWSRequest GetPasswordData where
  type Rs GetPasswordData = GetPasswordDataResponse
  request = postQuery ec2
  response =
    receiveXML
      ( \s h x ->
          GetPasswordDataResponse'
            <$> (pure (fromEnum s))
            <*> (x .@ "instanceId")
            <*> (x .@ "passwordData")
            <*> (x .@ "timestamp")
      )

instance Hashable GetPasswordData

instance NFData GetPasswordData

instance ToHeaders GetPasswordData where
  toHeaders = const mempty

instance ToPath GetPasswordData where
  toPath = const "/"

instance ToQuery GetPasswordData where
  toQuery GetPasswordData' {..} =
    mconcat
      [ "Action" =: ("GetPasswordData" :: ByteString),
        "Version" =: ("2016-11-15" :: ByteString),
        "DryRun" =: _gpdDryRun,
        "InstanceId" =: _gpdInstanceId
      ]

-- | /See:/ 'getPasswordDataResponse' smart constructor.
data GetPasswordDataResponse = GetPasswordDataResponse'
  { _gpdrrsResponseStatus ::
      !Int,
    _gpdrrsInstanceId ::
      !Text,
    _gpdrrsPasswordData ::
      !Text,
    _gpdrrsTimestamp ::
      !ISO8601
  }
  deriving
    ( Eq,
      Read,
      Show,
      Data,
      Typeable,
      Generic
    )

-- | Creates a value of 'GetPasswordDataResponse' with the minimum fields required to make a request.
--
-- Use one of the following lenses to modify other fields as desired:
--
-- * 'gpdrrsResponseStatus' - -- | The response status code.
--
-- * 'gpdrrsInstanceId' - The ID of the Windows instance.
--
-- * 'gpdrrsPasswordData' - The password of the instance. Returns an empty string if the password is not available.
--
-- * 'gpdrrsTimestamp' - The time the data was last updated.
getPasswordDataResponse ::
  -- | 'gpdrrsResponseStatus'
  Int ->
  -- | 'gpdrrsInstanceId'
  Text ->
  -- | 'gpdrrsPasswordData'
  Text ->
  -- | 'gpdrrsTimestamp'
  UTCTime ->
  GetPasswordDataResponse
getPasswordDataResponse
  pResponseStatus_
  pInstanceId_
  pPasswordData_
  pTimestamp_ =
    GetPasswordDataResponse'
      { _gpdrrsResponseStatus =
          pResponseStatus_,
        _gpdrrsInstanceId = pInstanceId_,
        _gpdrrsPasswordData = pPasswordData_,
        _gpdrrsTimestamp = _Time # pTimestamp_
      }

-- | -- | The response status code.
gpdrrsResponseStatus :: Lens' GetPasswordDataResponse Int
gpdrrsResponseStatus = lens _gpdrrsResponseStatus (\s a -> s {_gpdrrsResponseStatus = a})

-- | The ID of the Windows instance.
gpdrrsInstanceId :: Lens' GetPasswordDataResponse Text
gpdrrsInstanceId = lens _gpdrrsInstanceId (\s a -> s {_gpdrrsInstanceId = a})

-- | The password of the instance. Returns an empty string if the password is not available.
gpdrrsPasswordData :: Lens' GetPasswordDataResponse Text
gpdrrsPasswordData = lens _gpdrrsPasswordData (\s a -> s {_gpdrrsPasswordData = a})

-- | The time the data was last updated.
gpdrrsTimestamp :: Lens' GetPasswordDataResponse UTCTime
gpdrrsTimestamp = lens _gpdrrsTimestamp (\s a -> s {_gpdrrsTimestamp = a}) . _Time

instance NFData GetPasswordDataResponse
