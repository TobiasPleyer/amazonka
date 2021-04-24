{-# LANGUAGE DeriveDataTypeable #-}
{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE RecordWildCards #-}
{-# OPTIONS_GHC -fno-warn-unused-imports #-}

-- Derived from AWS service descriptions, licensed under Apache 2.0.

-- |
-- Module      : Network.AWS.EC2.Types.ReservationValue
-- Copyright   : (c) 2013-2021 Brendan Hay
-- License     : Mozilla Public License, v. 2.0.
-- Maintainer  : Brendan Hay <brendan.g.hay+amazonka@gmail.com>
-- Stability   : auto-generated
-- Portability : non-portable (GHC extensions)
module Network.AWS.EC2.Types.ReservationValue where

import Network.AWS.EC2.Internal
import Network.AWS.Lens
import Network.AWS.Prelude

-- | The cost associated with the Reserved Instance.
--
--
--
-- /See:/ 'reservationValue' smart constructor.
data ReservationValue = ReservationValue'
  { _rvRemainingUpfrontValue ::
      !(Maybe Text),
    _rvHourlyPrice :: !(Maybe Text),
    _rvRemainingTotalValue ::
      !(Maybe Text)
  }
  deriving (Eq, Read, Show, Data, Typeable, Generic)

-- | Creates a value of 'ReservationValue' with the minimum fields required to make a request.
--
-- Use one of the following lenses to modify other fields as desired:
--
-- * 'rvRemainingUpfrontValue' - The remaining upfront cost of the reservation.
--
-- * 'rvHourlyPrice' - The hourly rate of the reservation.
--
-- * 'rvRemainingTotalValue' - The balance of the total value (the sum of remainingUpfrontValue + hourlyPrice * number of hours remaining).
reservationValue ::
  ReservationValue
reservationValue =
  ReservationValue'
    { _rvRemainingUpfrontValue =
        Nothing,
      _rvHourlyPrice = Nothing,
      _rvRemainingTotalValue = Nothing
    }

-- | The remaining upfront cost of the reservation.
rvRemainingUpfrontValue :: Lens' ReservationValue (Maybe Text)
rvRemainingUpfrontValue = lens _rvRemainingUpfrontValue (\s a -> s {_rvRemainingUpfrontValue = a})

-- | The hourly rate of the reservation.
rvHourlyPrice :: Lens' ReservationValue (Maybe Text)
rvHourlyPrice = lens _rvHourlyPrice (\s a -> s {_rvHourlyPrice = a})

-- | The balance of the total value (the sum of remainingUpfrontValue + hourlyPrice * number of hours remaining).
rvRemainingTotalValue :: Lens' ReservationValue (Maybe Text)
rvRemainingTotalValue = lens _rvRemainingTotalValue (\s a -> s {_rvRemainingTotalValue = a})

instance FromXML ReservationValue where
  parseXML x =
    ReservationValue'
      <$> (x .@? "remainingUpfrontValue")
      <*> (x .@? "hourlyPrice")
      <*> (x .@? "remainingTotalValue")

instance Hashable ReservationValue

instance NFData ReservationValue
