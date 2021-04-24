{-# LANGUAGE DeriveDataTypeable #-}
{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE RecordWildCards #-}
{-# OPTIONS_GHC -fno-warn-unused-imports #-}

-- Derived from AWS service descriptions, licensed under Apache 2.0.

-- |
-- Module      : Network.AWS.AWSHealth.Types.EventTypeFilter
-- Copyright   : (c) 2013-2021 Brendan Hay
-- License     : Mozilla Public License, v. 2.0.
-- Maintainer  : Brendan Hay <brendan.g.hay+amazonka@gmail.com>
-- Stability   : auto-generated
-- Portability : non-portable (GHC extensions)
module Network.AWS.AWSHealth.Types.EventTypeFilter where

import Network.AWS.AWSHealth.Types.EventTypeCategory
import Network.AWS.Lens
import Network.AWS.Prelude

-- | The values to use to filter results from the <https://docs.aws.amazon.com/health/latest/APIReference/API_DescribeEventTypes.html DescribeEventTypes> operation.
--
--
--
-- /See:/ 'eventTypeFilter' smart constructor.
data EventTypeFilter = EventTypeFilter'
  { _etfServices ::
      !(Maybe (List1 Text)),
    _etfEventTypeCodes ::
      !(Maybe (List1 Text)),
    _etfEventTypeCategories ::
      !(Maybe (List1 EventTypeCategory))
  }
  deriving (Eq, Read, Show, Data, Typeable, Generic)

-- | Creates a value of 'EventTypeFilter' with the minimum fields required to make a request.
--
-- Use one of the following lenses to modify other fields as desired:
--
-- * 'etfServices' - The AWS services associated with the event. For example, @EC2@ , @RDS@ .
--
-- * 'etfEventTypeCodes' - A list of event type codes.
--
-- * 'etfEventTypeCategories' - A list of event type category codes (@issue@ , @scheduledChange@ , or @accountNotification@ ).
eventTypeFilter ::
  EventTypeFilter
eventTypeFilter =
  EventTypeFilter'
    { _etfServices = Nothing,
      _etfEventTypeCodes = Nothing,
      _etfEventTypeCategories = Nothing
    }

-- | The AWS services associated with the event. For example, @EC2@ , @RDS@ .
etfServices :: Lens' EventTypeFilter (Maybe (NonEmpty Text))
etfServices = lens _etfServices (\s a -> s {_etfServices = a}) . mapping _List1

-- | A list of event type codes.
etfEventTypeCodes :: Lens' EventTypeFilter (Maybe (NonEmpty Text))
etfEventTypeCodes = lens _etfEventTypeCodes (\s a -> s {_etfEventTypeCodes = a}) . mapping _List1

-- | A list of event type category codes (@issue@ , @scheduledChange@ , or @accountNotification@ ).
etfEventTypeCategories :: Lens' EventTypeFilter (Maybe (NonEmpty EventTypeCategory))
etfEventTypeCategories = lens _etfEventTypeCategories (\s a -> s {_etfEventTypeCategories = a}) . mapping _List1

instance Hashable EventTypeFilter

instance NFData EventTypeFilter

instance ToJSON EventTypeFilter where
  toJSON EventTypeFilter' {..} =
    object
      ( catMaybes
          [ ("services" .=) <$> _etfServices,
            ("eventTypeCodes" .=) <$> _etfEventTypeCodes,
            ("eventTypeCategories" .=)
              <$> _etfEventTypeCategories
          ]
      )
