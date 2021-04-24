{-# LANGUAGE DeriveDataTypeable #-}
{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE RecordWildCards #-}
{-# OPTIONS_GHC -fno-warn-unused-imports #-}

-- Derived from AWS service descriptions, licensed under Apache 2.0.

-- |
-- Module      : Network.AWS.EC2.Types.ReservedInstancesListing
-- Copyright   : (c) 2013-2021 Brendan Hay
-- License     : Mozilla Public License, v. 2.0.
-- Maintainer  : Brendan Hay <brendan.g.hay+amazonka@gmail.com>
-- Stability   : auto-generated
-- Portability : non-portable (GHC extensions)
module Network.AWS.EC2.Types.ReservedInstancesListing where

import Network.AWS.EC2.Internal
import Network.AWS.EC2.Types.InstanceCount
import Network.AWS.EC2.Types.ListingStatus
import Network.AWS.EC2.Types.PriceSchedule
import Network.AWS.EC2.Types.Tag
import Network.AWS.Lens
import Network.AWS.Prelude

-- | Describes a Reserved Instance listing.
--
--
--
-- /See:/ 'reservedInstancesListing' smart constructor.
data ReservedInstancesListing = ReservedInstancesListing'
  { _rilStatusMessage ::
      !(Maybe Text),
    _rilStatus ::
      !( Maybe
           ListingStatus
       ),
    _rilPriceSchedules ::
      !( Maybe
           [PriceSchedule]
       ),
    _rilReservedInstancesId ::
      !(Maybe Text),
    _rilCreateDate ::
      !(Maybe ISO8601),
    _rilTags ::
      !(Maybe [Tag]),
    _rilInstanceCounts ::
      !( Maybe
           [InstanceCount]
       ),
    _rilReservedInstancesListingId ::
      !(Maybe Text),
    _rilUpdateDate ::
      !(Maybe ISO8601),
    _rilClientToken ::
      !(Maybe Text)
  }
  deriving
    ( Eq,
      Read,
      Show,
      Data,
      Typeable,
      Generic
    )

-- | Creates a value of 'ReservedInstancesListing' with the minimum fields required to make a request.
--
-- Use one of the following lenses to modify other fields as desired:
--
-- * 'rilStatusMessage' - The reason for the current status of the Reserved Instance listing. The response can be blank.
--
-- * 'rilStatus' - The status of the Reserved Instance listing.
--
-- * 'rilPriceSchedules' - The price of the Reserved Instance listing.
--
-- * 'rilReservedInstancesId' - The ID of the Reserved Instance.
--
-- * 'rilCreateDate' - The time the listing was created.
--
-- * 'rilTags' - Any tags assigned to the resource.
--
-- * 'rilInstanceCounts' - The number of instances in this state.
--
-- * 'rilReservedInstancesListingId' - The ID of the Reserved Instance listing.
--
-- * 'rilUpdateDate' - The last modified timestamp of the listing.
--
-- * 'rilClientToken' - A unique, case-sensitive key supplied by the client to ensure that the request is idempotent. For more information, see <https://docs.aws.amazon.com/AWSEC2/latest/APIReference/Run_Instance_Idempotency.html Ensuring Idempotency> .
reservedInstancesListing ::
  ReservedInstancesListing
reservedInstancesListing =
  ReservedInstancesListing'
    { _rilStatusMessage =
        Nothing,
      _rilStatus = Nothing,
      _rilPriceSchedules = Nothing,
      _rilReservedInstancesId = Nothing,
      _rilCreateDate = Nothing,
      _rilTags = Nothing,
      _rilInstanceCounts = Nothing,
      _rilReservedInstancesListingId = Nothing,
      _rilUpdateDate = Nothing,
      _rilClientToken = Nothing
    }

-- | The reason for the current status of the Reserved Instance listing. The response can be blank.
rilStatusMessage :: Lens' ReservedInstancesListing (Maybe Text)
rilStatusMessage = lens _rilStatusMessage (\s a -> s {_rilStatusMessage = a})

-- | The status of the Reserved Instance listing.
rilStatus :: Lens' ReservedInstancesListing (Maybe ListingStatus)
rilStatus = lens _rilStatus (\s a -> s {_rilStatus = a})

-- | The price of the Reserved Instance listing.
rilPriceSchedules :: Lens' ReservedInstancesListing [PriceSchedule]
rilPriceSchedules = lens _rilPriceSchedules (\s a -> s {_rilPriceSchedules = a}) . _Default . _Coerce

-- | The ID of the Reserved Instance.
rilReservedInstancesId :: Lens' ReservedInstancesListing (Maybe Text)
rilReservedInstancesId = lens _rilReservedInstancesId (\s a -> s {_rilReservedInstancesId = a})

-- | The time the listing was created.
rilCreateDate :: Lens' ReservedInstancesListing (Maybe UTCTime)
rilCreateDate = lens _rilCreateDate (\s a -> s {_rilCreateDate = a}) . mapping _Time

-- | Any tags assigned to the resource.
rilTags :: Lens' ReservedInstancesListing [Tag]
rilTags = lens _rilTags (\s a -> s {_rilTags = a}) . _Default . _Coerce

-- | The number of instances in this state.
rilInstanceCounts :: Lens' ReservedInstancesListing [InstanceCount]
rilInstanceCounts = lens _rilInstanceCounts (\s a -> s {_rilInstanceCounts = a}) . _Default . _Coerce

-- | The ID of the Reserved Instance listing.
rilReservedInstancesListingId :: Lens' ReservedInstancesListing (Maybe Text)
rilReservedInstancesListingId = lens _rilReservedInstancesListingId (\s a -> s {_rilReservedInstancesListingId = a})

-- | The last modified timestamp of the listing.
rilUpdateDate :: Lens' ReservedInstancesListing (Maybe UTCTime)
rilUpdateDate = lens _rilUpdateDate (\s a -> s {_rilUpdateDate = a}) . mapping _Time

-- | A unique, case-sensitive key supplied by the client to ensure that the request is idempotent. For more information, see <https://docs.aws.amazon.com/AWSEC2/latest/APIReference/Run_Instance_Idempotency.html Ensuring Idempotency> .
rilClientToken :: Lens' ReservedInstancesListing (Maybe Text)
rilClientToken = lens _rilClientToken (\s a -> s {_rilClientToken = a})

instance FromXML ReservedInstancesListing where
  parseXML x =
    ReservedInstancesListing'
      <$> (x .@? "statusMessage")
      <*> (x .@? "status")
      <*> ( x .@? "priceSchedules" .!@ mempty
              >>= may (parseXMLList "item")
          )
      <*> (x .@? "reservedInstancesId")
      <*> (x .@? "createDate")
      <*> ( x .@? "tagSet" .!@ mempty
              >>= may (parseXMLList "item")
          )
      <*> ( x .@? "instanceCounts" .!@ mempty
              >>= may (parseXMLList "item")
          )
      <*> (x .@? "reservedInstancesListingId")
      <*> (x .@? "updateDate")
      <*> (x .@? "clientToken")

instance Hashable ReservedInstancesListing

instance NFData ReservedInstancesListing
