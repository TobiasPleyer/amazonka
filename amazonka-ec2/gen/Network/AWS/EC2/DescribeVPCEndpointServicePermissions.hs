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
-- Module      : Network.AWS.EC2.DescribeVPCEndpointServicePermissions
-- Copyright   : (c) 2013-2021 Brendan Hay
-- License     : Mozilla Public License, v. 2.0.
-- Maintainer  : Brendan Hay <brendan.g.hay+amazonka@gmail.com>
-- Stability   : auto-generated
-- Portability : non-portable (GHC extensions)
--
-- Describes the principals (service consumers) that are permitted to discover your VPC endpoint service.
--
--
--
-- This operation returns paginated results.
module Network.AWS.EC2.DescribeVPCEndpointServicePermissions
  ( -- * Creating a Request
    describeVPCEndpointServicePermissions,
    DescribeVPCEndpointServicePermissions,

    -- * Request Lenses
    dvespNextToken,
    dvespDryRun,
    dvespMaxResults,
    dvespFilters,
    dvespServiceId,

    -- * Destructuring the Response
    describeVPCEndpointServicePermissionsResponse,
    DescribeVPCEndpointServicePermissionsResponse,

    -- * Response Lenses
    dvesprrsNextToken,
    dvesprrsAllowedPrincipals,
    dvesprrsResponseStatus,
  )
where

import Network.AWS.EC2.Types
import Network.AWS.Lens
import Network.AWS.Pager
import Network.AWS.Prelude
import Network.AWS.Request
import Network.AWS.Response

