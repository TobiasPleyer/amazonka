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
-- Module      : Network.AWS.EC2.CreateCarrierGateway
-- Copyright   : (c) 2013-2021 Brendan Hay
-- License     : Mozilla Public License, v. 2.0.
-- Maintainer  : Brendan Hay <brendan.g.hay+amazonka@gmail.com>
-- Stability   : auto-generated
-- Portability : non-portable (GHC extensions)
--
-- Creates a carrier gateway. For more information about carrier gateways, see <https://docs.aws.amazon.com/wavelength/latest/developerguide/how-wavelengths-work.html#wavelength-carrier-gateway Carrier gateways> in the /AWS Wavelength Developer Guide/ .
module Network.AWS.EC2.CreateCarrierGateway
  ( -- * Creating a Request
    createCarrierGateway,
    CreateCarrierGateway,

    -- * Request Lenses
    ccgcTagSpecifications,
    ccgcDryRun,
    ccgcClientToken,
    ccgcVPCId,

    -- * Destructuring the Response
    createCarrierGatewayResponse,
    CreateCarrierGatewayResponse,

    -- * Response Lenses
    ccgrrsCarrierGateway,
    ccgrrsResponseStatus,
  )
where

import Network.AWS.EC2.Types
import Network.AWS.Lens
import Network.AWS.Prelude
import Network.AWS.Request
import Network.AWS.Response

-- | /See:/ 'createCarrierGateway' smart constructor.
data CreateCarrierGateway = CreateCarrierGateway'
  { _ccgcTagSpecifications ::
      !(Maybe [TagSpecification]),
    _ccgcDryRun :: !(Maybe Bool),
    _ccgcClientToken ::
      !(Maybe Text),
    _ccgcVPCId :: !Text
  }
  deriving (Eq, Read, Show, Data, Typeable, Generic)

-- | Creates a value of 'CreateCarrierGateway' with the minimum fields required to make a request.
--
-- Use one of the following lenses to modify other fields as desired:
--
-- * 'ccgcTagSpecifications' - The tags to associate with the carrier gateway.
--
-- * 'ccgcDryRun' - Checks whether you have the required permissions for the action, without actually making the request, and provides an error response. If you have the required permissions, the error response is @DryRunOperation@ . Otherwise, it is @UnauthorizedOperation@ .
--
-- * 'ccgcClientToken' - Unique, case-sensitive identifier that you provide to ensure the idempotency of the request. For more information, see <https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/Run_Instance_Idempotency.html How to Ensure Idempotency> .
--
-- * 'ccgcVPCId' - The ID of the VPC to associate with the carrier gateway.
createCarrierGateway ::
  -- | 'ccgcVPCId'
  Text ->
  CreateCarrierGateway
createCarrierGateway pVPCId_ =
  CreateCarrierGateway'
    { _ccgcTagSpecifications =
        Nothing,
      _ccgcDryRun = Nothing,
      _ccgcClientToken = Nothing,
      _ccgcVPCId = pVPCId_
    }

-- | The tags to associate with the carrier gateway.
ccgcTagSpecifications :: Lens' CreateCarrierGateway [TagSpecification]
ccgcTagSpecifications = lens _ccgcTagSpecifications (\s a -> s {_ccgcTagSpecifications = a}) . _Default . _Coerce

-- | Checks whether you have the required permissions for the action, without actually making the request, and provides an error response. If you have the required permissions, the error response is @DryRunOperation@ . Otherwise, it is @UnauthorizedOperation@ .
ccgcDryRun :: Lens' CreateCarrierGateway (Maybe Bool)
ccgcDryRun = lens _ccgcDryRun (\s a -> s {_ccgcDryRun = a})

-- | Unique, case-sensitive identifier that you provide to ensure the idempotency of the request. For more information, see <https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/Run_Instance_Idempotency.html How to Ensure Idempotency> .
ccgcClientToken :: Lens' CreateCarrierGateway (Maybe Text)
ccgcClientToken = lens _ccgcClientToken (\s a -> s {_ccgcClientToken = a})

-- | The ID of the VPC to associate with the carrier gateway.
ccgcVPCId :: Lens' CreateCarrierGateway Text
ccgcVPCId = lens _ccgcVPCId (\s a -> s {_ccgcVPCId = a})

instance AWSRequest CreateCarrierGateway where
  type
    Rs CreateCarrierGateway =
      CreateCarrierGatewayResponse
  request = postQuery ec2
  response =
    receiveXML
      ( \s h x ->
          CreateCarrierGatewayResponse'
            <$> (x .@? "carrierGateway") <*> (pure (fromEnum s))
      )

instance Hashable CreateCarrierGateway

instance NFData CreateCarrierGateway

instance ToHeaders CreateCarrierGateway where
  toHeaders = const mempty

instance ToPath CreateCarrierGateway where
  toPath = const "/"

instance ToQuery CreateCarrierGateway where
  toQuery CreateCarrierGateway' {..} =
    mconcat
      [ "Action" =: ("CreateCarrierGateway" :: ByteString),
        "Version" =: ("2016-11-15" :: ByteString),
        toQuery
          ( toQueryList "TagSpecification"
              <$> _ccgcTagSpecifications
          ),
        "DryRun" =: _ccgcDryRun,
        "ClientToken" =: _ccgcClientToken,
        "VpcId" =: _ccgcVPCId
      ]

-- | /See:/ 'createCarrierGatewayResponse' smart constructor.
data CreateCarrierGatewayResponse = CreateCarrierGatewayResponse'
  { _ccgrrsCarrierGateway ::
      !( Maybe
           CarrierGateway
       ),
    _ccgrrsResponseStatus ::
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

-- | Creates a value of 'CreateCarrierGatewayResponse' with the minimum fields required to make a request.
--
-- Use one of the following lenses to modify other fields as desired:
--
-- * 'ccgrrsCarrierGateway' - Information about the carrier gateway.
--
-- * 'ccgrrsResponseStatus' - -- | The response status code.
createCarrierGatewayResponse ::
  -- | 'ccgrrsResponseStatus'
  Int ->
  CreateCarrierGatewayResponse
createCarrierGatewayResponse pResponseStatus_ =
  CreateCarrierGatewayResponse'
    { _ccgrrsCarrierGateway =
        Nothing,
      _ccgrrsResponseStatus = pResponseStatus_
    }

-- | Information about the carrier gateway.
ccgrrsCarrierGateway :: Lens' CreateCarrierGatewayResponse (Maybe CarrierGateway)
ccgrrsCarrierGateway = lens _ccgrrsCarrierGateway (\s a -> s {_ccgrrsCarrierGateway = a})

-- | -- | The response status code.
ccgrrsResponseStatus :: Lens' CreateCarrierGatewayResponse Int
ccgrrsResponseStatus = lens _ccgrrsResponseStatus (\s a -> s {_ccgrrsResponseStatus = a})

instance NFData CreateCarrierGatewayResponse
