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
-- Module      : Network.AWS.DynamoDB.ExportTableToPointInTime
-- Copyright   : (c) 2013-2021 Brendan Hay
-- License     : Mozilla Public License, v. 2.0.
-- Maintainer  : Brendan Hay <brendan.g.hay+amazonka@gmail.com>
-- Stability   : auto-generated
-- Portability : non-portable (GHC extensions)
--
-- Exports table data to an S3 bucket. The table must have point in time recovery enabled, and you can export data from any time within the point in time recovery window.
module Network.AWS.DynamoDB.ExportTableToPointInTime
  ( -- * Creating a Request
    exportTableToPointInTime,
    ExportTableToPointInTime,

    -- * Request Lenses
    ettpitExportFormat,
    ettpitExportTime,
    ettpitS3BucketOwner,
    ettpitS3Prefix,
    ettpitS3SseKMSKeyId,
    ettpitClientToken,
    ettpitS3SseAlgorithm,
    ettpitTableARN,
    ettpitS3Bucket,

    -- * Destructuring the Response
    exportTableToPointInTimeResponse,
    ExportTableToPointInTimeResponse,

    -- * Response Lenses
    ettpitrrsExportDescription,
    ettpitrrsResponseStatus,
  )
where

import Network.AWS.DynamoDB.Types
import Network.AWS.Lens
import Network.AWS.Prelude
import Network.AWS.Request
import Network.AWS.Response

-- | /See:/ 'exportTableToPointInTime' smart constructor.
data ExportTableToPointInTime = ExportTableToPointInTime'
  { _ettpitExportFormat ::
      !(Maybe ExportFormat),
    _ettpitExportTime ::
      !(Maybe POSIX),
    _ettpitS3BucketOwner ::
      !(Maybe Text),
    _ettpitS3Prefix ::
      !(Maybe Text),
    _ettpitS3SseKMSKeyId ::
      !(Maybe Text),
    _ettpitClientToken ::
      !(Maybe Text),
    _ettpitS3SseAlgorithm ::
      !( Maybe
           S3SseAlgorithm
       ),
    _ettpitTableARN ::
      !Text,
    _ettpitS3Bucket ::
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

-- | Creates a value of 'ExportTableToPointInTime' with the minimum fields required to make a request.
--
-- Use one of the following lenses to modify other fields as desired:
--
-- * 'ettpitExportFormat' - The format for the exported data. Valid values for @ExportFormat@ are @DYNAMODB_JSON@ or @ION@ .
--
-- * 'ettpitExportTime' - Time in the past from which to export table data. The table export will be a snapshot of the table's state at this point in time.
--
-- * 'ettpitS3BucketOwner' - The ID of the AWS account that owns the bucket the export will be stored in.
--
-- * 'ettpitS3Prefix' - The Amazon S3 bucket prefix to use as the file name and path of the exported snapshot.
--
-- * 'ettpitS3SseKMSKeyId' - The ID of the AWS KMS managed key used to encrypt the S3 bucket where export data will be stored (if applicable).
--
-- * 'ettpitClientToken' - Providing a @ClientToken@ makes the call to @ExportTableToPointInTimeInput@ idempotent, meaning that multiple identical calls have the same effect as one single call. A client token is valid for 8 hours after the first request that uses it is completed. After 8 hours, any request with the same client token is treated as a new request. Do not resubmit the same request with the same client token for more than 8 hours, or the result might not be idempotent. If you submit a request with the same client token but a change in other parameters within the 8-hour idempotency window, DynamoDB returns an @IdempotentParameterMismatch@ exception.
--
-- * 'ettpitS3SseAlgorithm' - Type of encryption used on the bucket where export data will be stored. Valid values for @S3SseAlgorithm@ are:     * @AES256@ - server-side encryption with Amazon S3 managed keys     * @KMS@ - server-side encryption with AWS KMS managed keys
--
-- * 'ettpitTableARN' - The Amazon Resource Name (ARN) associated with the table to export.
--
-- * 'ettpitS3Bucket' - The name of the Amazon S3 bucket to export the snapshot to.
exportTableToPointInTime ::
  -- | 'ettpitTableARN'
  Text ->
  -- | 'ettpitS3Bucket'
  Text ->
  ExportTableToPointInTime
exportTableToPointInTime pTableARN_ pS3Bucket_ =
  ExportTableToPointInTime'
    { _ettpitExportFormat =
        Nothing,
      _ettpitExportTime = Nothing,
      _ettpitS3BucketOwner = Nothing,
      _ettpitS3Prefix = Nothing,
      _ettpitS3SseKMSKeyId = Nothing,
      _ettpitClientToken = Nothing,
      _ettpitS3SseAlgorithm = Nothing,
      _ettpitTableARN = pTableARN_,
      _ettpitS3Bucket = pS3Bucket_
    }

-- | The format for the exported data. Valid values for @ExportFormat@ are @DYNAMODB_JSON@ or @ION@ .
ettpitExportFormat :: Lens' ExportTableToPointInTime (Maybe ExportFormat)
ettpitExportFormat = lens _ettpitExportFormat (\s a -> s {_ettpitExportFormat = a})

-- | Time in the past from which to export table data. The table export will be a snapshot of the table's state at this point in time.
ettpitExportTime :: Lens' ExportTableToPointInTime (Maybe UTCTime)
ettpitExportTime = lens _ettpitExportTime (\s a -> s {_ettpitExportTime = a}) . mapping _Time

-- | The ID of the AWS account that owns the bucket the export will be stored in.
ettpitS3BucketOwner :: Lens' ExportTableToPointInTime (Maybe Text)
ettpitS3BucketOwner = lens _ettpitS3BucketOwner (\s a -> s {_ettpitS3BucketOwner = a})

-- | The Amazon S3 bucket prefix to use as the file name and path of the exported snapshot.
ettpitS3Prefix :: Lens' ExportTableToPointInTime (Maybe Text)
ettpitS3Prefix = lens _ettpitS3Prefix (\s a -> s {_ettpitS3Prefix = a})

-- | The ID of the AWS KMS managed key used to encrypt the S3 bucket where export data will be stored (if applicable).
ettpitS3SseKMSKeyId :: Lens' ExportTableToPointInTime (Maybe Text)
ettpitS3SseKMSKeyId = lens _ettpitS3SseKMSKeyId (\s a -> s {_ettpitS3SseKMSKeyId = a})

-- | Providing a @ClientToken@ makes the call to @ExportTableToPointInTimeInput@ idempotent, meaning that multiple identical calls have the same effect as one single call. A client token is valid for 8 hours after the first request that uses it is completed. After 8 hours, any request with the same client token is treated as a new request. Do not resubmit the same request with the same client token for more than 8 hours, or the result might not be idempotent. If you submit a request with the same client token but a change in other parameters within the 8-hour idempotency window, DynamoDB returns an @IdempotentParameterMismatch@ exception.
ettpitClientToken :: Lens' ExportTableToPointInTime (Maybe Text)
ettpitClientToken = lens _ettpitClientToken (\s a -> s {_ettpitClientToken = a})

-- | Type of encryption used on the bucket where export data will be stored. Valid values for @S3SseAlgorithm@ are:     * @AES256@ - server-side encryption with Amazon S3 managed keys     * @KMS@ - server-side encryption with AWS KMS managed keys
ettpitS3SseAlgorithm :: Lens' ExportTableToPointInTime (Maybe S3SseAlgorithm)
ettpitS3SseAlgorithm = lens _ettpitS3SseAlgorithm (\s a -> s {_ettpitS3SseAlgorithm = a})

-- | The Amazon Resource Name (ARN) associated with the table to export.
ettpitTableARN :: Lens' ExportTableToPointInTime Text
ettpitTableARN = lens _ettpitTableARN (\s a -> s {_ettpitTableARN = a})

-- | The name of the Amazon S3 bucket to export the snapshot to.
ettpitS3Bucket :: Lens' ExportTableToPointInTime Text
ettpitS3Bucket = lens _ettpitS3Bucket (\s a -> s {_ettpitS3Bucket = a})

instance AWSRequest ExportTableToPointInTime where
  type
    Rs ExportTableToPointInTime =
      ExportTableToPointInTimeResponse
  request = postJSON dynamoDB
  response =
    receiveJSON
      ( \s h x ->
          ExportTableToPointInTimeResponse'
            <$> (x .?> "ExportDescription") <*> (pure (fromEnum s))
      )

instance Hashable ExportTableToPointInTime

instance NFData ExportTableToPointInTime

instance ToHeaders ExportTableToPointInTime where
  toHeaders =
    const
      ( mconcat
          [ "X-Amz-Target"
              =# ( "DynamoDB_20120810.ExportTableToPointInTime" ::
                     ByteString
                 ),
            "Content-Type"
              =# ("application/x-amz-json-1.0" :: ByteString)
          ]
      )

