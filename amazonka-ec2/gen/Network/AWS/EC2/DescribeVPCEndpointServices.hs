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
-- Module      : Network.AWS.EC2.DescribeVPCEndpointServices
-- Copyright   : (c) 2013-2021 Brendan Hay
-- License     : Mozilla Public License, v. 2.0.
-- Maintainer  : Brendan Hay <brendan.g.hay+amazonka@gmail.com>
-- Stability   : auto-generated
-- Portability : non-portable (GHC extensions)
--
-- Describes available services to which you can create a VPC endpoint.
--
--
-- When the service provider and the consumer have different accounts in multiple Availability Zones, and the consumer views the VPC endpoint service information, the response only includes the common Availability Zones. For example, when the service provider account uses @us-east-1a@ and @us-east-1c@ and the consumer uses @us-east-1a@ and @us-east-1b@ , the response includes the VPC endpoint services in the common Availability Zone, @us-east-1a@ .
--
--
-- This operation returns paginated results.
module Network.AWS.EC2.DescribeVPCEndpointServices
  ( -- * Creating a Request
    describeVPCEndpointServices,
    DescribeVPCEndpointServices,

    -- * Request Lenses
    dvesNextToken,
    dvesServiceNames,
    dvesDryRun,
    dvesMaxResults,
    dvesFilters,

    -- * Destructuring the Response
    describeVPCEndpointServicesResponse,
    DescribeVPCEndpointServicesResponse,

    -- * Response Lenses
    dvesrrsServiceDetails,
    dvesrrsNextToken,
    dvesrrsServiceNames,
    dvesrrsResponseStatus,
  )
where

import Network.AWS.EC2.Types
import Network.AWS.Lens
import Network.AWS.Pager
import Network.AWS.Prelude
import Network.AWS.Request
import Network.AWS.Response

