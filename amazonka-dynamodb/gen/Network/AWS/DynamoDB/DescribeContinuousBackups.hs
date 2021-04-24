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
-- Module      : Network.AWS.DynamoDB.DescribeContinuousBackups
-- Copyright   : (c) 2013-2021 Brendan Hay
-- License     : Mozilla Public License, v. 2.0.
-- Maintainer  : Brendan Hay <brendan.g.hay+amazonka@gmail.com>
-- Stability   : auto-generated
-- Portability : non-portable (GHC extensions)
--
-- Checks the status of continuous backups and point in time recovery on the specified table. Continuous backups are @ENABLED@ on all tables at table creation. If point in time recovery is enabled, @PointInTimeRecoveryStatus@ will be set to ENABLED.
--
--
-- After continuous backups and point in time recovery are enabled, you can restore to any point in time within @EarliestRestorableDateTime@ and @LatestRestorableDateTime@ .
--
-- @LatestRestorableDateTime@ is typically 5 minutes before the current time. You can restore your table to any point in time during the last 35 days.
--
-- You can call @DescribeContinuousBackups@ at a maximum rate of 10 times per second.
module Network.AWS.DynamoDB.DescribeContinuousBackups
  ( -- * Creating a Request
    describeContinuousBackups,
    DescribeContinuousBackups,

    -- * Request Lenses
    dcbTableName,

    -- * Destructuring the Response
    describeContinuousBackupsResponse,
    DescribeContinuousBackupsResponse,

    -- * Response Lenses
    dcbrrsContinuousBackupsDescription,
    dcbrrsResponseStatus,
  )
where

import Network.AWS.DynamoDB.Types
import Network.AWS.Lens
import Network.AWS.Prelude
import Network.AWS.Request
import Network.AWS.Response

-- | /See:/ 'describeContinuousBackups' smart constructor.
newtype DescribeContinuousBackups = DescribeContinuousBackups'
  { _dcbTableName ::
      Text
  }
  deriving
    ( Eq,
      Read,
      Show,
      Data,
      Typeable,
      Generic
    )

-- | Creates a value of 'DescribeContinuousBackups' with the minimum fields required to make a request.
--
-- Use one of the following lenses to modify other fields as desired:
--
-- * 'dcbTableName' - Name of the table for which the customer wants to check the continuous backups and point in time recovery settings.
describeContinuousBackups ::
  -- | 'dcbTableName'
  Text ->
  DescribeContinuousBackups
describeContinuousBackups pTableName_ =
  DescribeContinuousBackups'
    { _dcbTableName =
        pTableName_
    }

-- | Name of the table for which the customer wants to check the continuous backups and point in time recovery settings.
dcbTableName :: Lens' DescribeContinuousBackups Text
dcbTableName = lens _dcbTableName (\s a -> s {_dcbTableName = a})

instance AWSRequest DescribeContinuousBackups where
  type
    Rs DescribeContinuousBackups =
      DescribeContinuousBackupsResponse
  request = postJSON dynamoDB
  response =
    receiveJSON
      ( \s h x ->
          DescribeContinuousBackupsResponse'
            <$> (x .?> "ContinuousBackupsDescription")
            <*> (pure (fromEnum s))
      )

instance Hashable DescribeContinuousBackups

instance NFData DescribeContinuousBackups

instance ToHeaders DescribeContinuousBackups where
  toHeaders =
    const
      ( mconcat
          [ "X-Amz-Target"
              =# ( "DynamoDB_20120810.DescribeContinuousBackups" ::
                     ByteString
                 ),
            "Content-Type"
              =# ("application/x-amz-json-1.0" :: ByteString)
          ]
      )

instance ToJSON DescribeContinuousBackups where
  toJSON DescribeContinuousBackups' {..} =
    object
      (catMaybes [Just ("TableName" .= _dcbTableName)])

instance ToPath DescribeContinuousBackups where
  toPath = const "/"

instance ToQuery DescribeContinuousBackups where
  toQuery = const mempty

-- | /See:/ 'describeContinuousBackupsResponse' smart constructor.
data DescribeContinuousBackupsResponse = DescribeContinuousBackupsResponse'
  { _dcbrrsContinuousBackupsDescription ::
      !( Maybe
           ContinuousBackupsDescription
       ),
    _dcbrrsResponseStatus ::
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

-- | Creates a value of 'DescribeContinuousBackupsResponse' with the minimum fields required to make a request.
--
-- Use one of the following lenses to modify other fields as desired:
--
-- * 'dcbrrsContinuousBackupsDescription' - Represents the continuous backups and point in time recovery settings on the table.
--
-- * 'dcbrrsResponseStatus' - -- | The response status code.
describeContinuousBackupsResponse ::
  -- | 'dcbrrsResponseStatus'
  Int ->
  DescribeContinuousBackupsResponse
describeContinuousBackupsResponse pResponseStatus_ =
  DescribeContinuousBackupsResponse'
    { _dcbrrsContinuousBackupsDescription =
        Nothing,
      _dcbrrsResponseStatus = pResponseStatus_
    }

-- | Represents the continuous backups and point in time recovery settings on the table.
dcbrrsContinuousBackupsDescription :: Lens' DescribeContinuousBackupsResponse (Maybe ContinuousBackupsDescription)
dcbrrsContinuousBackupsDescription = lens _dcbrrsContinuousBackupsDescription (\s a -> s {_dcbrrsContinuousBackupsDescription = a})

-- | -- | The response status code.
dcbrrsResponseStatus :: Lens' DescribeContinuousBackupsResponse Int
dcbrrsResponseStatus = lens _dcbrrsResponseStatus (\s a -> s {_dcbrrsResponseStatus = a})

instance NFData DescribeContinuousBackupsResponse
