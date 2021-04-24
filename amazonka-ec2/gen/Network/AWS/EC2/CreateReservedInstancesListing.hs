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
-- Module      : Network.AWS.EC2.CreateReservedInstancesListing
-- Copyright   : (c) 2013-2021 Brendan Hay
-- License     : Mozilla Public License, v. 2.0.
-- Maintainer  : Brendan Hay <brendan.g.hay+amazonka@gmail.com>
-- Stability   : auto-generated
-- Portability : non-portable (GHC extensions)
--
-- Creates a listing for Amazon EC2 Standard Reserved Instances to be sold in the Reserved Instance Marketplace. You can submit one Standard Reserved Instance listing at a time. To get a list of your Standard Reserved Instances, you can use the 'DescribeReservedInstances' operation.
--
--
-- The Reserved Instance Marketplace matches sellers who want to resell Standard Reserved Instance capacity that they no longer need with buyers who want to purchase additional capacity. Reserved Instances bought and sold through the Reserved Instance Marketplace work like any other Reserved Instances.
--
-- To sell your Standard Reserved Instances, you must first register as a seller in the Reserved Instance Marketplace. After completing the registration process, you can create a Reserved Instance Marketplace listing of some or all of your Standard Reserved Instances, and specify the upfront price to receive for them. Your Standard Reserved Instance listings then become available for purchase. To view the details of your Standard Reserved Instance listing, you can use the 'DescribeReservedInstancesListings' operation.
--
-- For more information, see <https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ri-market-general.html Reserved Instance Marketplace> in the /Amazon EC2 User Guide/ .
module Network.AWS.EC2.CreateReservedInstancesListing
  ( -- * Creating a Request
    createReservedInstancesListing,
    CreateReservedInstancesListing,

    -- * Request Lenses
    crilClientToken,
    crilInstanceCount,
    crilPriceSchedules,
    crilReservedInstancesId,

    -- * Destructuring the Response
    createReservedInstancesListingResponse,
    CreateReservedInstancesListingResponse,

    -- * Response Lenses
    crilrrrsReservedInstancesListings,
    crilrrrsResponseStatus,
  )
where

import Network.AWS.EC2.Types
import Network.AWS.Lens
import Network.AWS.Prelude
import Network.AWS.Request
import Network.AWS.Response

-- | Contains the parameters for CreateReservedInstancesListing.
--
--
--
-- /See:/ 'createReservedInstancesListing' smart constructor.
data CreateReservedInstancesListing = CreateReservedInstancesListing'
  { _crilClientToken ::
      !Text,
    _crilInstanceCount ::
      !Int,
    _crilPriceSchedules ::
      ![PriceScheduleSpecification],
    _crilReservedInstancesId ::
      !Text
  }
  deriving
    ( Eq,
      Read,
      Show,
      Data,
      Typeable,
      Generic
    )

-- | Creates a value of 'CreateReservedInstancesListing' with the minimum fields required to make a request.
--
-- Use one of the following lenses to modify other fields as desired:
--
-- * 'crilClientToken' - Unique, case-sensitive identifier you provide to ensure idempotency of your listings. This helps avoid duplicate listings. For more information, see <https://docs.aws.amazon.com/AWSEC2/latest/APIReference/Run_Instance_Idempotency.html Ensuring Idempotency> .
--
-- * 'crilInstanceCount' - The number of instances that are a part of a Reserved Instance account to be listed in the Reserved Instance Marketplace. This number should be less than or equal to the instance count associated with the Reserved Instance ID specified in this call.
--
-- * 'crilPriceSchedules' - A list specifying the price of the Standard Reserved Instance for each month remaining in the Reserved Instance term.
--
-- * 'crilReservedInstancesId' - The ID of the active Standard Reserved Instance.
createReservedInstancesListing ::
  -- | 'crilClientToken'
  Text ->
  -- | 'crilInstanceCount'
  Int ->
  -- | 'crilReservedInstancesId'
  Text ->
  CreateReservedInstancesListing
createReservedInstancesListing
  pClientToken_
  pInstanceCount_
  pReservedInstancesId_ =
    CreateReservedInstancesListing'
      { _crilClientToken =
          pClientToken_,
        _crilInstanceCount = pInstanceCount_,
        _crilPriceSchedules = mempty,
        _crilReservedInstancesId =
          pReservedInstancesId_
      }

