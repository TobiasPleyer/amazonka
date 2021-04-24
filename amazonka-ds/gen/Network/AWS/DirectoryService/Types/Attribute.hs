{-# LANGUAGE DeriveDataTypeable #-}
{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE RecordWildCards #-}
{-# OPTIONS_GHC -fno-warn-unused-imports #-}

-- Derived from AWS service descriptions, licensed under Apache 2.0.

-- |
-- Module      : Network.AWS.DirectoryService.Types.Attribute
-- Copyright   : (c) 2013-2021 Brendan Hay
-- License     : Mozilla Public License, v. 2.0.
-- Maintainer  : Brendan Hay <brendan.g.hay+amazonka@gmail.com>
-- Stability   : auto-generated
-- Portability : non-portable (GHC extensions)
module Network.AWS.DirectoryService.Types.Attribute where

import Network.AWS.Lens
import Network.AWS.Prelude

-- | Represents a named directory attribute.
--
--
--
-- /See:/ 'attribute' smart constructor.
data Attribute = Attribute'
  { _aName :: !(Maybe Text),
    _aValue :: !(Maybe Text)
  }
  deriving (Eq, Read, Show, Data, Typeable, Generic)

-- | Creates a value of 'Attribute' with the minimum fields required to make a request.
--
-- Use one of the following lenses to modify other fields as desired:
--
-- * 'aName' - The name of the attribute.
--
-- * 'aValue' - The value of the attribute.
attribute ::
  Attribute
attribute =
  Attribute' {_aName = Nothing, _aValue = Nothing}

-- | The name of the attribute.
aName :: Lens' Attribute (Maybe Text)
aName = lens _aName (\s a -> s {_aName = a})

-- | The value of the attribute.
aValue :: Lens' Attribute (Maybe Text)
aValue = lens _aValue (\s a -> s {_aValue = a})

instance FromJSON Attribute where
  parseJSON =
    withObject
      "Attribute"
      ( \x ->
          Attribute' <$> (x .:? "Name") <*> (x .:? "Value")
      )

instance Hashable Attribute

instance NFData Attribute

instance ToJSON Attribute where
  toJSON Attribute' {..} =
    object
      ( catMaybes
          [("Name" .=) <$> _aName, ("Value" .=) <$> _aValue]
      )
