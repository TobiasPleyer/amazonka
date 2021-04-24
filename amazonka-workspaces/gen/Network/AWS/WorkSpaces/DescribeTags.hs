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
-- Module      : Network.AWS.WorkSpaces.DescribeTags
-- Copyright   : (c) 2013-2021 Brendan Hay
-- License     : Mozilla Public License, v. 2.0.
-- Maintainer  : Brendan Hay <brendan.g.hay+amazonka@gmail.com>
-- Stability   : auto-generated
-- Portability : non-portable (GHC extensions)
--
-- Describes the specified tags for the specified WorkSpaces resource.
module Network.AWS.WorkSpaces.DescribeTags
  ( -- * Creating a Request
    describeTags,
    DescribeTags,

    -- * Request Lenses
    dtResourceId,

    -- * Destructuring the Response
    describeTagsResponse,
    DescribeTagsResponse,

    -- * Response Lenses
    dtrrsTagList,
    dtrrsResponseStatus,
  )
where

import Network.AWS.Lens
import Network.AWS.Prelude
import Network.AWS.Request
import Network.AWS.Response
import Network.AWS.WorkSpaces.Types

-- | /See:/ 'describeTags' smart constructor.
newtype DescribeTags = DescribeTags'
  { _dtResourceId ::
      Text
  }
  deriving (Eq, Read, Show, Data, Typeable, Generic)

-- | Creates a value of 'DescribeTags' with the minimum fields required to make a request.
--
-- Use one of the following lenses to modify other fields as desired:
--
-- * 'dtResourceId' - The identifier of the WorkSpaces resource. The supported resource types are WorkSpaces, registered directories, images, custom bundles, IP access control groups, and connection aliases.
describeTags ::
  -- | 'dtResourceId'
  Text ->
  DescribeTags
describeTags pResourceId_ =
  DescribeTags' {_dtResourceId = pResourceId_}

-- | The identifier of the WorkSpaces resource. The supported resource types are WorkSpaces, registered directories, images, custom bundles, IP access control groups, and connection aliases.
dtResourceId :: Lens' DescribeTags Text
dtResourceId = lens _dtResourceId (\s a -> s {_dtResourceId = a})

instance AWSRequest DescribeTags where
  type Rs DescribeTags = DescribeTagsResponse
  request = postJSON workSpaces
  response =
    receiveJSON
      ( \s h x ->
          DescribeTagsResponse'
            <$> (x .?> "TagList" .!@ mempty) <*> (pure (fromEnum s))
      )

instance Hashable DescribeTags

instance NFData DescribeTags

instance ToHeaders DescribeTags where
  toHeaders =
    const
      ( mconcat
          [ "X-Amz-Target"
              =# ("WorkspacesService.DescribeTags" :: ByteString),
            "Content-Type"
              =# ("application/x-amz-json-1.1" :: ByteString)
          ]
      )

instance ToJSON DescribeTags where
  toJSON DescribeTags' {..} =
    object
      (catMaybes [Just ("ResourceId" .= _dtResourceId)])

instance ToPath DescribeTags where
  toPath = const "/"

instance ToQuery DescribeTags where
  toQuery = const mempty

-- | /See:/ 'describeTagsResponse' smart constructor.
data DescribeTagsResponse = DescribeTagsResponse'
  { _dtrrsTagList ::
      !(Maybe [Tag]),
    _dtrrsResponseStatus :: !Int
  }
  deriving (Eq, Read, Show, Data, Typeable, Generic)

-- | Creates a value of 'DescribeTagsResponse' with the minimum fields required to make a request.
--
-- Use one of the following lenses to modify other fields as desired:
--
-- * 'dtrrsTagList' - The tags.
--
-- * 'dtrrsResponseStatus' - -- | The response status code.
describeTagsResponse ::
  -- | 'dtrrsResponseStatus'
  Int ->
  DescribeTagsResponse
describeTagsResponse pResponseStatus_ =
  DescribeTagsResponse'
    { _dtrrsTagList = Nothing,
      _dtrrsResponseStatus = pResponseStatus_
    }

-- | The tags.
dtrrsTagList :: Lens' DescribeTagsResponse [Tag]
dtrrsTagList = lens _dtrrsTagList (\s a -> s {_dtrrsTagList = a}) . _Default . _Coerce

-- | -- | The response status code.
dtrrsResponseStatus :: Lens' DescribeTagsResponse Int
dtrrsResponseStatus = lens _dtrrsResponseStatus (\s a -> s {_dtrrsResponseStatus = a})

instance NFData DescribeTagsResponse