-- | Contains the parameters for DescribeVpcEndpointServices.
--
--
--
-- /See:/ 'describeVPCEndpointServices' smart constructor.
data DescribeVPCEndpointServices = DescribeVPCEndpointServices'
  { _dvesNextToken ::
      !(Maybe Text),
    _dvesServiceNames ::
      !(Maybe [Text]),
    _dvesDryRun ::
      !(Maybe Bool),
    _dvesMaxResults ::
      !(Maybe Int),
    _dvesFilters ::
      !( Maybe
           [Filter]
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

-- | Creates a value of 'DescribeVPCEndpointServices' with the minimum fields required to make a request.
--
-- Use one of the following lenses to modify other fields as desired:
--
-- * 'dvesNextToken' - The token for the next set of items to return. (You received this token from a prior call.)
--
-- * 'dvesServiceNames' - One or more service names.
--
-- * 'dvesDryRun' - Checks whether you have the required permissions for the action, without actually making the request, and provides an error response. If you have the required permissions, the error response is @DryRunOperation@ . Otherwise, it is @UnauthorizedOperation@ .
--
-- * 'dvesMaxResults' - The maximum number of items to return for this request. The request returns a token that you can specify in a subsequent call to get the next set of results. Constraint: If the value is greater than 1,000, we return only 1,000 items.
--
-- * 'dvesFilters' - One or more filters.     * @service-name@ - The name of the service.     * @service-type@ - The type of service (@Interface@ | @Gateway@ ).     * @tag@ :<key> - The key/value combination of a tag assigned to the resource. Use the tag key in the filter name and the tag value as the filter value. For example, to find all resources that have a tag with the key @Owner@ and the value @TeamA@ , specify @tag:Owner@ for the filter name and @TeamA@ for the filter value.     * @tag-key@ - The key of a tag assigned to the resource. Use this filter to find all resources assigned a tag with a specific key, regardless of the tag value.
describeVPCEndpointServices ::
  DescribeVPCEndpointServices
describeVPCEndpointServices =
  DescribeVPCEndpointServices'
    { _dvesNextToken =
        Nothing,
      _dvesServiceNames = Nothing,
      _dvesDryRun = Nothing,
      _dvesMaxResults = Nothing,
      _dvesFilters = Nothing
    }

-- | The token for the next set of items to return. (You received this token from a prior call.)
dvesNextToken :: Lens' DescribeVPCEndpointServices (Maybe Text)
dvesNextToken = lens _dvesNextToken (\s a -> s {_dvesNextToken = a})

-- | One or more service names.
dvesServiceNames :: Lens' DescribeVPCEndpointServices [Text]
dvesServiceNames = lens _dvesServiceNames (\s a -> s {_dvesServiceNames = a}) . _Default . _Coerce

-- | Checks whether you have the required permissions for the action, without actually making the request, and provides an error response. If you have the required permissions, the error response is @DryRunOperation@ . Otherwise, it is @UnauthorizedOperation@ .
dvesDryRun :: Lens' DescribeVPCEndpointServices (Maybe Bool)
dvesDryRun = lens _dvesDryRun (\s a -> s {_dvesDryRun = a})

-- | The maximum number of items to return for this request. The request returns a token that you can specify in a subsequent call to get the next set of results. Constraint: If the value is greater than 1,000, we return only 1,000 items.
dvesMaxResults :: Lens' DescribeVPCEndpointServices (Maybe Int)
dvesMaxResults = lens _dvesMaxResults (\s a -> s {_dvesMaxResults = a})

-- | One or more filters.     * @service-name@ - The name of the service.     * @service-type@ - The type of service (@Interface@ | @Gateway@ ).     * @tag@ :<key> - The key/value combination of a tag assigned to the resource. Use the tag key in the filter name and the tag value as the filter value. For example, to find all resources that have a tag with the key @Owner@ and the value @TeamA@ , specify @tag:Owner@ for the filter name and @TeamA@ for the filter value.     * @tag-key@ - The key of a tag assigned to the resource. Use this filter to find all resources assigned a tag with a specific key, regardless of the tag value.
dvesFilters :: Lens' DescribeVPCEndpointServices [Filter]
dvesFilters = lens _dvesFilters (\s a -> s {_dvesFilters = a}) . _Default . _Coerce

instance AWSPager DescribeVPCEndpointServices where
  page rq rs
    | stop (rs ^. dvesrrsNextToken) = Nothing
    | stop (rs ^. dvesrrsServiceDetails) = Nothing
    | stop (rs ^. dvesrrsServiceNames) = Nothing
    | otherwise =
      Just $ rq & dvesNextToken .~ rs ^. dvesrrsNextToken

instance AWSRequest DescribeVPCEndpointServices where
  type
    Rs DescribeVPCEndpointServices =
      DescribeVPCEndpointServicesResponse
  request = postQuery ec2
  response =
    receiveXML
      ( \s h x ->
          DescribeVPCEndpointServicesResponse'
            <$> ( x .@? "serviceDetailSet" .!@ mempty
                    >>= may (parseXMLList "item")
                )
            <*> (x .@? "nextToken")
            <*> ( x .@? "serviceNameSet" .!@ mempty
                    >>= may (parseXMLList "item")
                )
            <*> (pure (fromEnum s))
      )

instance Hashable DescribeVPCEndpointServices

instance NFData DescribeVPCEndpointServices

instance ToHeaders DescribeVPCEndpointServices where
  toHeaders = const mempty

instance ToPath DescribeVPCEndpointServices where
  toPath = const "/"

instance ToQuery DescribeVPCEndpointServices where
  toQuery DescribeVPCEndpointServices' {..} =
    mconcat
      [ "Action"
          =: ("DescribeVpcEndpointServices" :: ByteString),
        "Version" =: ("2016-11-15" :: ByteString),
        "NextToken" =: _dvesNextToken,
        toQuery
          (toQueryList "ServiceName" <$> _dvesServiceNames),
        "DryRun" =: _dvesDryRun,
        "MaxResults" =: _dvesMaxResults,
        toQuery (toQueryList "Filter" <$> _dvesFilters)
      ]

-- | Contains the output of DescribeVpcEndpointServices.
--
--
--
-- /See:/ 'describeVPCEndpointServicesResponse' smart constructor.
data DescribeVPCEndpointServicesResponse = DescribeVPCEndpointServicesResponse'
  { _dvesrrsServiceDetails ::
      !( Maybe
           [ServiceDetail]
       ),
    _dvesrrsNextToken ::
      !( Maybe
           Text
       ),
    _dvesrrsServiceNames ::
      !( Maybe
           [Text]
       ),
    _dvesrrsResponseStatus ::
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

-- | Creates a value of 'DescribeVPCEndpointServicesResponse' with the minimum fields required to make a request.
--
-- Use one of the following lenses to modify other fields as desired:
--
-- * 'dvesrrsServiceDetails' - Information about the service.
--
-- * 'dvesrrsNextToken' - The token to use when requesting the next set of items. If there are no additional items to return, the string is empty.
--
-- * 'dvesrrsServiceNames' - A list of supported services.
--
-- * 'dvesrrsResponseStatus' - -- | The response status code.
describeVPCEndpointServicesResponse ::
  -- | 'dvesrrsResponseStatus'
  Int ->
  DescribeVPCEndpointServicesResponse
describeVPCEndpointServicesResponse pResponseStatus_ =
  DescribeVPCEndpointServicesResponse'
    { _dvesrrsServiceDetails =
        Nothing,
      _dvesrrsNextToken = Nothing,
      _dvesrrsServiceNames = Nothing,
      _dvesrrsResponseStatus =
        pResponseStatus_
    }

-- | Information about the service.
dvesrrsServiceDetails :: Lens' DescribeVPCEndpointServicesResponse [ServiceDetail]
dvesrrsServiceDetails = lens _dvesrrsServiceDetails (\s a -> s {_dvesrrsServiceDetails = a}) . _Default . _Coerce

-- | The token to use when requesting the next set of items. If there are no additional items to return, the string is empty.
dvesrrsNextToken :: Lens' DescribeVPCEndpointServicesResponse (Maybe Text)
dvesrrsNextToken = lens _dvesrrsNextToken (\s a -> s {_dvesrrsNextToken = a})

-- | A list of supported services.
dvesrrsServiceNames :: Lens' DescribeVPCEndpointServicesResponse [Text]
dvesrrsServiceNames = lens _dvesrrsServiceNames (\s a -> s {_dvesrrsServiceNames = a}) . _Default . _Coerce

-- | -- | The response status code.
dvesrrsResponseStatus :: Lens' DescribeVPCEndpointServicesResponse Int
dvesrrsResponseStatus = lens _dvesrrsResponseStatus (\s a -> s {_dvesrrsResponseStatus = a})

instance NFData DescribeVPCEndpointServicesResponse
