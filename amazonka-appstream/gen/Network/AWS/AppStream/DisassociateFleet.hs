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
-- Module      : Network.AWS.AppStream.DisassociateFleet
-- Copyright   : (c) 2013-2021 Brendan Hay
-- License     : Mozilla Public License, v. 2.0.
-- Maintainer  : Brendan Hay <brendan.g.hay+amazonka@gmail.com>
-- Stability   : auto-generated
-- Portability : non-portable (GHC extensions)
--
-- Disassociates the specified fleet from the specified stack.
module Network.AWS.AppStream.DisassociateFleet
  ( -- * Creating a Request
    disassociateFleet,
    DisassociateFleet,

    -- * Request Lenses
    dfFleetName,
    dfStackName,

    -- * Destructuring the Response
    disassociateFleetResponse,
    DisassociateFleetResponse,

    -- * Response Lenses
    disrsResponseStatus,
  )
where

import Network.AWS.AppStream.Types
import Network.AWS.Lens
import Network.AWS.Prelude
import Network.AWS.Request
import Network.AWS.Response

-- | /See:/ 'disassociateFleet' smart constructor.
data DisassociateFleet = DisassociateFleet'
  { _dfFleetName ::
      !Text,
    _dfStackName :: !Text
  }
  deriving (Eq, Read, Show, Data, Typeable, Generic)

-- | Creates a value of 'DisassociateFleet' with the minimum fields required to make a request.
--
-- Use one of the following lenses to modify other fields as desired:
--
-- * 'dfFleetName' - The name of the fleet.
--
-- * 'dfStackName' - The name of the stack.
disassociateFleet ::
  -- | 'dfFleetName'
  Text ->
  -- | 'dfStackName'
  Text ->
  DisassociateFleet
disassociateFleet pFleetName_ pStackName_ =
  DisassociateFleet'
    { _dfFleetName = pFleetName_,
      _dfStackName = pStackName_
    }

-- | The name of the fleet.
dfFleetName :: Lens' DisassociateFleet Text
dfFleetName = lens _dfFleetName (\s a -> s {_dfFleetName = a})

-- | The name of the stack.
dfStackName :: Lens' DisassociateFleet Text
dfStackName = lens _dfStackName (\s a -> s {_dfStackName = a})

instance AWSRequest DisassociateFleet where
  type Rs DisassociateFleet = DisassociateFleetResponse
  request = postJSON appStream
  response =
    receiveEmpty
      ( \s h x ->
          DisassociateFleetResponse' <$> (pure (fromEnum s))
      )

instance Hashable DisassociateFleet

instance NFData DisassociateFleet

instance ToHeaders DisassociateFleet where
  toHeaders =
    const
      ( mconcat
          [ "X-Amz-Target"
              =# ( "PhotonAdminProxyService.DisassociateFleet" ::
                     ByteString
                 ),
            "Content-Type"
              =# ("application/x-amz-json-1.1" :: ByteString)
          ]
      )

instance ToJSON DisassociateFleet where
  toJSON DisassociateFleet' {..} =
    object
      ( catMaybes
          [ Just ("FleetName" .= _dfFleetName),
            Just ("StackName" .= _dfStackName)
          ]
      )

instance ToPath DisassociateFleet where
  toPath = const "/"

instance ToQuery DisassociateFleet where
  toQuery = const mempty

-- | /See:/ 'disassociateFleetResponse' smart constructor.
newtype DisassociateFleetResponse = DisassociateFleetResponse'
  { _disrsResponseStatus ::
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

-- | Creates a value of 'DisassociateFleetResponse' with the minimum fields required to make a request.
--
-- Use one of the following lenses to modify other fields as desired:
--
-- * 'disrsResponseStatus' - -- | The response status code.
disassociateFleetResponse ::
  -- | 'disrsResponseStatus'
  Int ->
  DisassociateFleetResponse
disassociateFleetResponse pResponseStatus_ =
  DisassociateFleetResponse'
    { _disrsResponseStatus =
        pResponseStatus_
    }

-- | -- | The response status code.
disrsResponseStatus :: Lens' DisassociateFleetResponse Int
disrsResponseStatus = lens _disrsResponseStatus (\s a -> s {_disrsResponseStatus = a})

instance NFData DisassociateFleetResponse
