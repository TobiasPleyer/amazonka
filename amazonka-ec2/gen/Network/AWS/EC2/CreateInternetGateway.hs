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
-- Module      : Network.AWS.EC2.CreateInternetGateway
-- Copyright   : (c) 2013-2021 Brendan Hay
-- License     : Mozilla Public License, v. 2.0.
-- Maintainer  : Brendan Hay <brendan.g.hay+amazonka@gmail.com>
-- Stability   : auto-generated
-- Portability : non-portable (GHC extensions)
--
-- Creates an internet gateway for use with a VPC. After creating the internet gateway, you attach it to a VPC using 'AttachInternetGateway' .
--
--
-- For more information about your VPC and internet gateway, see the <https://docs.aws.amazon.com/vpc/latest/userguide/ Amazon Virtual Private Cloud User Guide> .
module Network.AWS.EC2.CreateInternetGateway
  ( -- * Creating a Request
    createInternetGateway,
    CreateInternetGateway,

    -- * Request Lenses
    cigTagSpecifications,
    cigDryRun,

    -- * Destructuring the Response
    createInternetGatewayResponse,
    CreateInternetGatewayResponse,

    -- * Response Lenses
    cigrrsInternetGateway,
    cigrrsResponseStatus,
  )
where

import Network.AWS.EC2.Types
import Network.AWS.Lens
import Network.AWS.Prelude
import Network.AWS.Request
import Network.AWS.Response

-- | /See:/ 'createInternetGateway' smart constructor.
data CreateInternetGateway = CreateInternetGateway'
  { _cigTagSpecifications ::
      !(Maybe [TagSpecification]),
    _cigDryRun :: !(Maybe Bool)
  }
  deriving
    ( Eq,
      Read,
      Show,
      Data,
      Typeable,
      Generic
    )

-- | Creates a value of 'CreateInternetGateway' with the minimum fields required to make a request.
--
-- Use one of the following lenses to modify other fields as desired:
--
-- * 'cigTagSpecifications' - The tags to assign to the internet gateway.
--
-- * 'cigDryRun' - Checks whether you have the required permissions for the action, without actually making the request, and provides an error response. If you have the required permissions, the error response is @DryRunOperation@ . Otherwise, it is @UnauthorizedOperation@ .
createInternetGateway ::
  CreateInternetGateway
createInternetGateway =
  CreateInternetGateway'
    { _cigTagSpecifications =
        Nothing,
      _cigDryRun = Nothing
    }

-- | The tags to assign to the internet gateway.
cigTagSpecifications :: Lens' CreateInternetGateway [TagSpecification]
cigTagSpecifications = lens _cigTagSpecifications (\s a -> s {_cigTagSpecifications = a}) . _Default . _Coerce

-- | Checks whether you have the required permissions for the action, without actually making the request, and provides an error response. If you have the required permissions, the error response is @DryRunOperation@ . Otherwise, it is @UnauthorizedOperation@ .
cigDryRun :: Lens' CreateInternetGateway (Maybe Bool)
cigDryRun = lens _cigDryRun (\s a -> s {_cigDryRun = a})

instance AWSRequest CreateInternetGateway where
  type
    Rs CreateInternetGateway =
      CreateInternetGatewayResponse
  request = postQuery ec2
  response =
    receiveXML
      ( \s h x ->
          CreateInternetGatewayResponse'
            <$> (x .@? "internetGateway") <*> (pure (fromEnum s))
      )

instance Hashable CreateInternetGateway

instance NFData CreateInternetGateway

instance ToHeaders CreateInternetGateway where
  toHeaders = const mempty

instance ToPath CreateInternetGateway where
  toPath = const "/"

instance ToQuery CreateInternetGateway where
  toQuery CreateInternetGateway' {..} =
    mconcat
      [ "Action" =: ("CreateInternetGateway" :: ByteString),
        "Version" =: ("2016-11-15" :: ByteString),
        toQuery
          ( toQueryList "TagSpecification"
              <$> _cigTagSpecifications
          ),
        "DryRun" =: _cigDryRun
      ]

-- | /See:/ 'createInternetGatewayResponse' smart constructor.
data CreateInternetGatewayResponse = CreateInternetGatewayResponse'
  { _cigrrsInternetGateway ::
      !( Maybe
           InternetGateway
       ),
    _cigrrsResponseStatus ::
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

-- | Creates a value of 'CreateInternetGatewayResponse' with the minimum fields required to make a request.
--
-- Use one of the following lenses to modify other fields as desired:
--
-- * 'cigrrsInternetGateway' - Information about the internet gateway.
--
-- * 'cigrrsResponseStatus' - -- | The response status code.
createInternetGatewayResponse ::
  -- | 'cigrrsResponseStatus'
  Int ->
  CreateInternetGatewayResponse
createInternetGatewayResponse pResponseStatus_ =
  CreateInternetGatewayResponse'
    { _cigrrsInternetGateway =
        Nothing,
      _cigrrsResponseStatus = pResponseStatus_
    }

-- | Information about the internet gateway.
cigrrsInternetGateway :: Lens' CreateInternetGatewayResponse (Maybe InternetGateway)
cigrrsInternetGateway = lens _cigrrsInternetGateway (\s a -> s {_cigrrsInternetGateway = a})

-- | -- | The response status code.
cigrrsResponseStatus :: Lens' CreateInternetGatewayResponse Int
cigrrsResponseStatus = lens _cigrrsResponseStatus (\s a -> s {_cigrrsResponseStatus = a})

instance NFData CreateInternetGatewayResponse
