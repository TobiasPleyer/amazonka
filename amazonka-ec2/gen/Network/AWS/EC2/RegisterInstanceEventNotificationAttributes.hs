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
-- Module      : Network.AWS.EC2.RegisterInstanceEventNotificationAttributes
-- Copyright   : (c) 2013-2021 Brendan Hay
-- License     : Mozilla Public License, v. 2.0.
-- Maintainer  : Brendan Hay <brendan.g.hay+amazonka@gmail.com>
-- Stability   : auto-generated
-- Portability : non-portable (GHC extensions)
--
-- Registers a set of tag keys to include in scheduled event notifications for your resources.
--
--
-- To remove tags, use .
module Network.AWS.EC2.RegisterInstanceEventNotificationAttributes
  ( -- * Creating a Request
    registerInstanceEventNotificationAttributes,
    RegisterInstanceEventNotificationAttributes,

    -- * Request Lenses
    rienaDryRun,
    rienaInstanceTagAttribute,

    -- * Destructuring the Response
    registerInstanceEventNotificationAttributesResponse,
    RegisterInstanceEventNotificationAttributesResponse,

    -- * Response Lenses
    rienarrsInstanceTagAttribute,
    rienarrsResponseStatus,
  )
where

import Network.AWS.EC2.Types
import Network.AWS.Lens
import Network.AWS.Prelude
import Network.AWS.Request
import Network.AWS.Response

-- | /See:/ 'registerInstanceEventNotificationAttributes' smart constructor.
data RegisterInstanceEventNotificationAttributes = RegisterInstanceEventNotificationAttributes'
  { _rienaDryRun ::
      !( Maybe
           Bool
       ),
    _rienaInstanceTagAttribute ::
      !( Maybe
           RegisterInstanceTagAttributeRequest
       )
  }
  deriving
    ( Eq,
      Read,
      Show,
      Data,
      Typeable,
      Generic
    )

-- | Creates a value of 'RegisterInstanceEventNotificationAttributes' with the minimum fields required to make a request.
--
-- Use one of the following lenses to modify other fields as desired:
--
-- * 'rienaDryRun' - Checks whether you have the required permissions for the action, without actually making the request, and provides an error response. If you have the required permissions, the error response is @DryRunOperation@ . Otherwise, it is @UnauthorizedOperation@ .
--
-- * 'rienaInstanceTagAttribute' - Information about the tag keys to register.
registerInstanceEventNotificationAttributes ::
  RegisterInstanceEventNotificationAttributes
registerInstanceEventNotificationAttributes =
  RegisterInstanceEventNotificationAttributes'
    { _rienaDryRun =
        Nothing,
      _rienaInstanceTagAttribute =
        Nothing
    }

-- | Checks whether you have the required permissions for the action, without actually making the request, and provides an error response. If you have the required permissions, the error response is @DryRunOperation@ . Otherwise, it is @UnauthorizedOperation@ .
rienaDryRun :: Lens' RegisterInstanceEventNotificationAttributes (Maybe Bool)
rienaDryRun = lens _rienaDryRun (\s a -> s {_rienaDryRun = a})

-- | Information about the tag keys to register.
rienaInstanceTagAttribute :: Lens' RegisterInstanceEventNotificationAttributes (Maybe RegisterInstanceTagAttributeRequest)
rienaInstanceTagAttribute = lens _rienaInstanceTagAttribute (\s a -> s {_rienaInstanceTagAttribute = a})

instance
  AWSRequest
    RegisterInstanceEventNotificationAttributes
  where
  type
    Rs RegisterInstanceEventNotificationAttributes =
      RegisterInstanceEventNotificationAttributesResponse
  request = postQuery ec2
  response =
    receiveXML
      ( \s h x ->
          RegisterInstanceEventNotificationAttributesResponse'
            <$> (x .@? "instanceTagAttribute")
              <*> (pure (fromEnum s))
      )

instance
  Hashable
    RegisterInstanceEventNotificationAttributes

instance
  NFData
    RegisterInstanceEventNotificationAttributes

instance
  ToHeaders
    RegisterInstanceEventNotificationAttributes
  where
  toHeaders = const mempty

instance
  ToPath
    RegisterInstanceEventNotificationAttributes
  where
  toPath = const "/"

instance
  ToQuery
    RegisterInstanceEventNotificationAttributes
  where
  toQuery
    RegisterInstanceEventNotificationAttributes' {..} =
      mconcat
        [ "Action"
            =: ( "RegisterInstanceEventNotificationAttributes" ::
                   ByteString
               ),
          "Version" =: ("2016-11-15" :: ByteString),
          "DryRun" =: _rienaDryRun,
          "InstanceTagAttribute" =: _rienaInstanceTagAttribute
        ]

-- | /See:/ 'registerInstanceEventNotificationAttributesResponse' smart constructor.
data RegisterInstanceEventNotificationAttributesResponse = RegisterInstanceEventNotificationAttributesResponse'
  { _rienarrsInstanceTagAttribute ::
      !( Maybe
           InstanceTagNotificationAttribute
       ),
    _rienarrsResponseStatus ::
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

-- | Creates a value of 'RegisterInstanceEventNotificationAttributesResponse' with the minimum fields required to make a request.
--
-- Use one of the following lenses to modify other fields as desired:
--
-- * 'rienarrsInstanceTagAttribute' - The resulting set of tag keys.
--
-- * 'rienarrsResponseStatus' - -- | The response status code.
registerInstanceEventNotificationAttributesResponse ::
  -- | 'rienarrsResponseStatus'
  Int ->
  RegisterInstanceEventNotificationAttributesResponse
registerInstanceEventNotificationAttributesResponse
  pResponseStatus_ =
    RegisterInstanceEventNotificationAttributesResponse'
      { _rienarrsInstanceTagAttribute =
          Nothing,
        _rienarrsResponseStatus =
          pResponseStatus_
      }

-- | The resulting set of tag keys.
rienarrsInstanceTagAttribute :: Lens' RegisterInstanceEventNotificationAttributesResponse (Maybe InstanceTagNotificationAttribute)
rienarrsInstanceTagAttribute = lens _rienarrsInstanceTagAttribute (\s a -> s {_rienarrsInstanceTagAttribute = a})

-- | -- | The response status code.
rienarrsResponseStatus :: Lens' RegisterInstanceEventNotificationAttributesResponse Int
rienarrsResponseStatus = lens _rienarrsResponseStatus (\s a -> s {_rienarrsResponseStatus = a})

instance
  NFData
    RegisterInstanceEventNotificationAttributesResponse
