{-# LANGUAGE DeriveDataTypeable #-}
{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE RecordWildCards #-}
{-# OPTIONS_GHC -fno-warn-unused-imports #-}

-- Derived from AWS service descriptions, licensed under Apache 2.0.

-- |
-- Module      : Network.AWS.EC2.Types.ProcessorInfo
-- Copyright   : (c) 2013-2021 Brendan Hay
-- License     : Mozilla Public License, v. 2.0.
-- Maintainer  : Brendan Hay <brendan.g.hay+amazonka@gmail.com>
-- Stability   : auto-generated
-- Portability : non-portable (GHC extensions)
module Network.AWS.EC2.Types.ProcessorInfo where

import Network.AWS.EC2.Internal
import Network.AWS.EC2.Types.ArchitectureType
import Network.AWS.Lens
import Network.AWS.Prelude

-- | Describes the processor used by the instance type.
--
--
--
-- /See:/ 'processorInfo' smart constructor.
data ProcessorInfo = ProcessorInfo'
  { _piSustainedClockSpeedInGhz ::
      !(Maybe Double),
    _piSupportedArchitectures ::
      !(Maybe [ArchitectureType])
  }
  deriving (Eq, Read, Show, Data, Typeable, Generic)

-- | Creates a value of 'ProcessorInfo' with the minimum fields required to make a request.
--
-- Use one of the following lenses to modify other fields as desired:
--
-- * 'piSustainedClockSpeedInGhz' - The speed of the processor, in GHz.
--
-- * 'piSupportedArchitectures' - The architectures supported by the instance type.
processorInfo ::
  ProcessorInfo
processorInfo =
  ProcessorInfo'
    { _piSustainedClockSpeedInGhz =
        Nothing,
      _piSupportedArchitectures = Nothing
    }

-- | The speed of the processor, in GHz.
piSustainedClockSpeedInGhz :: Lens' ProcessorInfo (Maybe Double)
piSustainedClockSpeedInGhz = lens _piSustainedClockSpeedInGhz (\s a -> s {_piSustainedClockSpeedInGhz = a})

-- | The architectures supported by the instance type.
piSupportedArchitectures :: Lens' ProcessorInfo [ArchitectureType]
piSupportedArchitectures = lens _piSupportedArchitectures (\s a -> s {_piSupportedArchitectures = a}) . _Default . _Coerce

instance FromXML ProcessorInfo where
  parseXML x =
    ProcessorInfo'
      <$> (x .@? "sustainedClockSpeedInGhz")
      <*> ( x .@? "supportedArchitectures" .!@ mempty
              >>= may (parseXMLList "item")
          )

instance Hashable ProcessorInfo

instance NFData ProcessorInfo
