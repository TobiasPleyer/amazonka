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
-- Module      : Network.AWS.EC2.DescribeNetworkInterfaces
-- Copyright   : (c) 2013-2021 Brendan Hay
-- License     : Mozilla Public License, v. 2.0.
-- Maintainer  : Brendan Hay <brendan.g.hay+amazonka@gmail.com>
-- Stability   : auto-generated
-- Portability : non-portable (GHC extensions)
--
-- Describes one or more of your network interfaces.
--
--
--
-- This operation returns paginated results.
module Network.AWS.EC2.DescribeNetworkInterfaces
  ( -- * Creating a Request
    describeNetworkInterfaces,
    DescribeNetworkInterfaces,

    -- * Request Lenses
    dnisNextToken,
    dnisDryRun,
    dnisMaxResults,
    dnisNetworkInterfaceIds,
    dnisFilters,

    -- * Destructuring the Response
    describeNetworkInterfacesResponse,
    DescribeNetworkInterfacesResponse,

    -- * Response Lenses
    dnirrsNextToken,
    dnirrsNetworkInterfaces,
    dnirrsResponseStatus,
  )
where

import Network.AWS.EC2.Types
import Network.AWS.Lens
import Network.AWS.Pager
import Network.AWS.Prelude
import Network.AWS.Request
import Network.AWS.Response

-- | Contains the parameters for DescribeNetworkInterfaces.
--
--
--
-- /See:/ 'describeNetworkInterfaces' smart constructor.
data DescribeNetworkInterfaces = DescribeNetworkInterfaces'
  { _dnisNextToken ::
      !(Maybe Text),
    _dnisDryRun ::
      !(Maybe Bool),
    _dnisMaxResults ::
      !(Maybe Nat),
    _dnisNetworkInterfaceIds ::
      !(Maybe [Text]),
    _dnisFilters ::
      !(Maybe [Filter])
  }
  deriving
    ( Eq,
      Read,
      Show,
      Data,
      Typeable,
      Generic
    )

-- | Creates a value of 'DescribeNetworkInterfaces' with the minimum fields required to make a request.
--
-- Use one of the following lenses to modify other fields as desired:
--
-- * 'dnisNextToken' - The token to retrieve the next page of results.
--
-- * 'dnisDryRun' - Checks whether you have the required permissions for the action, without actually making the request, and provides an error response. If you have the required permissions, the error response is @DryRunOperation@ . Otherwise, it is @UnauthorizedOperation@ .
--
-- * 'dnisMaxResults' - The maximum number of items to return for this request. The request returns a token that you can specify in a subsequent call to get the next set of results. You cannot specify this parameter and the network interface IDs parameter in the same request.
--
-- * 'dnisNetworkInterfaceIds' - One or more network interface IDs. Default: Describes all your network interfaces.
--
-- * 'dnisFilters' - One or more filters.     * @addresses.private-ip-address@ - The private IPv4 addresses associated with the network interface.     * @addresses.primary@ - Whether the private IPv4 address is the primary IP address associated with the network interface.      * @addresses.association.public-ip@ - The association ID returned when the network interface was associated with the Elastic IP address (IPv4).     * @addresses.association.owner-id@ - The owner ID of the addresses associated with the network interface.     * @association.association-id@ - The association ID returned when the network interface was associated with an IPv4 address.     * @association.allocation-id@ - The allocation ID returned when you allocated the Elastic IP address (IPv4) for your network interface.     * @association.ip-owner-id@ - The owner of the Elastic IP address (IPv4) associated with the network interface.     * @association.public-ip@ - The address of the Elastic IP address (IPv4) bound to the network interface.     * @association.public-dns-name@ - The public DNS name for the network interface (IPv4).     * @attachment.attachment-id@ - The ID of the interface attachment.     * @attachment.attach-time@ - The time that the network interface was attached to an instance.     * @attachment.delete-on-termination@ - Indicates whether the attachment is deleted when an instance is terminated.     * @attachment.device-index@ - The device index to which the network interface is attached.     * @attachment.instance-id@ - The ID of the instance to which the network interface is attached.     * @attachment.instance-owner-id@ - The owner ID of the instance to which the network interface is attached.     * @attachment.status@ - The status of the attachment (@attaching@ | @attached@ | @detaching@ | @detached@ ).     * @availability-zone@ - The Availability Zone of the network interface.     * @description@ - The description of the network interface.     * @group-id@ - The ID of a security group associated with the network interface.     * @group-name@ - The name of a security group associated with the network interface.     * @ipv6-addresses.ipv6-address@ - An IPv6 address associated with the network interface.     * @mac-address@ - The MAC address of the network interface.     * @network-interface-id@ - The ID of the network interface.     * @owner-id@ - The AWS account ID of the network interface owner.     * @private-ip-address@ - The private IPv4 address or addresses of the network interface.     * @private-dns-name@ - The private DNS name of the network interface (IPv4).     * @requester-id@ - The alias or AWS account ID of the principal or service that created the network interface.     * @requester-managed@ - Indicates whether the network interface is being managed by an AWS service (for example, AWS Management Console, Auto Scaling, and so on).     * @source-dest-check@ - Indicates whether the network interface performs source/destination checking. A value of @true@ means checking is enabled, and @false@ means checking is disabled. The value must be @false@ for the network interface to perform network address translation (NAT) in your VPC.      * @status@ - The status of the network interface. If the network interface is not attached to an instance, the status is @available@ ; if a network interface is attached to an instance the status is @in-use@ .     * @subnet-id@ - The ID of the subnet for the network interface.     * @tag@ :<key> - The key/value combination of a tag assigned to the resource. Use the tag key in the filter name and the tag value as the filter value. For example, to find all resources that have a tag with the key @Owner@ and the value @TeamA@ , specify @tag:Owner@ for the filter name and @TeamA@ for the filter value.     * @tag-key@ - The key of a tag assigned to the resource. Use this filter to find all resources assigned a tag with a specific key, regardless of the tag value.     * @vpc-id@ - The ID of the VPC for the network interface.
describeNetworkInterfaces ::
  DescribeNetworkInterfaces
