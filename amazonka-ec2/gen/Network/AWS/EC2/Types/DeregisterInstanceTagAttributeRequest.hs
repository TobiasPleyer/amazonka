{-# LANGUAGE DeriveDataTypeable #-}
{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE RecordWildCards #-}
{-# OPTIONS_GHC -fno-warn-unused-imports #-}

-- Derived from AWS service descriptions, licensed under Apache 2.0.

-- |
-- Module      : Network.AWS.EC2.Types.DeregisterInstanceTagAttributeRequest
-- Copyright   : (c) 2013-2021 Brendan Hay
-- License     : Mozilla Public License, v. 2.0.
-- Maintainer  : Brendan Hay <brendan.g.hay+amazonka@gmail.com>
-- Stability   : auto-generated
-- Portability : non-portable (GHC extensions)
module Network.AWS.EC2.Types.DeregisterInstanceTagAttributeRequest where

import Network.AWS.EC2.Internal
import Network.AWS.Lens
import Network.AWS.Prelude

-- | Information about the tag keys to deregister for the current Region. You can either specify individual tag keys or deregister all tag keys in the current Region. You must specify either @IncludeAllTagsOfInstance@ or @InstanceTagKeys@ in the request
--
--
--
-- /See:/ 'deregisterInstanceTagAttributeRequest' smart constructor.
data DeregisterInstanceTagAttributeRequest = DeregisterInstanceTagAttributeRequest'
  { _ditarInstanceTagKeys ::
      !( Maybe
           [Text]
       ),
    _ditarIncludeAllTagsOfInstance ::
      !( Maybe
           Bool
       )
  }
  deriving
    ( Eq,
      Read,
      Show,
      Data,
      Typeable,
      Generic
    )

-- | Creates a value of 'DeregisterInstanceTagAttributeRequest' with the minimum fields required to make a request.
--
-- Use one of the following lenses to modify other fields as desired:
--
-- * 'ditarInstanceTagKeys' - Information about the tag keys to deregister.
--
-- * 'ditarIncludeAllTagsOfInstance' - Indicates whether to deregister all tag keys in the current Region. Specify @false@ to deregister all tag keys.
deregisterInstanceTagAttributeRequest ::
  DeregisterInstanceTagAttributeRequest
deregisterInstanceTagAttributeRequest =
  DeregisterInstanceTagAttributeRequest'
    { _ditarInstanceTagKeys =
        Nothing,
      _ditarIncludeAllTagsOfInstance =
        Nothing
    }

-- | Information about the tag keys to deregister.
ditarInstanceTagKeys :: Lens' DeregisterInstanceTagAttributeRequest [Text]
ditarInstanceTagKeys = lens _ditarInstanceTagKeys (\s a -> s {_ditarInstanceTagKeys = a}) . _Default . _Coerce

-- | Indicates whether to deregister all tag keys in the current Region. Specify @false@ to deregister all tag keys.
ditarIncludeAllTagsOfInstance :: Lens' DeregisterInstanceTagAttributeRequest (Maybe Bool)
ditarIncludeAllTagsOfInstance = lens _ditarIncludeAllTagsOfInstance (\s a -> s {_ditarIncludeAllTagsOfInstance = a})

instance
  Hashable
    DeregisterInstanceTagAttributeRequest

instance NFData DeregisterInstanceTagAttributeRequest

instance
  ToQuery
    DeregisterInstanceTagAttributeRequest
  where
  toQuery DeregisterInstanceTagAttributeRequest' {..} =
    mconcat
      [ toQuery
          ( toQueryList "InstanceTagKey"
              <$> _ditarInstanceTagKeys
          ),
        "IncludeAllTagsOfInstance"
          =: _ditarIncludeAllTagsOfInstance
      ]
