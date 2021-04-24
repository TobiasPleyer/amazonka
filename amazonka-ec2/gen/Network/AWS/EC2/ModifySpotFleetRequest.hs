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
-- Module      : Network.AWS.EC2.ModifySpotFleetRequest
-- Copyright   : (c) 2013-2021 Brendan Hay
-- License     : Mozilla Public License, v. 2.0.
-- Maintainer  : Brendan Hay <brendan.g.hay+amazonka@gmail.com>
-- Stability   : auto-generated
-- Portability : non-portable (GHC extensions)
--
-- Modifies the specified Spot Fleet request.
--
--
-- You can only modify a Spot Fleet request of type @maintain@ .
--
-- While the Spot Fleet request is being modified, it is in the @modifying@ state.
--
-- To scale up your Spot Fleet, increase its target capacity. The Spot Fleet launches the additional Spot Instances according to the allocation strategy for the Spot Fleet request. If the allocation strategy is @lowestPrice@ , the Spot Fleet launches instances using the Spot Instance pool with the lowest price. If the allocation strategy is @diversified@ , the Spot Fleet distributes the instances across the Spot Instance pools. If the allocation strategy is @capacityOptimized@ , Spot Fleet launches instances from Spot Instance pools with optimal capacity for the number of instances that are launching.
--
-- To scale down your Spot Fleet, decrease its target capacity. First, the Spot Fleet cancels any open requests that exceed the new target capacity. You can request that the Spot Fleet terminate Spot Instances until the size of the fleet no longer exceeds the new target capacity. If the allocation strategy is @lowestPrice@ , the Spot Fleet terminates the instances with the highest price per unit. If the allocation strategy is @capacityOptimized@ , the Spot Fleet terminates the instances in the Spot Instance pools that have the least available Spot Instance capacity. If the allocation strategy is @diversified@ , the Spot Fleet terminates instances across the Spot Instance pools. Alternatively, you can request that the Spot Fleet keep the fleet at its current size, but not replace any Spot Instances that are interrupted or that you terminate manually.
--
-- If you are finished with your Spot Fleet for now, but will use it again later, you can set the target capacity to 0.
module Network.AWS.EC2.ModifySpotFleetRequest
  ( -- * Creating a Request
    modifySpotFleetRequest,
    ModifySpotFleetRequest,

    -- * Request Lenses
    msfrLaunchTemplateConfigs,
    msfrOnDemandTargetCapacity,
    msfrExcessCapacityTerminationPolicy,
    msfrTargetCapacity,
    msfrSpotFleetRequestId,

    -- * Destructuring the Response
    modifySpotFleetRequestResponse,
    ModifySpotFleetRequestResponse,

    -- * Response Lenses
    msfrrrsReturn,
    msfrrrsResponseStatus,
  )
where

import Network.AWS.EC2.Types
import Network.AWS.Lens
import Network.AWS.Prelude
import Network.AWS.Request
import Network.AWS.Response

