{-# LANGUAGE DeriveDataTypeable #-}
{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE RecordWildCards #-}
{-# OPTIONS_GHC -fno-warn-unused-imports #-}

-- Derived from AWS service descriptions, licensed under Apache 2.0.

-- |
-- Module      : Network.AWS.EC2.Types.FpgaImageState
-- Copyright   : (c) 2013-2021 Brendan Hay
-- License     : Mozilla Public License, v. 2.0.
-- Maintainer  : Brendan Hay <brendan.g.hay+amazonka@gmail.com>
-- Stability   : auto-generated
-- Portability : non-portable (GHC extensions)
module Network.AWS.EC2.Types.FpgaImageState where

import Network.AWS.EC2.Internal
import Network.AWS.EC2.Types.FpgaImageStateCode
import Network.AWS.Lens
import Network.AWS.Prelude

-- | Describes the state of the bitstream generation process for an Amazon FPGA image (AFI).
--
--
--
-- /See:/ 'fpgaImageState' smart constructor.
data FpgaImageState = FpgaImageState'
  { _fisMessage ::
      !(Maybe Text),
    _fisCode :: !(Maybe FpgaImageStateCode)
  }
  deriving (Eq, Read, Show, Data, Typeable, Generic)

-- | Creates a value of 'FpgaImageState' with the minimum fields required to make a request.
--
-- Use one of the following lenses to modify other fields as desired:
--
-- * 'fisMessage' - If the state is @failed@ , this is the error message.
--
-- * 'fisCode' - The state. The following are the possible values:     * @pending@ - AFI bitstream generation is in progress.     * @available@ - The AFI is available for use.     * @failed@ - AFI bitstream generation failed.     * @unavailable@ - The AFI is no longer available for use.
fpgaImageState ::
  FpgaImageState
fpgaImageState =
  FpgaImageState'
    { _fisMessage = Nothing,
      _fisCode = Nothing
    }

-- | If the state is @failed@ , this is the error message.
fisMessage :: Lens' FpgaImageState (Maybe Text)
fisMessage = lens _fisMessage (\s a -> s {_fisMessage = a})

-- | The state. The following are the possible values:     * @pending@ - AFI bitstream generation is in progress.     * @available@ - The AFI is available for use.     * @failed@ - AFI bitstream generation failed.     * @unavailable@ - The AFI is no longer available for use.
fisCode :: Lens' FpgaImageState (Maybe FpgaImageStateCode)
fisCode = lens _fisCode (\s a -> s {_fisCode = a})

instance FromXML FpgaImageState where
  parseXML x =
    FpgaImageState'
      <$> (x .@? "message") <*> (x .@? "code")

instance Hashable FpgaImageState

instance NFData FpgaImageState
