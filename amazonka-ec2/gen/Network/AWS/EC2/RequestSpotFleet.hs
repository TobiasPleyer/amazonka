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
-- Module      : Network.AWS.EC2.RequestSpotFleet
-- Copyright   : (c) 2013-2021 Brendan Hay
-- License     : Mozilla Public License, v. 2.0.
-- Maintainer  : Brendan Hay <brendan.g.hay+amazonka@gmail.com>
-- Stability   : auto-generated
-- Portability : non-portable (GHC extensions)
--
-- Creates a Spot Fleet request.
--
--
-- The Spot Fleet request specifies the total target capacity and the On-Demand target capacity. Amazon EC2 calculates the difference between the total capacity and On-Demand capacity, and launches the difference as Spot capacity.
--
-- You can submit a single request that includes multiple launch specifications that vary by instance type, AMI, Availability Zone, or subnet.
--
-- By default, the Spot Fleet requests Spot Instances in the Spot Instance pool where the price per unit is the lowest. Each launch specification can include its own instance weighting that reflects the value of the instance type to your application workload.
--
-- Alternatively, you can specify that the Spot Fleet distribute the target capacity across the Spot pools included in its launch specifications. By ensuring that the Spot Instances in your Spot Fleet are in different Spot pools, you can improve the availability of your fleet.
--
-- You can specify tags for the Spot Fleet request and instances launched by the fleet. You cannot tag other resource types in a Spot Fleet request because only the @spot-fleet-request@ and @instance@ resource types are supported.
--
-- For more information, see <https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/spot-fleet-requests.html Spot Fleet requests> in the /Amazon EC2 User Guide for Linux Instances/ .
module Network.AWS.EC2.RequestSpotFleet
  ( -- * Creating a Request
    requestSpotFleet,
    RequestSpotFleet,

    -- * Request Lenses
    rsfDryRun,
    rsfSpotFleetRequestConfig,

    -- * Destructuring the Response
    requestSpotFleetResponse,
    RequestSpotFleetResponse,

    -- * Response Lenses
    rsfrrsSpotFleetRequestId,
    rsfrrsResponseStatus,
  )
where

import Network.AWS.EC2.Types
import Network.AWS.Lens
import Network.AWS.Prelude
import Network.AWS.Request
import Network.AWS.Response

-- | Contains the parameters for RequestSpotFleet.
--
--
--
-- /See:/ 'requestSpotFleet' smart constructor.
data RequestSpotFleet = RequestSpotFleet'
  { _rsfDryRun ::
      !(Maybe Bool),
    _rsfSpotFleetRequestConfig ::
      !SpotFleetRequestConfigData
  }
  deriving (Eq, Read, Show, Data, Typeable, Generic)

-- | Creates a value of 'RequestSpotFleet' with the minimum fields required to make a request.
--
-- Use one of the following lenses to modify other fields as desired:
--
-- * 'rsfDryRun' - Checks whether you have the required permissions for the action, without actually making the request, and provides an error response. If you have the required permissions, the error response is @DryRunOperation@ . Otherwise, it is @UnauthorizedOperation@ .
--
-- * 'rsfSpotFleetRequestConfig' - The configuration for the Spot Fleet request.
requestSpotFleet ::
  -- | 'rsfSpotFleetRequestConfig'
  SpotFleetRequestConfigData ->
  RequestSpotFleet
requestSpotFleet pSpotFleetRequestConfig_ =
  RequestSpotFleet'
    { _rsfDryRun = Nothing,
      _rsfSpotFleetRequestConfig =
        pSpotFleetRequestConfig_
    }

-- | Checks whether you have the required permissions for the action, without actually making the request, and provides an error response. If you have the required permissions, the error response is @DryRunOperation@ . Otherwise, it is @UnauthorizedOperation@ .
rsfDryRun :: Lens' RequestSpotFleet (Maybe Bool)
rsfDryRun = lens _rsfDryRun (\s a -> s {_rsfDryRun = a})

-- | The configuration for the Spot Fleet request.
rsfSpotFleetRequestConfig :: Lens' RequestSpotFleet SpotFleetRequestConfigData
rsfSpotFleetRequestConfig = lens _rsfSpotFleetRequestConfig (\s a -> s {_rsfSpotFleetRequestConfig = a})

instance AWSRequest RequestSpotFleet where
  type Rs RequestSpotFleet = RequestSpotFleetResponse
  request = postQuery ec2
  response =
    receiveXML
      ( \s h x ->
          RequestSpotFleetResponse'
            <$> (x .@? "spotFleetRequestId") <*> (pure (fromEnum s))
      )

instance Hashable RequestSpotFleet

instance NFData RequestSpotFleet

instance ToHeaders RequestSpotFleet where
  toHeaders = const mempty

instance ToPath RequestSpotFleet where
  toPath = const "/"

instance ToQuery RequestSpotFleet where
  toQuery RequestSpotFleet' {..} =
    mconcat
      [ "Action" =: ("RequestSpotFleet" :: ByteString),
        "Version" =: ("2016-11-15" :: ByteString),
        "DryRun" =: _rsfDryRun,
        "SpotFleetRequestConfig"
          =: _rsfSpotFleetRequestConfig
      ]

-- | Contains the output of RequestSpotFleet.
--
--
--
-- /See:/ 'requestSpotFleetResponse' smart constructor.
data RequestSpotFleetResponse = RequestSpotFleetResponse'
  { _rsfrrsSpotFleetRequestId ::
      !(Maybe Text),
    _rsfrrsResponseStatus ::
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

-- | Creates a value of 'RequestSpotFleetResponse' with the minimum fields required to make a request.
--
-- Use one of the following lenses to modify other fields as desired:
--
-- * 'rsfrrsSpotFleetRequestId' - The ID of the Spot Fleet request.
--
-- * 'rsfrrsResponseStatus' - -- | The response status code.
requestSpotFleetResponse ::
  -- | 'rsfrrsResponseStatus'
  Int ->
  RequestSpotFleetResponse
requestSpotFleetResponse pResponseStatus_ =
  RequestSpotFleetResponse'
    { _rsfrrsSpotFleetRequestId =
        Nothing,
      _rsfrrsResponseStatus = pResponseStatus_
    }

-- | The ID of the Spot Fleet request.
rsfrrsSpotFleetRequestId :: Lens' RequestSpotFleetResponse (Maybe Text)
rsfrrsSpotFleetRequestId = lens _rsfrrsSpotFleetRequestId (\s a -> s {_rsfrrsSpotFleetRequestId = a})

-- | -- | The response status code.
rsfrrsResponseStatus :: Lens' RequestSpotFleetResponse Int
rsfrrsResponseStatus = lens _rsfrrsResponseStatus (\s a -> s {_rsfrrsResponseStatus = a})

instance NFData RequestSpotFleetResponse
