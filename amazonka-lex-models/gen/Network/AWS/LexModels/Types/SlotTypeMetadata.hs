{-# LANGUAGE DeriveDataTypeable #-}
{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE RecordWildCards #-}
{-# OPTIONS_GHC -fno-warn-unused-imports #-}

-- Derived from AWS service descriptions, licensed under Apache 2.0.

-- |
-- Module      : Network.AWS.LexModels.Types.SlotTypeMetadata
-- Copyright   : (c) 2013-2021 Brendan Hay
-- License     : Mozilla Public License, v. 2.0.
-- Maintainer  : Brendan Hay <brendan.g.hay+amazonka@gmail.com>
-- Stability   : auto-generated
-- Portability : non-portable (GHC extensions)
module Network.AWS.LexModels.Types.SlotTypeMetadata where

import Network.AWS.Lens
import Network.AWS.Prelude

-- | Provides information about a slot type..
--
--
--
-- /See:/ 'slotTypeMetadata' smart constructor.
data SlotTypeMetadata = SlotTypeMetadata'
  { _stmCreatedDate ::
      !(Maybe POSIX),
    _stmLastUpdatedDate :: !(Maybe POSIX),
    _stmVersion :: !(Maybe Text),
    _stmName :: !(Maybe Text),
    _stmDescription :: !(Maybe Text)
  }
  deriving (Eq, Read, Show, Data, Typeable, Generic)

-- | Creates a value of 'SlotTypeMetadata' with the minimum fields required to make a request.
--
-- Use one of the following lenses to modify other fields as desired:
--
-- * 'stmCreatedDate' - The date that the slot type was created.
--
-- * 'stmLastUpdatedDate' - The date that the slot type was updated. When you create a resource, the creation date and last updated date are the same.
--
-- * 'stmVersion' - The version of the slot type.
--
-- * 'stmName' - The name of the slot type.
--
-- * 'stmDescription' - A description of the slot type.
slotTypeMetadata ::
  SlotTypeMetadata
slotTypeMetadata =
  SlotTypeMetadata'
    { _stmCreatedDate = Nothing,
      _stmLastUpdatedDate = Nothing,
      _stmVersion = Nothing,
      _stmName = Nothing,
      _stmDescription = Nothing
    }

-- | The date that the slot type was created.
stmCreatedDate :: Lens' SlotTypeMetadata (Maybe UTCTime)
stmCreatedDate = lens _stmCreatedDate (\s a -> s {_stmCreatedDate = a}) . mapping _Time

-- | The date that the slot type was updated. When you create a resource, the creation date and last updated date are the same.
stmLastUpdatedDate :: Lens' SlotTypeMetadata (Maybe UTCTime)
stmLastUpdatedDate = lens _stmLastUpdatedDate (\s a -> s {_stmLastUpdatedDate = a}) . mapping _Time

-- | The version of the slot type.
stmVersion :: Lens' SlotTypeMetadata (Maybe Text)
stmVersion = lens _stmVersion (\s a -> s {_stmVersion = a})

-- | The name of the slot type.
stmName :: Lens' SlotTypeMetadata (Maybe Text)
stmName = lens _stmName (\s a -> s {_stmName = a})

-- | A description of the slot type.
stmDescription :: Lens' SlotTypeMetadata (Maybe Text)
stmDescription = lens _stmDescription (\s a -> s {_stmDescription = a})

instance FromJSON SlotTypeMetadata where
  parseJSON =
    withObject
      "SlotTypeMetadata"
      ( \x ->
          SlotTypeMetadata'
            <$> (x .:? "createdDate")
            <*> (x .:? "lastUpdatedDate")
            <*> (x .:? "version")
            <*> (x .:? "name")
            <*> (x .:? "description")
      )

instance Hashable SlotTypeMetadata

instance NFData SlotTypeMetadata