describeNetworkInterfaces =
  DescribeNetworkInterfaces'
    { _dnisNextToken =
        Nothing,
      _dnisDryRun = Nothing,
      _dnisMaxResults = Nothing,
      _dnisNetworkInterfaceIds = Nothing,
      _dnisFilters = Nothing
    }

-- | The token to retrieve the next page of results.
dnisNextToken :: Lens' DescribeNetworkInterfaces (Maybe Text)
dnisNextToken = lens _dnisNextToken (\s a -> s {_dnisNextToken = a})

-- | Checks whether you have the required permissions for the action, without actually making the request, and provides an error response. If you have the required permissions, the error response is @DryRunOperation@ . Otherwise, it is @UnauthorizedOperation@ .
dnisDryRun :: Lens' DescribeNetworkInterfaces (Maybe Bool)
dnisDryRun = lens _dnisDryRun (\s a -> s {_dnisDryRun = a})

-- | The maximum number of items to return for this request. The request returns a token that you can specify in a subsequent call to get the next set of results. You cannot specify this parameter and the network interface IDs parameter in the same request.
dnisMaxResults :: Lens' DescribeNetworkInterfaces (Maybe Natural)
dnisMaxResults = lens _dnisMaxResults (\s a -> s {_dnisMaxResults = a}) . mapping _Nat

-- | One or more network interface IDs. Default: Describes all your network interfaces.
dnisNetworkInterfaceIds :: Lens' DescribeNetworkInterfaces [Text]
dnisNetworkInterfaceIds = lens _dnisNetworkInterfaceIds (\s a -> s {_dnisNetworkInterfaceIds = a}) . _Default . _Coerce

-- | One or more filters.     * @addresses.private-ip-address@ - The private IPv4 addresses associated with the network interface.     * @addresses.primary@ - Whether the private IPv4 address is the primary IP address associated with the network interface.      * @addresses.association.public-ip@ - The association ID returned when the network interface was associated with the Elastic IP address (IPv4).     * @addresses.association.owner-id@ - The owner ID of the addresses associated with the network interface.     * @association.association-id@ - The association ID returned when the network interface was associated with an IPv4 address.     * @association.allocation-id@ - The allocation ID returned when you allocated the Elastic IP address (IPv4) for your network interface.     * @association.ip-owner-id@ - The owner of the Elastic IP address (IPv4) associated with the network interface.     * @association.public-ip@ - The address of the Elastic IP address (IPv4) bound to the network interface.     * @association.public-dns-name@ - The public DNS name for the network interface (IPv4).     * @attachment.attachment-id@ - The ID of the interface attachment.     * @attachment.attach-time@ - The time that the network interface was attached to an instance.     * @attachment.delete-on-termination@ - Indicates whether the attachment is deleted when an instance is terminated.     * @attachment.device-index@ - The device index to which the network interface is attached.     * @attachment.instance-id@ - The ID of the instance to which the network interface is attached.     * @attachment.instance-owner-id@ - The owner ID of the instance to which the network interface is attached.     * @attachment.status@ - The status of the attachment (@attaching@ | @attached@ | @detaching@ | @detached@ ).     * @availability-zone@ - The Availability Zone of the network interface.     * @description@ - The description of the network interface.     * @group-id@ - The ID of a security group associated with the network interface.     * @group-name@ - The name of a security group associated with the network interface.     * @ipv6-addresses.ipv6-address@ - An IPv6 address associated with the network interface.     * @mac-address@ - The MAC address of the network interface.     * @network-interface-id@ - The ID of the network interface.     * @owner-id@ - The AWS account ID of the network interface owner.     * @private-ip-address@ - The private IPv4 address or addresses of the network interface.     * @private-dns-name@ - The private DNS name of the network interface (IPv4).     * @requester-id@ - The alias or AWS account ID of the principal or service that created the network interface.     * @requester-managed@ - Indicates whether the network interface is being managed by an AWS service (for example, AWS Management Console, Auto Scaling, and so on).     * @source-dest-check@ - Indicates whether the network interface performs source/destination checking. A value of @true@ means checking is enabled, and @false@ means checking is disabled. The value must be @false@ for the network interface to perform network address translation (NAT) in your VPC.      * @status@ - The status of the network interface. If the network interface is not attached to an instance, the status is @available@ ; if a network interface is attached to an instance the status is @in-use@ .     * @subnet-id@ - The ID of the subnet for the network interface.     * @tag@ :<key> - The key/value combination of a tag assigned to the resource. Use the tag key in the filter name and the tag value as the filter value. For example, to find all resources that have a tag with the key @Owner@ and the value @TeamA@ , specify @tag:Owner@ for the filter name and @TeamA@ for the filter value.     * @tag-key@ - The key of a tag assigned to the resource. Use this filter to find all resources assigned a tag with a specific key, regardless of the tag value.     * @vpc-id@ - The ID of the VPC for the network interface.
dnisFilters :: Lens' DescribeNetworkInterfaces [Filter]
dnisFilters = lens _dnisFilters (\s a -> s {_dnisFilters = a}) . _Default . _Coerce

