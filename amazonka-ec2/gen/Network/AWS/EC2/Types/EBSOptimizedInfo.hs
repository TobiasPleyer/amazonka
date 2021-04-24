{-# LANGUAGE DeriveDataTypeable #-}
{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE RecordWildCards #-}
{-# OPTIONS_GHC -fno-warn-unused-imports #-}

-- Derived from AWS service descriptions, licensed under Apache 2.0.

-- |
-- Module      : Network.AWS.EC2.Types.EBSOptimizedInfo
-- Copyright   : (c) 2013-2021 Brendan Hay
-- License     : Mozilla Public License, v. 2.0.
-- Maintainer  : Brendan Hay <brendan.g.hay+amazonka@gmail.com>
-- Stability   : auto-generated
-- Portability : non-portable (GHC extensions)
module Network.AWS.EC2.Types.EBSOptimizedInfo where

import Network.AWS.EC2.Internal
import Network.AWS.Lens
import Network.AWS.Prelude

-- | Describes the optimized EBS performance for supported instance types.
--
--
--
-- /See:/ 'ebsOptimizedInfo' smart constructor.
data EBSOptimizedInfo = EBSOptimizedInfo'
  { _eoiBaselineBandwidthInMbps ::
      !(Maybe Int),
    _eoiMaximumIOPS :: !(Maybe Int),
    _eoiMaximumBandwidthInMbps ::
      !(Maybe Int),
    _eoiMaximumThroughputInMBps ::
      !(Maybe Double),
    _eoiBaselineIOPS :: !(Maybe Int),
    _eoiBaselineThroughputInMBps ::
      !(Maybe Double)
  }
  deriving (Eq, Read, Show, Data, Typeable, Generic)

-- | Creates a value of 'EBSOptimizedInfo' with the minimum fields required to make a request.
--
-- Use one of the following lenses to modify other fields as desired:
--
-- * 'eoiBaselineBandwidthInMbps' - The baseline bandwidth performance for an EBS-optimized instance type, in Mbps.
--
-- * 'eoiMaximumIOPS' - The maximum input/output storage operations per second for an EBS-optimized instance type.
--
-- * 'eoiMaximumBandwidthInMbps' - The maximum bandwidth performance for an EBS-optimized instance type, in Mbps.
--
-- * 'eoiMaximumThroughputInMBps' - The maximum throughput performance for an EBS-optimized instance type, in MB/s.
--
-- * 'eoiBaselineIOPS' - The baseline input/output storage operations per seconds for an EBS-optimized instance type.
--
-- * 'eoiBaselineThroughputInMBps' - The baseline throughput performance for an EBS-optimized instance type, in MB/s.
ebsOptimizedInfo ::
  EBSOptimizedInfo
ebsOptimizedInfo =
  EBSOptimizedInfo'
    { _eoiBaselineBandwidthInMbps =
        Nothing,
      _eoiMaximumIOPS = Nothing,
      _eoiMaximumBandwidthInMbps = Nothing,
      _eoiMaximumThroughputInMBps = Nothing,
      _eoiBaselineIOPS = Nothing,
      _eoiBaselineThroughputInMBps = Nothing
    }

-- | The baseline bandwidth performance for an EBS-optimized instance type, in Mbps.
eoiBaselineBandwidthInMbps :: Lens' EBSOptimizedInfo (Maybe Int)
eoiBaselineBandwidthInMbps = lens _eoiBaselineBandwidthInMbps (\s a -> s {_eoiBaselineBandwidthInMbps = a})

-- | The maximum input/output storage operations per second for an EBS-optimized instance type.
eoiMaximumIOPS :: Lens' EBSOptimizedInfo (Maybe Int)
eoiMaximumIOPS = lens _eoiMaximumIOPS (\s a -> s {_eoiMaximumIOPS = a})

-- | The maximum bandwidth performance for an EBS-optimized instance type, in Mbps.
eoiMaximumBandwidthInMbps :: Lens' EBSOptimizedInfo (Maybe Int)
eoiMaximumBandwidthInMbps = lens _eoiMaximumBandwidthInMbps (\s a -> s {_eoiMaximumBandwidthInMbps = a})

-- | The maximum throughput performance for an EBS-optimized instance type, in MB/s.
eoiMaximumThroughputInMBps :: Lens' EBSOptimizedInfo (Maybe Double)
eoiMaximumThroughputInMBps = lens _eoiMaximumThroughputInMBps (\s a -> s {_eoiMaximumThroughputInMBps = a})

-- | The baseline input/output storage operations per seconds for an EBS-optimized instance type.
eoiBaselineIOPS :: Lens' EBSOptimizedInfo (Maybe Int)
eoiBaselineIOPS = lens _eoiBaselineIOPS (\s a -> s {_eoiBaselineIOPS = a})

-- | The baseline throughput performance for an EBS-optimized instance type, in MB/s.
eoiBaselineThroughputInMBps :: Lens' EBSOptimizedInfo (Maybe Double)
eoiBaselineThroughputInMBps = lens _eoiBaselineThroughputInMBps (\s a -> s {_eoiBaselineThroughputInMBps = a})

instance FromXML EBSOptimizedInfo where
  parseXML x =
    EBSOptimizedInfo'
      <$> (x .@? "baselineBandwidthInMbps")
      <*> (x .@? "maximumIops")
      <*> (x .@? "maximumBandwidthInMbps")
      <*> (x .@? "maximumThroughputInMBps")
      <*> (x .@? "baselineIops")
      <*> (x .@? "baselineThroughputInMBps")

instance Hashable EBSOptimizedInfo

instance NFData EBSOptimizedInfo