-- | Unique, case-sensitive identifier you provide to ensure idempotency of your listings. This helps avoid duplicate listings. For more information, see <https://docs.aws.amazon.com/AWSEC2/latest/APIReference/Run_Instance_Idempotency.html Ensuring Idempotency> .
crilClientToken :: Lens' CreateReservedInstancesListing Text
crilClientToken = lens _crilClientToken (\s a -> s {_crilClientToken = a})

-- | The number of instances that are a part of a Reserved Instance account to be listed in the Reserved Instance Marketplace. This number should be less than or equal to the instance count associated with the Reserved Instance ID specified in this call.
crilInstanceCount :: Lens' CreateReservedInstancesListing Int
crilInstanceCount = lens _crilInstanceCount (\s a -> s {_crilInstanceCount = a})

-- | A list specifying the price of the Standard Reserved Instance for each month remaining in the Reserved Instance term.
crilPriceSchedules :: Lens' CreateReservedInstancesListing [PriceScheduleSpecification]
crilPriceSchedules = lens _crilPriceSchedules (\s a -> s {_crilPriceSchedules = a}) . _Coerce

-- | The ID of the active Standard Reserved Instance.
crilReservedInstancesId :: Lens' CreateReservedInstancesListing Text
crilReservedInstancesId = lens _crilReservedInstancesId (\s a -> s {_crilReservedInstancesId = a})

instance AWSRequest CreateReservedInstancesListing where
  type
    Rs CreateReservedInstancesListing =
      CreateReservedInstancesListingResponse
  request = postQuery ec2
  response =
    receiveXML
      ( \s h x ->
          CreateReservedInstancesListingResponse'
            <$> ( x .@? "reservedInstancesListingsSet" .!@ mempty
                    >>= may (parseXMLList "item")
                )
            <*> (pure (fromEnum s))
      )

instance Hashable CreateReservedInstancesListing

instance NFData CreateReservedInstancesListing

instance ToHeaders CreateReservedInstancesListing where
  toHeaders = const mempty

instance ToPath CreateReservedInstancesListing where
  toPath = const "/"

instance ToQuery CreateReservedInstancesListing where
  toQuery CreateReservedInstancesListing' {..} =
    mconcat
      [ "Action"
          =: ("CreateReservedInstancesListing" :: ByteString),
        "Version" =: ("2016-11-15" :: ByteString),
        "ClientToken" =: _crilClientToken,
        "InstanceCount" =: _crilInstanceCount,
        toQueryList "PriceSchedules" _crilPriceSchedules,
        "ReservedInstancesId" =: _crilReservedInstancesId
      ]

-- | Contains the output of CreateReservedInstancesListing.
--
--
--
-- /See:/ 'createReservedInstancesListingResponse' smart constructor.
data CreateReservedInstancesListingResponse = CreateReservedInstancesListingResponse'
  { _crilrrrsReservedInstancesListings ::
      !( Maybe
           [ReservedInstancesListing]
       ),
    _crilrrrsResponseStatus ::
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

-- | Creates a value of 'CreateReservedInstancesListingResponse' with the minimum fields required to make a request.
--
-- Use one of the following lenses to modify other fields as desired:
--
-- * 'crilrrrsReservedInstancesListings' - Information about the Standard Reserved Instance listing.
--
-- * 'crilrrrsResponseStatus' - -- | The response status code.
createReservedInstancesListingResponse ::
  -- | 'crilrrrsResponseStatus'
  Int ->
  CreateReservedInstancesListingResponse
createReservedInstancesListingResponse
  pResponseStatus_ =
    CreateReservedInstancesListingResponse'
      { _crilrrrsReservedInstancesListings =
          Nothing,
        _crilrrrsResponseStatus =
          pResponseStatus_
      }

-- | Information about the Standard Reserved Instance listing.
crilrrrsReservedInstancesListings :: Lens' CreateReservedInstancesListingResponse [ReservedInstancesListing]
crilrrrsReservedInstancesListings = lens _crilrrrsReservedInstancesListings (\s a -> s {_crilrrrsReservedInstancesListings = a}) . _Default . _Coerce

-- | -- | The response status code.
crilrrrsResponseStatus :: Lens' CreateReservedInstancesListingResponse Int
crilrrrsResponseStatus = lens _crilrrrsResponseStatus (\s a -> s {_crilrrrsResponseStatus = a})

instance
  NFData
    CreateReservedInstancesListingResponse
