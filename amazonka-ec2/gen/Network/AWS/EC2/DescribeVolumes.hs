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
-- Module      : Network.AWS.EC2.DescribeVolumes
-- Copyright   : (c) 2013-2021 Brendan Hay
-- License     : Mozilla Public License, v. 2.0.
-- Maintainer  : Brendan Hay <brendan.g.hay+amazonka@gmail.com>
-- Stability   : auto-generated
-- Portability : non-portable (GHC extensions)
--
-- Describes the specified EBS volumes or all of your EBS volumes.
--
--
-- If you are describing a long list of volumes, we recommend that you paginate the output to make the list more manageable. The @MaxResults@ parameter sets the maximum number of results returned in a single page. If the list of results exceeds your @MaxResults@ value, then that number of results is returned along with a @NextToken@ value that can be passed to a subsequent @DescribeVolumes@ request to retrieve the remaining results.
--
-- For more information about EBS volumes, see <https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/EBSVolumes.html Amazon EBS volumes> in the /Amazon Elastic Compute Cloud User Guide/ .
--
--
-- This operation returns paginated results.
module Network.AWS.EC2.DescribeVolumes
  ( -- * Creating a Request
    describeVolumes,
    DescribeVolumes,

    -- * Request Lenses
    dvsNextToken,
    dvsDryRun,
    dvsVolumeIds,
    dvsMaxResults,
    dvsFilters,

    -- * Destructuring the Response
    describeVolumesResponse,
    DescribeVolumesResponse,

    -- * Response Lenses
    dvrvrsNextToken,
    dvrvrsVolumes,
    dvrvrsResponseStatus,
  )
where

import Network.AWS.EC2.Types
import Network.AWS.Lens
import Network.AWS.Pager
import Network.AWS.Prelude
import Network.AWS.Request
import Network.AWS.Response

-- | /See:/ 'describeVolumes' smart constructor.
data DescribeVolumes = DescribeVolumes'
  { _dvsNextToken ::
      !(Maybe Text),
    _dvsDryRun :: !(Maybe Bool),
    _dvsVolumeIds :: !(Maybe [Text]),
    _dvsMaxResults :: !(Maybe Int),
    _dvsFilters :: !(Maybe [Filter])
  }
  deriving (Eq, Read, Show, Data, Typeable, Generic)

-- | Creates a value of 'DescribeVolumes' with the minimum fields required to make a request.
--
-- Use one of the following lenses to modify other fields as desired:
--
-- * 'dvsNextToken' - The @NextToken@ value returned from a previous paginated @DescribeVolumes@ request where @MaxResults@ was used and the results exceeded the value of that parameter. Pagination continues from the end of the previous results that returned the @NextToken@ value. This value is @null@ when there are no more results to return.
--
-- * 'dvsDryRun' - Checks whether you have the required permissions for the action, without actually making the request, and provides an error response. If you have the required permissions, the error response is @DryRunOperation@ . Otherwise, it is @UnauthorizedOperation@ .
--
-- * 'dvsVolumeIds' - The volume IDs.
--
-- * 'dvsMaxResults' - The maximum number of volume results returned by @DescribeVolumes@ in paginated output. When this parameter is used, @DescribeVolumes@ only returns @MaxResults@ results in a single page along with a @NextToken@ response element. The remaining results of the initial request can be seen by sending another @DescribeVolumes@ request with the returned @NextToken@ value. This value can be between 5 and 500; if @MaxResults@ is given a value larger than 500, only 500 results are returned. If this parameter is not used, then @DescribeVolumes@ returns all results. You cannot specify this parameter and the volume IDs parameter in the same request.
--
-- * 'dvsFilters' - The filters.     * @attachment.attach-time@ - The time stamp when the attachment initiated.     * @attachment.delete-on-termination@ - Whether the volume is deleted on instance termination.     * @attachment.device@ - The device name specified in the block device mapping (for example, @/dev/sda1@ ).     * @attachment.instance-id@ - The ID of the instance the volume is attached to.     * @attachment.status@ - The attachment state (@attaching@ | @attached@ | @detaching@ ).     * @availability-zone@ - The Availability Zone in which the volume was created.     * @create-time@ - The time stamp when the volume was created.     * @encrypted@ - Indicates whether the volume is encrypted (@true@ | @false@ )     * @multi-attach-enabled@ - Indicates whether the volume is enabled for Multi-Attach (@true@ | @false@ )     * @fast-restored@ - Indicates whether the volume was created from a snapshot that is enabled for fast snapshot restore (@true@ | @false@ ).     * @size@ - The size of the volume, in GiB.     * @snapshot-id@ - The snapshot from which the volume was created.     * @status@ - The state of the volume (@creating@ | @available@ | @in-use@ | @deleting@ | @deleted@ | @error@ ).     * @tag@ :<key> - The key/value combination of a tag assigned to the resource. Use the tag key in the filter name and the tag value as the filter value. For example, to find all resources that have a tag with the key @Owner@ and the value @TeamA@ , specify @tag:Owner@ for the filter name and @TeamA@ for the filter value.     * @tag-key@ - The key of a tag assigned to the resource. Use this filter to find all resources assigned a tag with a specific key, regardless of the tag value.     * @volume-id@ - The volume ID.     * @volume-type@ - The Amazon EBS volume type (@gp2@ | @gp3@ | @io1@ | @io2@ | @st1@ | @sc1@ | @standard@ )
describeVolumes ::
  DescribeVolumes
