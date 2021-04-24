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
-- Module      : Network.AWS.DynamoDB.UpdateGlobalTable
-- Copyright   : (c) 2013-2021 Brendan Hay
-- License     : Mozilla Public License, v. 2.0.
-- Maintainer  : Brendan Hay <brendan.g.hay+amazonka@gmail.com>
-- Stability   : auto-generated
-- Portability : non-portable (GHC extensions)
--
-- Adds or removes replicas in the specified global table. The global table must already exist to be able to use this operation. Any replica to be added must be empty, have the same name as the global table, have the same key schema, have DynamoDB Streams enabled, and have the same provisioned and maximum write capacity units.
--
--
-- If global secondary indexes are specified, then the following conditions must also be met:
--
--     * The global secondary indexes must have the same name.
--
--     * The global secondary indexes must have the same hash key and sort key (if present).
--
--     * The global secondary indexes must have the same provisioned and maximum write capacity units.
module Network.AWS.DynamoDB.UpdateGlobalTable
  ( -- * Creating a Request
    updateGlobalTable,
    UpdateGlobalTable,

    -- * Request Lenses
    ugtGlobalTableName,
    ugtReplicaUpdates,

    -- * Destructuring the Response
    updateGlobalTableResponse,
    UpdateGlobalTableResponse,

    -- * Response Lenses
    ugtrrsGlobalTableDescription,
    ugtrrsResponseStatus,
  )
where

import Network.AWS.DynamoDB.Types
import Network.AWS.Lens
import Network.AWS.Prelude
import Network.AWS.Request
import Network.AWS.Response

-- | /See:/ 'updateGlobalTable' smart constructor.
data UpdateGlobalTable = UpdateGlobalTable'
  { _ugtGlobalTableName ::
      !Text,
    _ugtReplicaUpdates ::
      ![ReplicaUpdate]
  }
  deriving (Eq, Read, Show, Data, Typeable, Generic)

-- | Creates a value of 'UpdateGlobalTable' with the minimum fields required to make a request.
--
-- Use one of the following lenses to modify other fields as desired:
--
-- * 'ugtGlobalTableName' - The global table name.
--
-- * 'ugtReplicaUpdates' - A list of Regions that should be added or removed from the global table.
updateGlobalTable ::
  -- | 'ugtGlobalTableName'
  Text ->
  UpdateGlobalTable
updateGlobalTable pGlobalTableName_ =
  UpdateGlobalTable'
    { _ugtGlobalTableName =
        pGlobalTableName_,
      _ugtReplicaUpdates = mempty
    }

-- | The global table name.
ugtGlobalTableName :: Lens' UpdateGlobalTable Text
ugtGlobalTableName = lens _ugtGlobalTableName (\s a -> s {_ugtGlobalTableName = a})

-- | A list of Regions that should be added or removed from the global table.
ugtReplicaUpdates :: Lens' UpdateGlobalTable [ReplicaUpdate]
ugtReplicaUpdates = lens _ugtReplicaUpdates (\s a -> s {_ugtReplicaUpdates = a}) . _Coerce

instance AWSRequest UpdateGlobalTable where
  type Rs UpdateGlobalTable = UpdateGlobalTableResponse
  request = postJSON dynamoDB
  response =
    receiveJSON
      ( \s h x ->
          UpdateGlobalTableResponse'
            <$> (x .?> "GlobalTableDescription")
            <*> (pure (fromEnum s))
      )

instance Hashable UpdateGlobalTable

instance NFData UpdateGlobalTable

instance ToHeaders UpdateGlobalTable where
  toHeaders =
    const
      ( mconcat
          [ "X-Amz-Target"
              =# ( "DynamoDB_20120810.UpdateGlobalTable" ::
                     ByteString
                 ),
            "Content-Type"
              =# ("application/x-amz-json-1.0" :: ByteString)
          ]
      )

instance ToJSON UpdateGlobalTable where
  toJSON UpdateGlobalTable' {..} =
    object
      ( catMaybes
          [ Just ("GlobalTableName" .= _ugtGlobalTableName),
            Just ("ReplicaUpdates" .= _ugtReplicaUpdates)
          ]
      )

instance ToPath UpdateGlobalTable where
  toPath = const "/"

instance ToQuery UpdateGlobalTable where
  toQuery = const mempty

-- | /See:/ 'updateGlobalTableResponse' smart constructor.
data UpdateGlobalTableResponse = UpdateGlobalTableResponse'
  { _ugtrrsGlobalTableDescription ::
      !( Maybe
           GlobalTableDescription
       ),
    _ugtrrsResponseStatus ::
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

-- | Creates a value of 'UpdateGlobalTableResponse' with the minimum fields required to make a request.
--
-- Use one of the following lenses to modify other fields as desired:
--
-- * 'ugtrrsGlobalTableDescription' - Contains the details of the global table.
--
-- * 'ugtrrsResponseStatus' - -- | The response status code.
updateGlobalTableResponse ::
  -- | 'ugtrrsResponseStatus'
  Int ->
  UpdateGlobalTableResponse
updateGlobalTableResponse pResponseStatus_ =
  UpdateGlobalTableResponse'
    { _ugtrrsGlobalTableDescription =
        Nothing,
      _ugtrrsResponseStatus = pResponseStatus_
    }

-- | Contains the details of the global table.
ugtrrsGlobalTableDescription :: Lens' UpdateGlobalTableResponse (Maybe GlobalTableDescription)
ugtrrsGlobalTableDescription = lens _ugtrrsGlobalTableDescription (\s a -> s {_ugtrrsGlobalTableDescription = a})

-- | -- | The response status code.
ugtrrsResponseStatus :: Lens' UpdateGlobalTableResponse Int
ugtrrsResponseStatus = lens _ugtrrsResponseStatus (\s a -> s {_ugtrrsResponseStatus = a})

instance NFData UpdateGlobalTableResponse