instance AWSPager DescribeNetworkInterfaces where
  page rq rs
    | stop (rs ^. dnirrsNextToken) = Nothing
    | stop (rs ^. dnirrsNetworkInterfaces) = Nothing
    | otherwise =
      Just $ rq & dnisNextToken .~ rs ^. dnirrsNextToken

instance AWSRequest DescribeNetworkInterfaces where
  type
    Rs DescribeNetworkInterfaces =
      DescribeNetworkInterfacesResponse
  request = postQuery ec2
  response =
    receiveXML
      ( \s h x ->
          DescribeNetworkInterfacesResponse'
            <$> (x .@? "nextToken")
            <*> ( x .@? "networkInterfaceSet" .!@ mempty
                    >>= may (parseXMLList "item")
                )
            <*> (pure (fromEnum s))
      )

instance Hashable DescribeNetworkInterfaces

instance NFData DescribeNetworkInterfaces

instance ToHeaders DescribeNetworkInterfaces where
  toHeaders = const mempty

instance ToPath DescribeNetworkInterfaces where
  toPath = const "/"

instance ToQuery DescribeNetworkInterfaces where
  toQuery DescribeNetworkInterfaces' {..} =
    mconcat
      [ "Action"
          =: ("DescribeNetworkInterfaces" :: ByteString),
        "Version" =: ("2016-11-15" :: ByteString),
        "NextToken" =: _dnisNextToken,
        "DryRun" =: _dnisDryRun,
        "MaxResults" =: _dnisMaxResults,
        toQuery
          ( toQueryList "NetworkInterfaceId"
              <$> _dnisNetworkInterfaceIds
          ),
        toQuery (toQueryList "Filter" <$> _dnisFilters)
      ]

-- | Contains the output of DescribeNetworkInterfaces.
--
--
--
-- /See:/ 'describeNetworkInterfacesResponse' smart constructor.
data DescribeNetworkInterfacesResponse = DescribeNetworkInterfacesResponse'
  { _dnirrsNextToken ::
      !( Maybe
           Text
       ),
    _dnirrsNetworkInterfaces ::
      !( Maybe
           [NetworkInterface]
       ),
    _dnirrsResponseStatus ::
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

-- | Creates a value of 'DescribeNetworkInterfacesResponse' with the minimum fields required to make a request.
--
-- Use one of the following lenses to modify other fields as desired:
--
-- * 'dnirrsNextToken' - The token to use to retrieve the next page of results. This value is @null@ when there are no more results to return.
--
-- * 'dnirrsNetworkInterfaces' - Information about one or more network interfaces.
--
-- * 'dnirrsResponseStatus' - -- | The response status code.
describeNetworkInterfacesResponse ::
  -- | 'dnirrsResponseStatus'
  Int ->
  DescribeNetworkInterfacesResponse
describeNetworkInterfacesResponse pResponseStatus_ =
  DescribeNetworkInterfacesResponse'
    { _dnirrsNextToken =
        Nothing,
      _dnirrsNetworkInterfaces = Nothing,
      _dnirrsResponseStatus = pResponseStatus_
    }

-- | The token to use to retrieve the next page of results. This value is @null@ when there are no more results to return.
dnirrsNextToken :: Lens' DescribeNetworkInterfacesResponse (Maybe Text)
dnirrsNextToken = lens _dnirrsNextToken (\s a -> s {_dnirrsNextToken = a})

-- | Information about one or more network interfaces.
dnirrsNetworkInterfaces :: Lens' DescribeNetworkInterfacesResponse [NetworkInterface]
dnirrsNetworkInterfaces = lens _dnirrsNetworkInterfaces (\s a -> s {_dnirrsNetworkInterfaces = a}) . _Default . _Coerce

-- | -- | The response status code.
dnirrsResponseStatus :: Lens' DescribeNetworkInterfacesResponse Int
dnirrsResponseStatus = lens _dnirrsResponseStatus (\s a -> s {_dnirrsResponseStatus = a})

instance NFData DescribeNetworkInterfacesResponse
