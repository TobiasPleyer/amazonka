{-# LANGUAGE DeriveDataTypeable #-}
{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE TypeFamilies #-}
{-# OPTIONS_GHC -fno-warn-unused-binds #-}
{-# OPTIONS_GHC -fno-warn-unused-imports #-}
{-# OPTIONS_GHC -fno-warn-unused-matches #-}

-- Derived from AWS service descriptions, licensed under Apache 2.0.

-- |
-- Module      : Network.AWS.Cloud9.ListTagsForResource
-- Copyright   : (c) 2013-2021 Brendan Hay
-- License     : Mozilla Public License, v. 2.0.
-- Maintainer  : Brendan Hay <brendan.g.hay+amazonka@gmail.com>
-- Stability   : auto-generated
-- Portability : non-portable (GHC extensions)
--
-- Gets a list of the tags associated with an AWS Cloud9 development environment.
module Network.AWS.Cloud9.ListTagsForResource
  ( -- * Creating a Request
    listTagsForResource,
    ListTagsForResource,

    -- * Request Lenses
    ltfrResourceARN,

    -- * Destructuring the Response
    listTagsForResourceResponse,
    ListTagsForResourceResponse,

    -- * Response Lenses
    ltfrrrsTags,
    ltfrrrsResponseStatus,
  )
where

import Network.AWS.Cloud9.Types
import Network.AWS.Lens
import Network.AWS.Prelude
import Network.AWS.Request
import Network.AWS.Response

-- | /See:/ 'listTagsForResource' smart constructor.
newtype ListTagsForResource = ListTagsForResource'
  { _ltfrResourceARN ::
      Text
  }
  deriving
    ( Eq,
      Read,
      Show,
      Data,
      Typeable,
      Generic
    )

-- | Creates a value of 'ListTagsForResource' with the minimum fields required to make a request.
--
-- Use one of the following lenses to modify other fields as desired:
--
-- * 'ltfrResourceARN' - The Amazon Resource Name (ARN) of the AWS Cloud9 development environment to get the tags for.
listTagsForResource ::
  -- | 'ltfrResourceARN'
  Text ->
  ListTagsForResource
listTagsForResource pResourceARN_ =
  ListTagsForResource'
    { _ltfrResourceARN =
        pResourceARN_
    }

-- | The Amazon Resource Name (ARN) of the AWS Cloud9 development environment to get the tags for.
ltfrResourceARN :: Lens' ListTagsForResource Text
ltfrResourceARN = lens _ltfrResourceARN (\s a -> s {_ltfrResourceARN = a})

instance AWSRequest ListTagsForResource where
  type
    Rs ListTagsForResource =
      ListTagsForResourceResponse
  request = postJSON cloud9
  response =
    receiveJSON
      ( \s h x ->
          ListTagsForResourceResponse'
            <$> (x .?> "Tags" .!@ mempty) <*> (pure (fromEnum s))
      )

instance Hashable ListTagsForResource

instance NFData ListTagsForResource

instance ToHeaders ListTagsForResource where
  toHeaders =
    const
      ( mconcat
          [ "X-Amz-Target"
              =# ( "AWSCloud9WorkspaceManagementService.ListTagsForResource" ::
                     ByteString
                 ),
            "Content-Type"
              =# ("application/x-amz-json-1.1" :: ByteString)
          ]
      )

instance ToJSON ListTagsForResource where
  toJSON ListTagsForResource' {..} =
    object
      ( catMaybes
          [Just ("ResourceARN" .= _ltfrResourceARN)]
      )

instance ToPath ListTagsForResource where
  toPath = const "/"

instance ToQuery ListTagsForResource where
  toQuery = const mempty

-- | /See:/ 'listTagsForResourceResponse' smart constructor.
data ListTagsForResourceResponse = ListTagsForResourceResponse'
  { _ltfrrrsTags ::
      !(Maybe [Tag]),
    _ltfrrrsResponseStatus ::
      !Int
  }
  deriving
    ( Eq,
      Read,
      Show,
      Data,
      Typeable,
      Generic
    )

-- | Creates a value of 'ListTagsForResourceResponse' with the minimum fields required to make a request.
--
-- Use one of the following lenses to modify other fields as desired:
--
-- * 'ltfrrrsTags' - The list of tags associated with the AWS Cloud9 development environment.
--
-- * 'ltfrrrsResponseStatus' - -- | The response status code.
listTagsForResourceResponse ::
  -- | 'ltfrrrsResponseStatus'
  Int ->
  ListTagsForResourceResponse
listTagsForResourceResponse pResponseStatus_ =
  ListTagsForResourceResponse'
    { _ltfrrrsTags =
        Nothing,
      _ltfrrrsResponseStatus = pResponseStatus_
    }

-- | The list of tags associated with the AWS Cloud9 development environment.
ltfrrrsTags :: Lens' ListTagsForResourceResponse [Tag]
ltfrrrsTags = lens _ltfrrrsTags (\s a -> s {_ltfrrrsTags = a}) . _Default . _Coerce

-- | -- | The response status code.
ltfrrrsResponseStatus :: Lens' ListTagsForResourceResponse Int
ltfrrrsResponseStatus = lens _ltfrrrsResponseStatus (\s a -> s {_ltfrrrsResponseStatus = a})

instance NFData ListTagsForResourceResponse
