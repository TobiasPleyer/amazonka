{-# LANGUAGE DeriveDataTypeable #-}
{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE RecordWildCards #-}
{-# OPTIONS_GHC -fno-warn-unused-imports #-}

-- Derived from AWS service descriptions, licensed under Apache 2.0.

-- |
-- Module      : Network.AWS.CostExplorer.Types.ReservationPurchaseRecommendationSummary
-- Copyright   : (c) 2013-2021 Brendan Hay
-- License     : Mozilla Public License, v. 2.0.
-- Maintainer  : Brendan Hay <brendan.g.hay+amazonka@gmail.com>
-- Stability   : auto-generated
-- Portability : non-portable (GHC extensions)
module Network.AWS.CostExplorer.Types.ReservationPurchaseRecommendationSummary where

import Network.AWS.Lens
import Network.AWS.Prelude

-- | A summary about this recommendation, such as the currency code, the amount that AWS estimates that you could save, and the total amount of reservation to purchase.
--
--
--
-- /See:/ 'reservationPurchaseRecommendationSummary' smart constructor.
data ReservationPurchaseRecommendationSummary = ReservationPurchaseRecommendationSummary'
  { _rprsTotalEstimatedMonthlySavingsAmount ::
      !( Maybe
           Text
       ),
    _rprsCurrencyCode ::
      !( Maybe
           Text
       ),
    _rprsTotalEstimatedMonthlySavingsPercentage ::
      !( Maybe
           Text
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

-- | Creates a value of 'ReservationPurchaseRecommendationSummary' with the minimum fields required to make a request.
--
-- Use one of the following lenses to modify other fields as desired:
--
-- * 'rprsTotalEstimatedMonthlySavingsAmount' - The total amount that AWS estimates that this recommendation could save you in a month.
--
-- * 'rprsCurrencyCode' - The currency code used for this recommendation.
--
-- * 'rprsTotalEstimatedMonthlySavingsPercentage' - The total amount that AWS estimates that this recommendation could save you in a month, as a percentage of your costs.
reservationPurchaseRecommendationSummary ::
  ReservationPurchaseRecommendationSummary
reservationPurchaseRecommendationSummary =
  ReservationPurchaseRecommendationSummary'
    { _rprsTotalEstimatedMonthlySavingsAmount =
        Nothing,
      _rprsCurrencyCode = Nothing,
      _rprsTotalEstimatedMonthlySavingsPercentage =
        Nothing
    }

-- | The total amount that AWS estimates that this recommendation could save you in a month.
rprsTotalEstimatedMonthlySavingsAmount :: Lens' ReservationPurchaseRecommendationSummary (Maybe Text)
rprsTotalEstimatedMonthlySavingsAmount = lens _rprsTotalEstimatedMonthlySavingsAmount (\s a -> s {_rprsTotalEstimatedMonthlySavingsAmount = a})

-- | The currency code used for this recommendation.
rprsCurrencyCode :: Lens' ReservationPurchaseRecommendationSummary (Maybe Text)
rprsCurrencyCode = lens _rprsCurrencyCode (\s a -> s {_rprsCurrencyCode = a})

-- | The total amount that AWS estimates that this recommendation could save you in a month, as a percentage of your costs.
rprsTotalEstimatedMonthlySavingsPercentage :: Lens' ReservationPurchaseRecommendationSummary (Maybe Text)
rprsTotalEstimatedMonthlySavingsPercentage = lens _rprsTotalEstimatedMonthlySavingsPercentage (\s a -> s {_rprsTotalEstimatedMonthlySavingsPercentage = a})

instance
  FromJSON
    ReservationPurchaseRecommendationSummary
  where
  parseJSON =
    withObject
      "ReservationPurchaseRecommendationSummary"
      ( \x ->
          ReservationPurchaseRecommendationSummary'
            <$> (x .:? "TotalEstimatedMonthlySavingsAmount")
            <*> (x .:? "CurrencyCode")
            <*> (x .:? "TotalEstimatedMonthlySavingsPercentage")
      )

instance
  Hashable
    ReservationPurchaseRecommendationSummary

instance
  NFData
    ReservationPurchaseRecommendationSummary
