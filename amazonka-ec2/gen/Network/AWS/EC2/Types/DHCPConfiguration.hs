{-# LANGUAGE DeriveDataTypeable #-}
{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE RecordWildCards #-}
{-# OPTIONS_GHC -fno-warn-unused-imports #-}

-- Derived from AWS service descriptions, licensed under Apache 2.0.

-- |
-- Module      : Network.AWS.EC2.Types.DHCPConfiguration
-- Copyright   : (c) 2013-2021 Brendan Hay
-- License     : Mozilla Public License, v. 2.0.
-- Maintainer  : Brendan Hay <brendan.g.hay+amazonka@gmail.com>
-- Stability   : auto-generated
-- Portability : non-portable (GHC extensions)
module Network.AWS.EC2.Types.DHCPConfiguration where

import Network.AWS.EC2.Internal
import Network.AWS.EC2.Types.AttributeValue
import Network.AWS.Lens
import Network.AWS.Prelude

-- | Describes a DHCP configuration option.
--
--
--
-- /See:/ 'dhcpConfiguration' smart constructor.
data DHCPConfiguration = DHCPConfiguration'
  { _dcKey ::
      !(Maybe Text),
    _dcValues ::
      !(Maybe [AttributeValue])
  }
  deriving (Eq, Read, Show, Data, Typeable, Generic)

-- | Creates a value of 'DHCPConfiguration' with the minimum fields required to make a request.
--
-- Use one of the following lenses to modify other fields as desired:
--
-- * 'dcKey' - The name of a DHCP option.
--
-- * 'dcValues' - One or more values for the DHCP option.
dhcpConfiguration ::
  DHCPConfiguration
dhcpConfiguration =
  DHCPConfiguration'
    { _dcKey = Nothing,
      _dcValues = Nothing
    }

-- | The name of a DHCP option.
dcKey :: Lens' DHCPConfiguration (Maybe Text)
dcKey = lens _dcKey (\s a -> s {_dcKey = a})

-- | One or more values for the DHCP option.
dcValues :: Lens' DHCPConfiguration [AttributeValue]
dcValues = lens _dcValues (\s a -> s {_dcValues = a}) . _Default . _Coerce

instance FromXML DHCPConfiguration where
  parseXML x =
    DHCPConfiguration'
      <$> (x .@? "key")
      <*> ( x .@? "valueSet" .!@ mempty
              >>= may (parseXMLList "item")
          )

instance Hashable DHCPConfiguration

instance NFData DHCPConfiguration
