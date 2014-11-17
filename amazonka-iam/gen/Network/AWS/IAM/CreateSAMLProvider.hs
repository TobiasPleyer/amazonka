{-# LANGUAGE DeriveGeneric               #-}
{-# LANGUAGE GeneralizedNewtypeDeriving  #-}
{-# LANGUAGE FlexibleInstances           #-}
{-# LANGUAGE NoImplicitPrelude           #-}
{-# LANGUAGE OverloadedStrings           #-}
{-# LANGUAGE RecordWildCards             #-}
{-# LANGUAGE TypeFamilies                #-}

{-# OPTIONS_GHC -fno-warn-unused-imports #-}

-- Module      : Network.AWS.IAM.CreateSAMLProvider
-- Copyright   : (c) 2013-2014 Brendan Hay <brendan.g.hay@gmail.com>
-- License     : This Source Code Form is subject to the terms of
--               the Mozilla Public License, v. 2.0.
--               A copy of the MPL can be found in the LICENSE file or
--               you can obtain it at http://mozilla.org/MPL/2.0/.
-- Maintainer  : Brendan Hay <brendan.g.hay@gmail.com>
-- Stability   : experimental
-- Portability : non-portable (GHC extensions)

-- | Creates an IAM entity to describe an identity provider (IdP) that supports
-- SAML 2.0. The SAML provider that you create with this operation can be used
-- as a principal in a role's trust policy to establish a trust relationship
-- between AWS and a SAML identity provider. You can create an IAM role that
-- supports Web-based single sign-on (SSO) to the AWS Management Console or
-- one that supports API access to AWS. When you create the SAML provider, you
-- upload an a SAML metadata document that you get from your IdP and that
-- includes the issuer's name, expiration information, and keys that can be
-- used to validate the SAML authentication response (assertions) that are
-- received from the IdP. You must generate the metadata document using the
-- identity management software that is used as your organization's IdP. For
-- more information, see Giving Console Access Using SAML and Creating
-- Temporary Security Credentials for SAML Federation in the Using Temporary
-- Credentials guide.
--
-- <http://docs.aws.amazon.com/IAM/latest/APIReference/API_CreateSAMLProvider.html>
module Network.AWS.IAM.CreateSAMLProvider
    (
    -- * Request
      CreateSAMLProvider
    -- ** Request constructor
    , createSAMLProvider
    -- ** Request lenses
    , csamlpName
    , csamlpSAMLMetadataDocument

    -- * Response
    , CreateSAMLProviderResponse
    -- ** Response constructor
    , createSAMLProviderResponse
    -- ** Response lenses
    , csamlprSAMLProviderArn
    ) where

import Network.AWS.Prelude
import Network.AWS.Request.Query
import Network.AWS.IAM.Types
import qualified GHC.Exts

data CreateSAMLProvider = CreateSAMLProvider
    { _csamlpName                 :: Text
    , _csamlpSAMLMetadataDocument :: Text
    } deriving (Eq, Ord, Show, Generic)

-- | 'CreateSAMLProvider' constructor.
--
-- The fields accessible through corresponding lenses are:
--
-- * 'csamlpName' @::@ 'Text'
--
-- * 'csamlpSAMLMetadataDocument' @::@ 'Text'
--
createSAMLProvider :: Text -- ^ 'csamlpSAMLMetadataDocument'
                   -> Text -- ^ 'csamlpName'
                   -> CreateSAMLProvider
createSAMLProvider p1 p2 = CreateSAMLProvider
    { _csamlpSAMLMetadataDocument = p1
    , _csamlpName                 = p2
    }

-- | The name of the provider to create.
csamlpName :: Lens' CreateSAMLProvider Text
csamlpName = lens _csamlpName (\s a -> s { _csamlpName = a })

-- | An XML document generated by an identity provider (IdP) that supports
-- SAML 2.0. The document includes the issuer's name, expiration
-- information, and keys that can be used to validate the SAML
-- authentication response (assertions) that are received from the IdP. You
-- must generate the metadata document using the identity management
-- software that is used as your organization's IdP. For more information,
-- see Creating Temporary Security Credentials for SAML Federation in the
-- Using Temporary Security Credentials guide.
csamlpSAMLMetadataDocument :: Lens' CreateSAMLProvider Text
csamlpSAMLMetadataDocument =
    lens _csamlpSAMLMetadataDocument
        (\s a -> s { _csamlpSAMLMetadataDocument = a })

newtype CreateSAMLProviderResponse = CreateSAMLProviderResponse
    { _csamlprSAMLProviderArn :: Maybe Text
    } deriving (Eq, Ord, Show, Generic, Monoid)

-- | 'CreateSAMLProviderResponse' constructor.
--
-- The fields accessible through corresponding lenses are:
--
-- * 'csamlprSAMLProviderArn' @::@ 'Maybe' 'Text'
--
createSAMLProviderResponse :: CreateSAMLProviderResponse
createSAMLProviderResponse = CreateSAMLProviderResponse
    { _csamlprSAMLProviderArn = Nothing
    }

-- | The Amazon Resource Name (ARN) of the SAML provider.
csamlprSAMLProviderArn :: Lens' CreateSAMLProviderResponse (Maybe Text)
csamlprSAMLProviderArn =
    lens _csamlprSAMLProviderArn (\s a -> s { _csamlprSAMLProviderArn = a })

instance ToPath CreateSAMLProvider where
    toPath = const "/"

instance ToQuery CreateSAMLProvider

instance ToHeaders CreateSAMLProvider

instance AWSRequest CreateSAMLProvider where
    type Sv CreateSAMLProvider = IAM
    type Rs CreateSAMLProvider = CreateSAMLProviderResponse

    request  = post "CreateSAMLProvider"
    response = xmlResponse

instance FromXML CreateSAMLProviderResponse where
    fromXMLOptions = xmlOptions
    fromXMLRoot    = fromRoot "CreateSAMLProviderResponse"
