{-# LANGUAGE DeriveDataTypeable #-}
{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE RecordWildCards #-}
{-# OPTIONS_GHC -fno-warn-unused-imports #-}

-- Derived from AWS service descriptions, licensed under Apache 2.0.

-- |
-- Module      : Network.AWS.EC2.Types.InstanceExportDetails
-- Copyright   : (c) 2013-2021 Brendan Hay
-- License     : Mozilla Public License, v. 2.0.
-- Maintainer  : Brendan Hay <brendan.g.hay+amazonka@gmail.com>
-- Stability   : auto-generated
-- Portability : non-portable (GHC extensions)
module Network.AWS.EC2.Types.InstanceExportDetails where

import Network.AWS.EC2.Internal
import Network.AWS.EC2.Types.ExportEnvironment
import Network.AWS.Lens
import Network.AWS.Prelude

-- | Describes an instance to export.
--
--
--
-- /See:/ 'instanceExportDetails' smart constructor.
data InstanceExportDetails = InstanceExportDetails'
  { _iedInstanceId ::
      !(Maybe Text),
    _iedTargetEnvironment ::
      !(Maybe ExportEnvironment)
  }
  deriving
    ( Eq,
      Read,
      Show,
      Data,
      Typeable,
      Generic
    )

-- | Creates a value of 'InstanceExportDetails' with the minimum fields required to make a request.
--
-- Use one of the following lenses to modify other fields as desired:
--
-- * 'iedInstanceId' - The ID of the resource being exported.
--
-- * 'iedTargetEnvironment' - The target virtualization environment.
instanceExportDetails ::
  InstanceExportDetails
instanceExportDetails =
  InstanceExportDetails'
    { _iedInstanceId = Nothing,
      _iedTargetEnvironment = Nothing
    }

-- | The ID of the resource being exported.
iedInstanceId :: Lens' InstanceExportDetails (Maybe Text)
iedInstanceId = lens _iedInstanceId (\s a -> s {_iedInstanceId = a})

-- | The target virtualization environment.
iedTargetEnvironment :: Lens' InstanceExportDetails (Maybe ExportEnvironment)
iedTargetEnvironment = lens _iedTargetEnvironment (\s a -> s {_iedTargetEnvironment = a})

instance FromXML InstanceExportDetails where
  parseXML x =
    InstanceExportDetails'
      <$> (x .@? "instanceId") <*> (x .@? "targetEnvironment")

instance Hashable InstanceExportDetails

instance NFData InstanceExportDetails
