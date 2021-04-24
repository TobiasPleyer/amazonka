{-# LANGUAGE DeriveDataTypeable #-}
{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE RecordWildCards #-}
{-# OPTIONS_GHC -fno-warn-unused-imports #-}

-- Derived from AWS service descriptions, licensed under Apache 2.0.

-- |
-- Module      : Network.AWS.EC2.Types.VPCCidrBlockState
-- Copyright   : (c) 2013-2021 Brendan Hay
-- License     : Mozilla Public License, v. 2.0.
-- Maintainer  : Brendan Hay <brendan.g.hay+amazonka@gmail.com>
-- Stability   : auto-generated
-- Portability : non-portable (GHC extensions)
module Network.AWS.EC2.Types.VPCCidrBlockState where

import Network.AWS.EC2.Internal
import Network.AWS.EC2.Types.VPCCidrBlockStateCode
import Network.AWS.Lens
import Network.AWS.Prelude

-- | Describes the state of a CIDR block.
--
--
--
-- /See:/ 'vpcCidrBlockState' smart constructor.
data VPCCidrBlockState = VPCCidrBlockState'
  { _vcbsStatusMessage ::
      !(Maybe Text),
    _vcbsState ::
      !(Maybe VPCCidrBlockStateCode)
  }
  deriving (Eq, Read, Show, Data, Typeable, Generic)

-- | Creates a value of 'VPCCidrBlockState' with the minimum fields required to make a request.
--
-- Use one of the following lenses to modify other fields as desired:
--
-- * 'vcbsStatusMessage' - A message about the status of the CIDR block, if applicable.
--
-- * 'vcbsState' - The state of the CIDR block.
vpcCidrBlockState ::
  VPCCidrBlockState
vpcCidrBlockState =
  VPCCidrBlockState'
    { _vcbsStatusMessage = Nothing,
      _vcbsState = Nothing
    }

-- | A message about the status of the CIDR block, if applicable.
vcbsStatusMessage :: Lens' VPCCidrBlockState (Maybe Text)
vcbsStatusMessage = lens _vcbsStatusMessage (\s a -> s {_vcbsStatusMessage = a})

-- | The state of the CIDR block.
vcbsState :: Lens' VPCCidrBlockState (Maybe VPCCidrBlockStateCode)
vcbsState = lens _vcbsState (\s a -> s {_vcbsState = a})

instance FromXML VPCCidrBlockState where
  parseXML x =
    VPCCidrBlockState'
      <$> (x .@? "statusMessage") <*> (x .@? "state")

instance Hashable VPCCidrBlockState

instance NFData VPCCidrBlockState
