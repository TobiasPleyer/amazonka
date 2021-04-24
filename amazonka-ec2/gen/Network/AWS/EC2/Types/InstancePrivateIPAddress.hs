{-# LANGUAGE DeriveDataTypeable #-}
{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE RecordWildCards #-}
{-# OPTIONS_GHC -fno-warn-unused-imports #-}

-- Derived from AWS service descriptions, licensed under Apache 2.0.

-- |
-- Module      : Network.AWS.EC2.Types.InstancePrivateIPAddress
-- Copyright   : (c) 2013-2021 Brendan Hay
-- License     : Mozilla Public License, v. 2.0.
-- Maintainer  : Brendan Hay <brendan.g.hay+amazonka@gmail.com>
-- Stability   : auto-generated
-- Portability : non-portable (GHC extensions)
module Network.AWS.EC2.Types.InstancePrivateIPAddress where

import Network.AWS.EC2.Internal
import Network.AWS.EC2.Types.InstanceNetworkInterfaceAssociation
import Network.AWS.Lens
import Network.AWS.Prelude

-- | Describes a private IPv4 address.
--
--
--
-- /See:/ 'instancePrivateIPAddress' smart constructor.
data InstancePrivateIPAddress = InstancePrivateIPAddress'
  { _ipiaPrimary ::
      !(Maybe Bool),
    _ipiaAssociation ::
      !( Maybe
           InstanceNetworkInterfaceAssociation
       ),
    _ipiaPrivateDNSName ::
      !(Maybe Text),
    _ipiaPrivateIPAddress ::
      !(Maybe Text)
  }
  deriving
    ( Eq,
      Read,
      Show,
      Data,
      Typeable,
      Generic
    )

-- | Creates a value of 'InstancePrivateIPAddress' with the minimum fields required to make a request.
--
-- Use one of the following lenses to modify other fields as desired:
--
-- * 'ipiaPrimary' - Indicates whether this IPv4 address is the primary private IP address of the network interface.
--
-- * 'ipiaAssociation' - The association information for an Elastic IP address for the network interface.
--
-- * 'ipiaPrivateDNSName' - The private IPv4 DNS name.
--
-- * 'ipiaPrivateIPAddress' - The private IPv4 address of the network interface.
instancePrivateIPAddress ::
  InstancePrivateIPAddress
instancePrivateIPAddress =
  InstancePrivateIPAddress'
    { _ipiaPrimary = Nothing,
      _ipiaAssociation = Nothing,
      _ipiaPrivateDNSName = Nothing,
      _ipiaPrivateIPAddress = Nothing
    }

-- | Indicates whether this IPv4 address is the primary private IP address of the network interface.
ipiaPrimary :: Lens' InstancePrivateIPAddress (Maybe Bool)
ipiaPrimary = lens _ipiaPrimary (\s a -> s {_ipiaPrimary = a})

-- | The association information for an Elastic IP address for the network interface.
ipiaAssociation :: Lens' InstancePrivateIPAddress (Maybe InstanceNetworkInterfaceAssociation)
ipiaAssociation = lens _ipiaAssociation (\s a -> s {_ipiaAssociation = a})

-- | The private IPv4 DNS name.
ipiaPrivateDNSName :: Lens' InstancePrivateIPAddress (Maybe Text)
ipiaPrivateDNSName = lens _ipiaPrivateDNSName (\s a -> s {_ipiaPrivateDNSName = a})

-- | The private IPv4 address of the network interface.
ipiaPrivateIPAddress :: Lens' InstancePrivateIPAddress (Maybe Text)
ipiaPrivateIPAddress = lens _ipiaPrivateIPAddress (\s a -> s {_ipiaPrivateIPAddress = a})

instance FromXML InstancePrivateIPAddress where
  parseXML x =
    InstancePrivateIPAddress'
      <$> (x .@? "primary")
      <*> (x .@? "association")
      <*> (x .@? "privateDnsName")
      <*> (x .@? "privateIpAddress")

instance Hashable InstancePrivateIPAddress

instance NFData InstancePrivateIPAddress
