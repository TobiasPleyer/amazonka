{-# LANGUAGE DeriveDataTypeable #-}
{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE RecordWildCards #-}
{-# OPTIONS_GHC -fno-warn-unused-imports #-}

-- Derived from AWS service descriptions, licensed under Apache 2.0.

-- |
-- Module      : Network.AWS.CostExplorer.Types.SavingsPlansSavings
-- Copyright   : (c) 2013-2021 Brendan Hay
-- License     : Mozilla Public License, v. 2.0.
-- Maintainer  : Brendan Hay <brendan.g.hay+amazonka@gmail.com>
-- Stability   : auto-generated
-- Portability : non-portable (GHC extensions)
module Network.AWS.CostExplorer.Types.SavingsPlansSavings where

import Network.AWS.Lens
import Network.AWS.Prelude

-- | The amount of savings you're accumulating, against the public On-Demand rate of the usage accrued in an account.
--
--
--
-- /See:/ 'savingsPlansSavings' smart constructor.
data SavingsPlansSavings = SavingsPlansSavings'
  { _spsOnDemandCostEquivalent ::
      !(Maybe Text),
    _spsNetSavings :: !(Maybe Text)
  }
  deriving (Eq, Read, Show, Data, Typeable, Generic)

-- | Creates a value of 'SavingsPlansSavings' with the minimum fields required to make a request.
--
-- Use one of the following lenses to modify other fields as desired:
--
-- * 'spsOnDemandCostEquivalent' - How much the amount that the usage would have cost if it was accrued at the On-Demand rate.
--
-- * 'spsNetSavings' - The savings amount that you are accumulating for the usage that is covered by a Savings Plans, when compared to the On-Demand equivalent of the same usage.
savingsPlansSavings ::
  SavingsPlansSavings
savingsPlansSavings =
  SavingsPlansSavings'
    { _spsOnDemandCostEquivalent =
        Nothing,
      _spsNetSavings = Nothing
    }

-- | How much the amount that the usage would have cost if it was accrued at the On-Demand rate.
spsOnDemandCostEquivalent :: Lens' SavingsPlansSavings (Maybe Text)
spsOnDemandCostEquivalent = lens _spsOnDemandCostEquivalent (\s a -> s {_spsOnDemandCostEquivalent = a})

-- | The savings amount that you are accumulating for the usage that is covered by a Savings Plans, when compared to the On-Demand equivalent of the same usage.
spsNetSavings :: Lens' SavingsPlansSavings (Maybe Text)
spsNetSavings = lens _spsNetSavings (\s a -> s {_spsNetSavings = a})

instance FromJSON SavingsPlansSavings where
  parseJSON =
    withObject
      "SavingsPlansSavings"
      ( \x ->
          SavingsPlansSavings'
            <$> (x .:? "OnDemandCostEquivalent")
            <*> (x .:? "NetSavings")
      )

instance Hashable SavingsPlansSavings

instance NFData SavingsPlansSavings