describeVolumes =
  DescribeVolumes'
    { _dvsNextToken = Nothing,
      _dvsDryRun = Nothing,
      _dvsVolumeIds = Nothing,
      _dvsMaxResults = Nothing,
      _dvsFilters = Nothing
    }

-- | The @NextToken@ value returned from a previous paginated @DescribeVolumes@ request where @MaxResults@ was used and the results exceeded the value of that parameter. Pagination continues from the end of the previous results that returned the @NextToken@ value. This value is @null@ when there are no more results to return.
dvsNextToken :: Lens' DescribeVolumes (Maybe Text)
dvsNextToken = lens _dvsNextToken (\s a -> s {_dvsNextToken = a})

-- | Checks whether you have the required permissions for the action, without actually making the request, and provides an error response. If you have the required permissions, the error response is @DryRunOperation@ . Otherwise, it is @UnauthorizedOperation@ .
dvsDryRun :: Lens' DescribeVolumes (Maybe Bool)
dvsDryRun = lens _dvsDryRun (\s a -> s {_dvsDryRun = a})

-- | The volume IDs.
dvsVolumeIds :: Lens' DescribeVolumes [Text]
dvsVolumeIds = lens _dvsVolumeIds (\s a -> s {_dvsVolumeIds = a}) . _Default . _Coerce

-- | The maximum number of volume results returned by @DescribeVolumes@ in paginated output. When this parameter is used, @DescribeVolumes@ only returns @MaxResults@ results in a single page along with a @NextToken@ response element. The remaining results of the initial request can be seen by sending another @DescribeVolumes@ request with the returned @NextToken@ value. This value can be between 5 and 500; if @MaxResults@ is given a value larger than 500, only 500 results are returned. If this parameter is not used, then @DescribeVolumes@ returns all results. You cannot specify this parameter and the volume IDs parameter in the same request.
dvsMaxResults :: Lens' DescribeVolumes (Maybe Int)
dvsMaxResults = lens _dvsMaxResults (\s a -> s {_dvsMaxResults = a})

-- | The filters.     * @attachment.attach-time@ - The time stamp when the attachment initiated.     * @attachment.delete-on-termination@ - Whether the volume is deleted on instance termination.     * @attachment.device@ - The device name specified in the block device mapping (for example, @/dev/sda1@ ).     * @attachment.instance-id@ - The ID of the instance the volume is attached to.     * @attachment.status@ - The attachment state (@attaching@ | @attached@ | @detaching@ ).     * @availability-zone@ - The Availability Zone in which the volume was created.     * @create-time@ - The time stamp when the volume was created.     * @encrypted@ - Indicates whether the volume is encrypted (@true@ | @false@ )     * @multi-attach-enabled@ - Indicates whether the volume is enabled for Multi-Attach (@true@ | @false@ )     * @fast-restored@ - Indicates whether the volume was created from a snapshot that is enabled for fast snapshot restore (@true@ | @false@ ).     * @size@ - The size of the volume, in GiB.     * @snapshot-id@ - The snapshot from which the volume was created.     * @status@ - The state of the volume (@creating@ | @available@ | @in-use@ | @deleting@ | @deleted@ | @error@ ).     * @tag@ :<key> - The key/value combination of a tag assigned to the resource. Use the tag key in the filter name and the tag value as the filter value. For example, to find all resources that have a tag with the key @Owner@ and the value @TeamA@ , specify @tag:Owner@ for the filter name and @TeamA@ for the filter value.     * @tag-key@ - The key of a tag assigned to the resource. Use this filter to find all resources assigned a tag with a specific key, regardless of the tag value.     * @volume-id@ - The volume ID.     * @volume-type@ - The Amazon EBS volume type (@gp2@ | @gp3@ | @io1@ | @io2@ | @st1@ | @sc1@ | @standard@ )
dvsFilters :: Lens' DescribeVolumes [Filter]
dvsFilters = lens _dvsFilters (\s a -> s {_dvsFilters = a}) . _Default . _Coerce

