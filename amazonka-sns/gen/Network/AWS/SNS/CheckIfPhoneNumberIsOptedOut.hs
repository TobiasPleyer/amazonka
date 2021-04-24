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
-- Module      : Network.AWS.SNS.CheckIfPhoneNumberIsOptedOut
-- Copyright   : (c) 2013-2021 Brendan Hay
-- License     : Mozilla Public License, v. 2.0.
-- Maintainer  : Brendan Hay <brendan.g.hay+amazonka@gmail.com>
-- Stability   : auto-generated
-- Portability : non-portable (GHC extensions)
--
-- Accepts a phone number and indicates whether the phone holder has opted out of receiving SMS messages from your account. You cannot send SMS messages to a number that is opted out.
--
--
-- To resume sending messages, you can opt in the number by using the @OptInPhoneNumber@ action.
module Network.AWS.SNS.CheckIfPhoneNumberIsOptedOut
  ( -- * Creating a Request
    checkIfPhoneNumberIsOptedOut,
    CheckIfPhoneNumberIsOptedOut,

    -- * Request Lenses
    cipniooPhoneNumber,

    -- * Destructuring the Response
    checkIfPhoneNumberIsOptedOutResponse,
    CheckIfPhoneNumberIsOptedOutResponse,

    -- * Response Lenses
    cipnioorrsIsOptedOut,
    cipnioorrsResponseStatus,
  )
where

import Network.AWS.Lens
import Network.AWS.Prelude
import Network.AWS.Request
import Network.AWS.Response
import Network.AWS.SNS.Types

-- | The input for the @CheckIfPhoneNumberIsOptedOut@ action.
--
--
--
-- /See:/ 'checkIfPhoneNumberIsOptedOut' smart constructor.
newtype CheckIfPhoneNumberIsOptedOut = CheckIfPhoneNumberIsOptedOut'
  { _cipniooPhoneNumber ::
      Text
  }
  deriving
    ( Eq,
      Read,
      Show,
      Data,
      Typeable,
      Generic
    )

-- | Creates a value of 'CheckIfPhoneNumberIsOptedOut' with the minimum fields required to make a request.
--
-- Use one of the following lenses to modify other fields as desired:
--
-- * 'cipniooPhoneNumber' - The phone number for which you want to check the opt out status.
checkIfPhoneNumberIsOptedOut ::
  -- | 'cipniooPhoneNumber'
  Text ->
  CheckIfPhoneNumberIsOptedOut
checkIfPhoneNumberIsOptedOut pPhoneNumber_ =
  CheckIfPhoneNumberIsOptedOut'
    { _cipniooPhoneNumber =
        pPhoneNumber_
    }

-- | The phone number for which you want to check the opt out status.
cipniooPhoneNumber :: Lens' CheckIfPhoneNumberIsOptedOut Text
cipniooPhoneNumber = lens _cipniooPhoneNumber (\s a -> s {_cipniooPhoneNumber = a})

instance AWSRequest CheckIfPhoneNumberIsOptedOut where
  type
    Rs CheckIfPhoneNumberIsOptedOut =
      CheckIfPhoneNumberIsOptedOutResponse
  request = postQuery sns
  response =
    receiveXMLWrapper
      "CheckIfPhoneNumberIsOptedOutResult"
      ( \s h x ->
          CheckIfPhoneNumberIsOptedOutResponse'
            <$> (x .@? "isOptedOut") <*> (pure (fromEnum s))
      )

instance Hashable CheckIfPhoneNumberIsOptedOut

instance NFData CheckIfPhoneNumberIsOptedOut

instance ToHeaders CheckIfPhoneNumberIsOptedOut where
  toHeaders = const mempty

instance ToPath CheckIfPhoneNumberIsOptedOut where
  toPath = const "/"

instance ToQuery CheckIfPhoneNumberIsOptedOut where
  toQuery CheckIfPhoneNumberIsOptedOut' {..} =
    mconcat
      [ "Action"
          =: ("CheckIfPhoneNumberIsOptedOut" :: ByteString),
        "Version" =: ("2010-03-31" :: ByteString),
        "phoneNumber" =: _cipniooPhoneNumber
      ]

-- | The response from the @CheckIfPhoneNumberIsOptedOut@ action.
--
--
--
-- /See:/ 'checkIfPhoneNumberIsOptedOutResponse' smart constructor.
data CheckIfPhoneNumberIsOptedOutResponse = CheckIfPhoneNumberIsOptedOutResponse'
  { _cipnioorrsIsOptedOut ::
      !( Maybe
           Bool
       ),
    _cipnioorrsResponseStatus ::
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

-- | Creates a value of 'CheckIfPhoneNumberIsOptedOutResponse' with the minimum fields required to make a request.
--
-- Use one of the following lenses to modify other fields as desired:
--
-- * 'cipnioorrsIsOptedOut' - Indicates whether the phone number is opted out:     * @true@ – The phone number is opted out, meaning you cannot publish SMS messages to it.     * @false@ – The phone number is opted in, meaning you can publish SMS messages to it.
--
-- * 'cipnioorrsResponseStatus' - -- | The response status code.
checkIfPhoneNumberIsOptedOutResponse ::
  -- | 'cipnioorrsResponseStatus'
  Int ->
  CheckIfPhoneNumberIsOptedOutResponse
checkIfPhoneNumberIsOptedOutResponse pResponseStatus_ =
  CheckIfPhoneNumberIsOptedOutResponse'
    { _cipnioorrsIsOptedOut =
        Nothing,
      _cipnioorrsResponseStatus =
        pResponseStatus_
    }

-- | Indicates whether the phone number is opted out:     * @true@ – The phone number is opted out, meaning you cannot publish SMS messages to it.     * @false@ – The phone number is opted in, meaning you can publish SMS messages to it.
cipnioorrsIsOptedOut :: Lens' CheckIfPhoneNumberIsOptedOutResponse (Maybe Bool)
cipnioorrsIsOptedOut = lens _cipnioorrsIsOptedOut (\s a -> s {_cipnioorrsIsOptedOut = a})

-- | -- | The response status code.
cipnioorrsResponseStatus :: Lens' CheckIfPhoneNumberIsOptedOutResponse Int
cipnioorrsResponseStatus = lens _cipnioorrsResponseStatus (\s a -> s {_cipnioorrsResponseStatus = a})

instance NFData CheckIfPhoneNumberIsOptedOutResponse