instance ToJSON ExportTableToPointInTime where
  toJSON ExportTableToPointInTime' {..} =
    object
      ( catMaybes
          [ ("ExportFormat" .=) <$> _ettpitExportFormat,
            ("ExportTime" .=) <$> _ettpitExportTime,
            ("S3BucketOwner" .=) <$> _ettpitS3BucketOwner,
            ("S3Prefix" .=) <$> _ettpitS3Prefix,
            ("S3SseKmsKeyId" .=) <$> _ettpitS3SseKMSKeyId,
            ("ClientToken" .=) <$> _ettpitClientToken,
            ("S3SseAlgorithm" .=) <$> _ettpitS3SseAlgorithm,
            Just ("TableArn" .= _ettpitTableARN),
            Just ("S3Bucket" .= _ettpitS3Bucket)
          ]
      )

instance ToPath ExportTableToPointInTime where
  toPath = const "/"

instance ToQuery ExportTableToPointInTime where
  toQuery = const mempty

-- | /See:/ 'exportTableToPointInTimeResponse' smart constructor.
data ExportTableToPointInTimeResponse = ExportTableToPointInTimeResponse'
  { _ettpitrrsExportDescription ::
      !( Maybe
           ExportDescription
       ),
    _ettpitrrsResponseStatus ::
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

-- | Creates a value of 'ExportTableToPointInTimeResponse' with the minimum fields required to make a request.
--
-- Use one of the following lenses to modify other fields as desired:
--
-- * 'ettpitrrsExportDescription' - Contains a description of the table export.
--
-- * 'ettpitrrsResponseStatus' - -- | The response status code.
exportTableToPointInTimeResponse ::
  -- | 'ettpitrrsResponseStatus'
  Int ->
  ExportTableToPointInTimeResponse
exportTableToPointInTimeResponse pResponseStatus_ =
  ExportTableToPointInTimeResponse'
    { _ettpitrrsExportDescription =
        Nothing,
      _ettpitrrsResponseStatus =
        pResponseStatus_
    }

-- | Contains a description of the table export.
ettpitrrsExportDescription :: Lens' ExportTableToPointInTimeResponse (Maybe ExportDescription)
ettpitrrsExportDescription = lens _ettpitrrsExportDescription (\s a -> s {_ettpitrrsExportDescription = a})

-- | -- | The response status code.
ettpitrrsResponseStatus :: Lens' ExportTableToPointInTimeResponse Int
ettpitrrsResponseStatus = lens _ettpitrrsResponseStatus (\s a -> s {_ettpitrrsResponseStatus = a})

instance NFData ExportTableToPointInTimeResponse
