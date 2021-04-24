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
-- Module      : Network.AWS.EC2.CancelConversionTask
-- Copyright   : (c) 2013-2021 Brendan Hay
-- License     : Mozilla Public License, v. 2.0.
-- Maintainer  : Brendan Hay <brendan.g.hay+amazonka@gmail.com>
-- Stability   : auto-generated
-- Portability : non-portable (GHC extensions)
--
-- Cancels an active conversion task. The task can be the import of an instance or volume. The action removes all artifacts of the conversion, including a partially uploaded volume or instance. If the conversion is complete or is in the process of transferring the final disk image, the command fails and returns an exception.
--
--
-- For more information, see <https://docs.aws.amazon.com/AWSEC2/latest/CommandLineReference/ec2-cli-vmimport-export.html Importing a Virtual Machine Using the Amazon EC2 CLI> .
module Network.AWS.EC2.CancelConversionTask
  ( -- * Creating a Request
    cancelConversionTask,
    CancelConversionTask,

    -- * Request Lenses
    cctDryRun,
    cctReasonMessage,
    cctConversionTaskId,

    -- * Destructuring the Response
    cancelConversionTaskResponse,
    CancelConversionTaskResponse,
  )
where

import Network.AWS.EC2.Types
import Network.AWS.Lens
import Network.AWS.Prelude
import Network.AWS.Request
import Network.AWS.Response

-- | /See:/ 'cancelConversionTask' smart constructor.
data CancelConversionTask = CancelConversionTask'
  { _cctDryRun ::
      !(Maybe Bool),
    _cctReasonMessage ::
      !(Maybe Text),
    _cctConversionTaskId :: !Text
  }
  deriving (Eq, Read, Show, Data, Typeable, Generic)

-- | Creates a value of 'CancelConversionTask' with the minimum fields required to make a request.
--
-- Use one of the following lenses to modify other fields as desired:
--
-- * 'cctDryRun' - Checks whether you have the required permissions for the action, without actually making the request, and provides an error response. If you have the required permissions, the error response is @DryRunOperation@ . Otherwise, it is @UnauthorizedOperation@ .
--
-- * 'cctReasonMessage' - The reason for canceling the conversion task.
--
-- * 'cctConversionTaskId' - The ID of the conversion task.
cancelConversionTask ::
  -- | 'cctConversionTaskId'
  Text ->
  CancelConversionTask
cancelConversionTask pConversionTaskId_ =
  CancelConversionTask'
    { _cctDryRun = Nothing,
      _cctReasonMessage = Nothing,
      _cctConversionTaskId = pConversionTaskId_
    }

-- | Checks whether you have the required permissions for the action, without actually making the request, and provides an error response. If you have the required permissions, the error response is @DryRunOperation@ . Otherwise, it is @UnauthorizedOperation@ .
cctDryRun :: Lens' CancelConversionTask (Maybe Bool)
cctDryRun = lens _cctDryRun (\s a -> s {_cctDryRun = a})

-- | The reason for canceling the conversion task.
cctReasonMessage :: Lens' CancelConversionTask (Maybe Text)
cctReasonMessage = lens _cctReasonMessage (\s a -> s {_cctReasonMessage = a})

-- | The ID of the conversion task.
cctConversionTaskId :: Lens' CancelConversionTask Text
cctConversionTaskId = lens _cctConversionTaskId (\s a -> s {_cctConversionTaskId = a})

instance AWSRequest CancelConversionTask where
  type
    Rs CancelConversionTask =
      CancelConversionTaskResponse
  request = postQuery ec2
  response = receiveNull CancelConversionTaskResponse'

instance Hashable CancelConversionTask

instance NFData CancelConversionTask

instance ToHeaders CancelConversionTask where
  toHeaders = const mempty

instance ToPath CancelConversionTask where
  toPath = const "/"

instance ToQuery CancelConversionTask where
  toQuery CancelConversionTask' {..} =
    mconcat
      [ "Action" =: ("CancelConversionTask" :: ByteString),
        "Version" =: ("2016-11-15" :: ByteString),
        "DryRun" =: _cctDryRun,
        "ReasonMessage" =: _cctReasonMessage,
        "ConversionTaskId" =: _cctConversionTaskId
      ]

-- | /See:/ 'cancelConversionTaskResponse' smart constructor.
data CancelConversionTaskResponse = CancelConversionTaskResponse'
  deriving
    ( Eq,
      Read,
      Show,
      Data,
      Typeable,
      Generic
    )

-- | Creates a value of 'CancelConversionTaskResponse' with the minimum fields required to make a request.
cancelConversionTaskResponse ::
  CancelConversionTaskResponse
cancelConversionTaskResponse =
  CancelConversionTaskResponse'

instance NFData CancelConversionTaskResponse