-- | Contains the parameters for ModifySpotFleetRequest.
--
--
--
-- /See:/ 'modifySpotFleetRequest' smart constructor.
data ModifySpotFleetRequest = ModifySpotFleetRequest'
  { _msfrLaunchTemplateConfigs ::
      !( Maybe
           [LaunchTemplateConfig]
       ),
    _msfrOnDemandTargetCapacity ::
      !(Maybe Int),
    _msfrExcessCapacityTerminationPolicy ::
      !( Maybe
           ExcessCapacityTerminationPolicy
       ),
    _msfrTargetCapacity ::
      !(Maybe Int),
    _msfrSpotFleetRequestId ::
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

-- | Creates a value of 'ModifySpotFleetRequest' with the minimum fields required to make a request.
--
-- Use one of the following lenses to modify other fields as desired:
--
-- * 'msfrLaunchTemplateConfigs' - The launch template and overrides. You can only use this parameter if you specified a launch template (@LaunchTemplateConfigs@ ) in your Spot Fleet request. If you specified @LaunchSpecifications@ in your Spot Fleet request, then omit this parameter.
--
-- * 'msfrOnDemandTargetCapacity' - The number of On-Demand Instances in the fleet.
--
-- * 'msfrExcessCapacityTerminationPolicy' - Indicates whether running Spot Instances should be terminated if the target capacity of the Spot Fleet request is decreased below the current size of the Spot Fleet.
--
-- * 'msfrTargetCapacity' - The size of the fleet.
--
-- * 'msfrSpotFleetRequestId' - The ID of the Spot Fleet request.
modifySpotFleetRequest ::
  -- | 'msfrSpotFleetRequestId'
  Text ->
  ModifySpotFleetRequest
modifySpotFleetRequest pSpotFleetRequestId_ =
  ModifySpotFleetRequest'
    { _msfrLaunchTemplateConfigs =
        Nothing,
      _msfrOnDemandTargetCapacity = Nothing,
      _msfrExcessCapacityTerminationPolicy = Nothing,
      _msfrTargetCapacity = Nothing,
      _msfrSpotFleetRequestId = pSpotFleetRequestId_
    }

-- | The launch template and overrides. You can only use this parameter if you specified a launch template (@LaunchTemplateConfigs@ ) in your Spot Fleet request. If you specified @LaunchSpecifications@ in your Spot Fleet request, then omit this parameter.
msfrLaunchTemplateConfigs :: Lens' ModifySpotFleetRequest [LaunchTemplateConfig]
msfrLaunchTemplateConfigs = lens _msfrLaunchTemplateConfigs (\s a -> s {_msfrLaunchTemplateConfigs = a}) . _Default . _Coerce

-- | The number of On-Demand Instances in the fleet.
msfrOnDemandTargetCapacity :: Lens' ModifySpotFleetRequest (Maybe Int)
msfrOnDemandTargetCapacity = lens _msfrOnDemandTargetCapacity (\s a -> s {_msfrOnDemandTargetCapacity = a})

-- | Indicates whether running Spot Instances should be terminated if the target capacity of the Spot Fleet request is decreased below the current size of the Spot Fleet.
msfrExcessCapacityTerminationPolicy :: Lens' ModifySpotFleetRequest (Maybe ExcessCapacityTerminationPolicy)
msfrExcessCapacityTerminationPolicy = lens _msfrExcessCapacityTerminationPolicy (\s a -> s {_msfrExcessCapacityTerminationPolicy = a})

-- | The size of the fleet.
msfrTargetCapacity :: Lens' ModifySpotFleetRequest (Maybe Int)
msfrTargetCapacity = lens _msfrTargetCapacity (\s a -> s {_msfrTargetCapacity = a})

-- | The ID of the Spot Fleet request.
msfrSpotFleetRequestId :: Lens' ModifySpotFleetRequest Text
msfrSpotFleetRequestId = lens _msfrSpotFleetRequestId (\s a -> s {_msfrSpotFleetRequestId = a})

instance AWSRequest ModifySpotFleetRequest where
  type
    Rs ModifySpotFleetRequest =
      ModifySpotFleetRequestResponse
  request = postQuery ec2
  response =
    receiveXML
      ( \s h x ->
          ModifySpotFleetRequestResponse'
            <$> (x .@? "return") <*> (pure (fromEnum s))
      )

instance Hashable ModifySpotFleetRequest

instance NFData ModifySpotFleetRequest

instance ToHeaders ModifySpotFleetRequest where
  toHeaders = const mempty

instance ToPath ModifySpotFleetRequest where
  toPath = const "/"

instance ToQuery ModifySpotFleetRequest where
  toQuery ModifySpotFleetRequest' {..} =
    mconcat
      [ "Action"
          =: ("ModifySpotFleetRequest" :: ByteString),
        "Version" =: ("2016-11-15" :: ByteString),
        toQuery
          ( toQueryList "LaunchTemplateConfig"
              <$> _msfrLaunchTemplateConfigs
          ),
        "OnDemandTargetCapacity"
          =: _msfrOnDemandTargetCapacity,
        "ExcessCapacityTerminationPolicy"
          =: _msfrExcessCapacityTerminationPolicy,
        "TargetCapacity" =: _msfrTargetCapacity,
        "SpotFleetRequestId" =: _msfrSpotFleetRequestId
      ]

-- | Contains the output of ModifySpotFleetRequest.
--
--
--
-- /See:/ 'modifySpotFleetRequestResponse' smart constructor.
data ModifySpotFleetRequestResponse = ModifySpotFleetRequestResponse'
  { _msfrrrsReturn ::
      !( Maybe
           Bool
       ),
    _msfrrrsResponseStatus ::
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

-- | Creates a value of 'ModifySpotFleetRequestResponse' with the minimum fields required to make a request.
--
-- Use one of the following lenses to modify other fields as desired:
--
-- * 'msfrrrsReturn' - Is @true@ if the request succeeds, and an error otherwise.
--
-- * 'msfrrrsResponseStatus' - -- | The response status code.
modifySpotFleetRequestResponse ::
  -- | 'msfrrrsResponseStatus'
  Int ->
  ModifySpotFleetRequestResponse
modifySpotFleetRequestResponse pResponseStatus_ =
  ModifySpotFleetRequestResponse'
    { _msfrrrsReturn =
        Nothing,
      _msfrrrsResponseStatus = pResponseStatus_
    }

-- | Is @true@ if the request succeeds, and an error otherwise.
msfrrrsReturn :: Lens' ModifySpotFleetRequestResponse (Maybe Bool)
msfrrrsReturn = lens _msfrrrsReturn (\s a -> s {_msfrrrsReturn = a})

-- | -- | The response status code.
msfrrrsResponseStatus :: Lens' ModifySpotFleetRequestResponse Int
msfrrrsResponseStatus = lens _msfrrrsResponseStatus (\s a -> s {_msfrrrsResponseStatus = a})

instance NFData ModifySpotFleetRequestResponse
