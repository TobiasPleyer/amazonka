{-# LANGUAGE DeriveDataTypeable #-}
{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE RecordWildCards #-}
{-# OPTIONS_GHC -fno-warn-unused-imports #-}

-- Derived from AWS service descriptions, licensed under Apache 2.0.

-- |
-- Module      : Network.AWS.DirectoryService.Types.LogSubscription
-- Copyright   : (c) 2013-2021 Brendan Hay
-- License     : Mozilla Public License, v. 2.0.
-- Maintainer  : Brendan Hay <brendan.g.hay+amazonka@gmail.com>
-- Stability   : auto-generated
-- Portability : non-portable (GHC extensions)
module Network.AWS.DirectoryService.Types.LogSubscription where

import Network.AWS.Lens
import Network.AWS.Prelude

-- | Represents a log subscription, which tracks real-time data from a chosen log group to a specified destination.
--
--
--
-- /See:/ 'logSubscription' smart constructor.
data LogSubscription = LogSubscription'
  { _lsSubscriptionCreatedDateTime ::
      !(Maybe POSIX),
    _lsLogGroupName :: !(Maybe Text),
    _lsDirectoryId :: !(Maybe Text)
  }
  deriving (Eq, Read, Show, Data, Typeable, Generic)

-- | Creates a value of 'LogSubscription' with the minimum fields required to make a request.
--
-- Use one of the following lenses to modify other fields as desired:
--
-- * 'lsSubscriptionCreatedDateTime' - The date and time that the log subscription was created.
--
-- * 'lsLogGroupName' - The name of the log group.
--
-- * 'lsDirectoryId' - Identifier (ID) of the directory that you want to associate with the log subscription.
logSubscription ::
  LogSubscription
logSubscription =
  LogSubscription'
    { _lsSubscriptionCreatedDateTime =
        Nothing,
      _lsLogGroupName = Nothing,
      _lsDirectoryId = Nothing
    }

-- | The date and time that the log subscription was created.
lsSubscriptionCreatedDateTime :: Lens' LogSubscription (Maybe UTCTime)
lsSubscriptionCreatedDateTime = lens _lsSubscriptionCreatedDateTime (\s a -> s {_lsSubscriptionCreatedDateTime = a}) . mapping _Time

-- | The name of the log group.
lsLogGroupName :: Lens' LogSubscription (Maybe Text)
lsLogGroupName = lens _lsLogGroupName (\s a -> s {_lsLogGroupName = a})

-- | Identifier (ID) of the directory that you want to associate with the log subscription.
lsDirectoryId :: Lens' LogSubscription (Maybe Text)
lsDirectoryId = lens _lsDirectoryId (\s a -> s {_lsDirectoryId = a})

instance FromJSON LogSubscription where
  parseJSON =
    withObject
      "LogSubscription"
      ( \x ->
          LogSubscription'
            <$> (x .:? "SubscriptionCreatedDateTime")
            <*> (x .:? "LogGroupName")
            <*> (x .:? "DirectoryId")
      )

instance Hashable LogSubscription

instance NFData LogSubscription
