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
-- Module      : Network.AWS.EC2.CreateDefaultSubnet
-- Copyright   : (c) 2013-2021 Brendan Hay
-- License     : Mozilla Public License, v. 2.0.
-- Maintainer  : Brendan Hay <brendan.g.hay+amazonka@gmail.com>
-- Stability   : auto-generated
-- Portability : non-portable (GHC extensions)
--
-- Creates a default subnet with a size @/20@ IPv4 CIDR block in the specified Availability Zone in your default VPC. You can have only one default subnet per Availability Zone. For more information, see <https://docs.aws.amazon.com/vpc/latest/userguide/default-vpc.html#create-default-subnet Creating a Default Subnet> in the /Amazon Virtual Private Cloud User Guide/ .
module Network.AWS.EC2.CreateDefaultSubnet
  ( -- * Creating a Request
    createDefaultSubnet,
    CreateDefaultSubnet,

    -- * Request Lenses
    cdsDryRun,
    cdsAvailabilityZone,

    -- * Destructuring the Response
    createDefaultSubnetResponse,
    CreateDefaultSubnetResponse,

    -- * Response Lenses
    cdsrrsSubnet,
    cdsrrsResponseStatus,
  )
where

import Network.AWS.EC2.Types
import Network.AWS.Lens
import Network.AWS.Prelude
import Network.AWS.Request
import Network.AWS.Response

-- | /See:/ 'createDefaultSubnet' smart constructor.
data CreateDefaultSubnet = CreateDefaultSubnet'
  { _cdsDryRun ::
      !(Maybe Bool),
    _cdsAvailabilityZone :: !Text
  }
  deriving (Eq, Read, Show, Data, Typeable, Generic)

-- | Creates a value of 'CreateDefaultSubnet' with the minimum fields required to make a request.
--
-- Use one of the following lenses to modify other fields as desired:
--
-- * 'cdsDryRun' - Checks whether you have the required permissions for the action, without actually making the request, and provides an error response. If you have the required permissions, the error response is @DryRunOperation@ . Otherwise, it is @UnauthorizedOperation@ .
--
-- * 'cdsAvailabilityZone' - The Availability Zone in which to create the default subnet.
createDefaultSubnet ::
  -- | 'cdsAvailabilityZone'
  Text ->
  CreateDefaultSubnet
createDefaultSubnet pAvailabilityZone_ =
  CreateDefaultSubnet'
    { _cdsDryRun = Nothing,
      _cdsAvailabilityZone = pAvailabilityZone_
    }

-- | Checks whether you have the required permissions for the action, without actually making the request, and provides an error response. If you have the required permissions, the error response is @DryRunOperation@ . Otherwise, it is @UnauthorizedOperation@ .
cdsDryRun :: Lens' CreateDefaultSubnet (Maybe Bool)
cdsDryRun = lens _cdsDryRun (\s a -> s {_cdsDryRun = a})

-- | The Availability Zone in which to create the default subnet.
cdsAvailabilityZone :: Lens' CreateDefaultSubnet Text
cdsAvailabilityZone = lens _cdsAvailabilityZone (\s a -> s {_cdsAvailabilityZone = a})

instance AWSRequest CreateDefaultSubnet where
  type
    Rs CreateDefaultSubnet =
      CreateDefaultSubnetResponse
  request = postQuery ec2
  response =
    receiveXML
      ( \s h x ->
          CreateDefaultSubnetResponse'
            <$> (x .@? "subnet") <*> (pure (fromEnum s))
      )

instance Hashable CreateDefaultSubnet

instance NFData CreateDefaultSubnet

instance ToHeaders CreateDefaultSubnet where
  toHeaders = const mempty

instance ToPath CreateDefaultSubnet where
  toPath = const "/"

instance ToQuery CreateDefaultSubnet where
  toQuery CreateDefaultSubnet' {..} =
    mconcat
      [ "Action" =: ("CreateDefaultSubnet" :: ByteString),
        "Version" =: ("2016-11-15" :: ByteString),
        "DryRun" =: _cdsDryRun,
        "AvailabilityZone" =: _cdsAvailabilityZone
      ]

-- | /See:/ 'createDefaultSubnetResponse' smart constructor.
data CreateDefaultSubnetResponse = CreateDefaultSubnetResponse'
  { _cdsrrsSubnet ::
      !(Maybe Subnet),
    _cdsrrsResponseStatus ::
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

-- | Creates a value of 'CreateDefaultSubnetResponse' with the minimum fields required to make a request.
--
-- Use one of the following lenses to modify other fields as desired:
--
-- * 'cdsrrsSubnet' - Information about the subnet.
--
-- * 'cdsrrsResponseStatus' - -- | The response status code.
createDefaultSubnetResponse ::
  -- | 'cdsrrsResponseStatus'
  Int ->
  CreateDefaultSubnetResponse
createDefaultSubnetResponse pResponseStatus_ =
  CreateDefaultSubnetResponse'
    { _cdsrrsSubnet =
        Nothing,
      _cdsrrsResponseStatus = pResponseStatus_
    }

-- | Information about the subnet.
cdsrrsSubnet :: Lens' CreateDefaultSubnetResponse (Maybe Subnet)
cdsrrsSubnet = lens _cdsrrsSubnet (\s a -> s {_cdsrrsSubnet = a})

-- | -- | The response status code.
cdsrrsResponseStatus :: Lens' CreateDefaultSubnetResponse Int
cdsrrsResponseStatus = lens _cdsrrsResponseStatus (\s a -> s {_cdsrrsResponseStatus = a})

instance NFData CreateDefaultSubnetResponse