-- | /See:/ 'describeVPCEndpointServicePermissions' smart constructor.
data DescribeVPCEndpointServicePermissions = DescribeVPCEndpointServicePermissions'
  { _dvespNextToken ::
      !( Maybe
           Text
       ),
    _dvespDryRun ::
      !( Maybe
           Bool
       ),
    _dvespMaxResults ::
      !( Maybe
           Int
       ),
    _dvespFilters ::
      !( Maybe
           [Filter]
       ),
    _dvespServiceId ::
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

-- | Creates a value of 'DescribeVPCEndpointServicePermissions' with the minimum fields required to make a request.
--
-- Use one of the following lenses to modify other fields as desired:
--
-- * 'dvespNextToken' - The token to retrieve the next page of results.
--
-- * 'dvespDryRun' - Checks whether you have the required permissions for the action, without actually making the request, and provides an error response. If you have the required permissions, the error response is @DryRunOperation@ . Otherwise, it is @UnauthorizedOperation@ .
--
-- * 'dvespMaxResults' - The maximum number of results to return for the request in a single page. The remaining results of the initial request can be seen by sending another request with the returned @NextToken@ value. This value can be between 5 and 1,000; if @MaxResults@ is given a value larger than 1,000, only 1,000 results are returned.
--
-- * 'dvespFilters' - One or more filters.     * @principal@ - The ARN of the principal.     * @principal-type@ - The principal type (@All@ | @Service@ | @OrganizationUnit@ | @Account@ | @User@ | @Role@ ).
--
-- * 'dvespServiceId' - The ID of the service.
describeVPCEndpointServicePermissions ::
  -- | 'dvespServiceId'
  Text ->
  DescribeVPCEndpointServicePermissions
describeVPCEndpointServicePermissions pServiceId_ =
  DescribeVPCEndpointServicePermissions'
    { _dvespNextToken =
        Nothing,
      _dvespDryRun = Nothing,
      _dvespMaxResults = Nothing,
      _dvespFilters = Nothing,
      _dvespServiceId = pServiceId_
    }

-- | The token to retrieve the next page of results.
dvespNextToken :: Lens' DescribeVPCEndpointServicePermissions (Maybe Text)
dvespNextToken = lens _dvespNextToken (\s a -> s {_dvespNextToken = a})

-- | Checks whether you have the required permissions for the action, without actually making the request, and provides an error response. If you have the required permissions, the error response is @DryRunOperation@ . Otherwise, it is @UnauthorizedOperation@ .
dvespDryRun :: Lens' DescribeVPCEndpointServicePermissions (Maybe Bool)
dvespDryRun = lens _dvespDryRun (\s a -> s {_dvespDryRun = a})

-- | The maximum number of results to return for the request in a single page. The remaining results of the initial request can be seen by sending another request with the returned @NextToken@ value. This value can be between 5 and 1,000; if @MaxResults@ is given a value larger than 1,000, only 1,000 results are returned.
dvespMaxResults :: Lens' DescribeVPCEndpointServicePermissions (Maybe Int)
dvespMaxResults = lens _dvespMaxResults (\s a -> s {_dvespMaxResults = a})

-- | One or more filters.     * @principal@ - The ARN of the principal.     * @principal-type@ - The principal type (@All@ | @Service@ | @OrganizationUnit@ | @Account@ | @User@ | @Role@ ).
dvespFilters :: Lens' DescribeVPCEndpointServicePermissions [Filter]
dvespFilters = lens _dvespFilters (\s a -> s {_dvespFilters = a}) . _Default . _Coerce

-- | The ID of the service.
dvespServiceId :: Lens' DescribeVPCEndpointServicePermissions Text
dvespServiceId = lens _dvespServiceId (\s a -> s {_dvespServiceId = a})

instance
  AWSPager
    DescribeVPCEndpointServicePermissions
  where
  page rq rs
    | stop (rs ^. dvesprrsNextToken) = Nothing
    | stop (rs ^. dvesprrsAllowedPrincipals) = Nothing
    | otherwise =
      Just $ rq & dvespNextToken .~ rs ^. dvesprrsNextToken

instance
  AWSRequest
    DescribeVPCEndpointServicePermissions
  where
  type
    Rs DescribeVPCEndpointServicePermissions =
      DescribeVPCEndpointServicePermissionsResponse
  request = postQuery ec2
  response =
    receiveXML
      ( \s h x ->
          DescribeVPCEndpointServicePermissionsResponse'
            <$> (x .@? "nextToken")
            <*> ( x .@? "allowedPrincipals" .!@ mempty
                    >>= may (parseXMLList "item")
                )
            <*> (pure (fromEnum s))
      )

instance
  Hashable
    DescribeVPCEndpointServicePermissions

instance NFData DescribeVPCEndpointServicePermissions

instance
  ToHeaders
    DescribeVPCEndpointServicePermissions
  where
  toHeaders = const mempty

instance ToPath DescribeVPCEndpointServicePermissions where
  toPath = const "/"

instance
  ToQuery
    DescribeVPCEndpointServicePermissions
  where
  toQuery DescribeVPCEndpointServicePermissions' {..} =
    mconcat
      [ "Action"
          =: ( "DescribeVpcEndpointServicePermissions" ::
                 ByteString
             ),
        "Version" =: ("2016-11-15" :: ByteString),
        "NextToken" =: _dvespNextToken,
        "DryRun" =: _dvespDryRun,
        "MaxResults" =: _dvespMaxResults,
        toQuery (toQueryList "Filter" <$> _dvespFilters),
        "ServiceId" =: _dvespServiceId
      ]

-- | /See:/ 'describeVPCEndpointServicePermissionsResponse' smart constructor.
data DescribeVPCEndpointServicePermissionsResponse = DescribeVPCEndpointServicePermissionsResponse'
  { _dvesprrsNextToken ::
      !( Maybe
           Text
       ),
    _dvesprrsAllowedPrincipals ::
      !( Maybe
           [AllowedPrincipal]
       ),
    _dvesprrsResponseStatus ::
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

-- | Creates a value of 'DescribeVPCEndpointServicePermissionsResponse' with the minimum fields required to make a request.
--
-- Use one of the following lenses to modify other fields as desired:
--
-- * 'dvesprrsNextToken' - The token to use to retrieve the next page of results. This value is @null@ when there are no more results to return.
--
-- * 'dvesprrsAllowedPrincipals' - Information about one or more allowed principals.
--
-- * 'dvesprrsResponseStatus' - -- | The response status code.
describeVPCEndpointServicePermissionsResponse ::
  -- | 'dvesprrsResponseStatus'
  Int ->
  DescribeVPCEndpointServicePermissionsResponse
describeVPCEndpointServicePermissionsResponse
  pResponseStatus_ =
    DescribeVPCEndpointServicePermissionsResponse'
      { _dvesprrsNextToken =
          Nothing,
        _dvesprrsAllowedPrincipals =
          Nothing,
        _dvesprrsResponseStatus =
          pResponseStatus_
      }

-- | The token to use to retrieve the next page of results. This value is @null@ when there are no more results to return.
dvesprrsNextToken :: Lens' DescribeVPCEndpointServicePermissionsResponse (Maybe Text)
dvesprrsNextToken = lens _dvesprrsNextToken (\s a -> s {_dvesprrsNextToken = a})

-- | Information about one or more allowed principals.
dvesprrsAllowedPrincipals :: Lens' DescribeVPCEndpointServicePermissionsResponse [AllowedPrincipal]
dvesprrsAllowedPrincipals = lens _dvesprrsAllowedPrincipals (\s a -> s {_dvesprrsAllowedPrincipals = a}) . _Default . _Coerce

-- | -- | The response status code.
dvesprrsResponseStatus :: Lens' DescribeVPCEndpointServicePermissionsResponse Int
dvesprrsResponseStatus = lens _dvesprrsResponseStatus (\s a -> s {_dvesprrsResponseStatus = a})

instance
  NFData
    DescribeVPCEndpointServicePermissionsResponse