instance AWSPager DescribeVolumes where
  page rq rs
    | stop (rs ^. dvrvrsNextToken) = Nothing
    | stop (rs ^. dvrvrsVolumes) = Nothing
    | otherwise =
      Just $ rq & dvsNextToken .~ rs ^. dvrvrsNextToken

instance AWSRequest DescribeVolumes where
  type Rs DescribeVolumes = DescribeVolumesResponse
  request = postQuery ec2
  response =
    receiveXML
      ( \s h x ->
          DescribeVolumesResponse'
            <$> (x .@? "nextToken")
            <*> ( x .@? "volumeSet" .!@ mempty
                    >>= may (parseXMLList "item")
                )
            <*> (pure (fromEnum s))
      )

instance Hashable DescribeVolumes

instance NFData DescribeVolumes

instance ToHeaders DescribeVolumes where
  toHeaders = const mempty

instance ToPath DescribeVolumes where
  toPath = const "/"

instance ToQuery DescribeVolumes where
  toQuery DescribeVolumes' {..} =
    mconcat
      [ "Action" =: ("DescribeVolumes" :: ByteString),
        "Version" =: ("2016-11-15" :: ByteString),
        "NextToken" =: _dvsNextToken,
        "DryRun" =: _dvsDryRun,
        toQuery (toQueryList "VolumeId" <$> _dvsVolumeIds),
        "MaxResults" =: _dvsMaxResults,
        toQuery (toQueryList "Filter" <$> _dvsFilters)
      ]

-- | /See:/ 'describeVolumesResponse' smart constructor.
data DescribeVolumesResponse = DescribeVolumesResponse'
  { _dvrvrsNextToken ::
      !(Maybe Text),
    _dvrvrsVolumes ::
      !(Maybe [Volume]),
    _dvrvrsResponseStatus ::
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

-- | Creates a value of 'DescribeVolumesResponse' with the minimum fields required to make a request.
--
-- Use one of the following lenses to modify other fields as desired:
--
-- * 'dvrvrsNextToken' - The @NextToken@ value to include in a future @DescribeVolumes@ request. When the results of a @DescribeVolumes@ request exceed @MaxResults@ , this value can be used to retrieve the next page of results. This value is @null@ when there are no more results to return.
--
-- * 'dvrvrsVolumes' - Information about the volumes.
--
-- * 'dvrvrsResponseStatus' - -- | The response status code.
describeVolumesResponse ::
  -- | 'dvrvrsResponseStatus'
  Int ->
  DescribeVolumesResponse
describeVolumesResponse pResponseStatus_ =
  DescribeVolumesResponse'
    { _dvrvrsNextToken =
        Nothing,
      _dvrvrsVolumes = Nothing,
      _dvrvrsResponseStatus = pResponseStatus_
    }

-- | The @NextToken@ value to include in a future @DescribeVolumes@ request. When the results of a @DescribeVolumes@ request exceed @MaxResults@ , this value can be used to retrieve the next page of results. This value is @null@ when there are no more results to return.
dvrvrsNextToken :: Lens' DescribeVolumesResponse (Maybe Text)
dvrvrsNextToken = lens _dvrvrsNextToken (\s a -> s {_dvrvrsNextToken = a})

-- | Information about the volumes.
dvrvrsVolumes :: Lens' DescribeVolumesResponse [Volume]
dvrvrsVolumes = lens _dvrvrsVolumes (\s a -> s {_dvrvrsVolumes = a}) . _Default . _Coerce

-- | -- | The response status code.
dvrvrsResponseStatus :: Lens' DescribeVolumesResponse Int
dvrvrsResponseStatus = lens _dvrvrsResponseStatus (\s a -> s {_dvrvrsResponseStatus = a})

instance NFData DescribeVolumesResponse
