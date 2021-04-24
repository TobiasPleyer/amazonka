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
-- Module      : Network.AWS.CloudHSMv2.DeleteHSM
-- Copyright   : (c) 2013-2021 Brendan Hay
-- License     : Mozilla Public License, v. 2.0.
-- Maintainer  : Brendan Hay <brendan.g.hay+amazonka@gmail.com>
-- Stability   : auto-generated
-- Portability : non-portable (GHC extensions)
--
-- Deletes the specified HSM. To specify an HSM, you can use its identifier (ID), the IP address of the HSM's elastic network interface (ENI), or the ID of the HSM's ENI. You need to specify only one of these values. To find these values, use 'DescribeClusters' .
module Network.AWS.CloudHSMv2.DeleteHSM
  ( -- * Creating a Request
    deleteHSM,
    DeleteHSM,

    -- * Request Lenses
    dhEniIP,
    dhEniId,
    dhHSMId,
    dhClusterId,

    -- * Destructuring the Response
    deleteHSMResponse,
    DeleteHSMResponse,

    -- * Response Lenses
    dhrrsHSMId,
    dhrrsResponseStatus,
  )
where

import Network.AWS.CloudHSMv2.Types
import Network.AWS.Lens
import Network.AWS.Prelude
import Network.AWS.Request
import Network.AWS.Response

-- | /See:/ 'deleteHSM' smart constructor.
data DeleteHSM = DeleteHSM'
  { _dhEniIP ::
      !(Maybe Text),
    _dhEniId :: !(Maybe Text),
    _dhHSMId :: !(Maybe Text),
    _dhClusterId :: !Text
  }
  deriving (Eq, Read, Show, Data, Typeable, Generic)

-- | Creates a value of 'DeleteHSM' with the minimum fields required to make a request.
--
-- Use one of the following lenses to modify other fields as desired:
--
-- * 'dhEniIP' - The IP address of the elastic network interface (ENI) of the HSM that you are deleting.
--
-- * 'dhEniId' - The identifier (ID) of the elastic network interface (ENI) of the HSM that you are deleting.
--
-- * 'dhHSMId' - The identifier (ID) of the HSM that you are deleting.
--
-- * 'dhClusterId' - The identifier (ID) of the cluster that contains the HSM that you are deleting.
deleteHSM ::
  -- | 'dhClusterId'
  Text ->
  DeleteHSM
deleteHSM pClusterId_ =
  DeleteHSM'
    { _dhEniIP = Nothing,
      _dhEniId = Nothing,
      _dhHSMId = Nothing,
      _dhClusterId = pClusterId_
    }

-- | The IP address of the elastic network interface (ENI) of the HSM that you are deleting.
dhEniIP :: Lens' DeleteHSM (Maybe Text)
dhEniIP = lens _dhEniIP (\s a -> s {_dhEniIP = a})

-- | The identifier (ID) of the elastic network interface (ENI) of the HSM that you are deleting.
dhEniId :: Lens' DeleteHSM (Maybe Text)
dhEniId = lens _dhEniId (\s a -> s {_dhEniId = a})

-- | The identifier (ID) of the HSM that you are deleting.
dhHSMId :: Lens' DeleteHSM (Maybe Text)
dhHSMId = lens _dhHSMId (\s a -> s {_dhHSMId = a})

-- | The identifier (ID) of the cluster that contains the HSM that you are deleting.
dhClusterId :: Lens' DeleteHSM Text
dhClusterId = lens _dhClusterId (\s a -> s {_dhClusterId = a})

instance AWSRequest DeleteHSM where
  type Rs DeleteHSM = DeleteHSMResponse
  request = postJSON cloudHSMv2
  response =
    receiveJSON
      ( \s h x ->
          DeleteHSMResponse'
            <$> (x .?> "HsmId") <*> (pure (fromEnum s))
      )

instance Hashable DeleteHSM

instance NFData DeleteHSM

instance ToHeaders DeleteHSM where
  toHeaders =
    const
      ( mconcat
          [ "X-Amz-Target"
              =# ("BaldrApiService.DeleteHsm" :: ByteString),
            "Content-Type"
              =# ("application/x-amz-json-1.1" :: ByteString)
          ]
      )

instance ToJSON DeleteHSM where
  toJSON DeleteHSM' {..} =
    object
      ( catMaybes
          [ ("EniIp" .=) <$> _dhEniIP,
            ("EniId" .=) <$> _dhEniId,
            ("HsmId" .=) <$> _dhHSMId,
            Just ("ClusterId" .= _dhClusterId)
          ]
      )

instance ToPath DeleteHSM where
  toPath = const "/"

instance ToQuery DeleteHSM where
  toQuery = const mempty

-- | /See:/ 'deleteHSMResponse' smart constructor.
data DeleteHSMResponse = DeleteHSMResponse'
  { _dhrrsHSMId ::
      !(Maybe Text),
    _dhrrsResponseStatus :: !Int
  }
  deriving (Eq, Read, Show, Data, Typeable, Generic)

-- | Creates a value of 'DeleteHSMResponse' with the minimum fields required to make a request.
--
-- Use one of the following lenses to modify other fields as desired:
--
-- * 'dhrrsHSMId' - The identifier (ID) of the HSM that was deleted.
--
-- * 'dhrrsResponseStatus' - -- | The response status code.
deleteHSMResponse ::
  -- | 'dhrrsResponseStatus'
  Int ->
  DeleteHSMResponse
deleteHSMResponse pResponseStatus_ =
  DeleteHSMResponse'
    { _dhrrsHSMId = Nothing,
      _dhrrsResponseStatus = pResponseStatus_
    }

-- | The identifier (ID) of the HSM that was deleted.
dhrrsHSMId :: Lens' DeleteHSMResponse (Maybe Text)
dhrrsHSMId = lens _dhrrsHSMId (\s a -> s {_dhrrsHSMId = a})

-- | -- | The response status code.
dhrrsResponseStatus :: Lens' DeleteHSMResponse Int
dhrrsResponseStatus = lens _dhrrsResponseStatus (\s a -> s {_dhrrsResponseStatus = a})

instance NFData DeleteHSMResponse
