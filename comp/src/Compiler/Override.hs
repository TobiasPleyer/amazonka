{-# LANGUAGE FlexibleContexts  #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE RecordWildCards   #-}
{-# LANGUAGE TupleSections     #-}

-- Module      : Compiler.Override
-- Copyright   : (c) 2013-2015 Brendan Hay <brendan.g.hay@gmail.com>
-- License     : This Source Code Form is subject to the terms of
--               the Mozilla Public License, v. 2.0.
--               A copy of the MPL can be found in the LICENSE file or
--               you can obtain it at http://mozilla.org/MPL/2.0/.
-- Maintainer  : Brendan Hay <brendan.g.hay@gmail.com>
-- Stability   : experimental
-- Portability : non-portable (GHC extensions)

module Compiler.Override
    ( override
    ) where

import           Compiler.Types
import           Control.Error
import           Control.Lens
import           Data.Bifunctor
import qualified Data.HashMap.Strict as Map
import qualified Data.HashSet        as Set
import           Data.Monoid

-- | Apply the override rules to shapes and their respective fields.
override :: Functor f
         => Map Id Override
         -> Service f (RefF a) (ShapeF ())
         -> Service f (RefF a) (ShapeF ())
override ovs svc@Service{..} = svc
    & operations . each %~ operation
    & shapes            %~ Map.foldlWithKey' shape mempty
  where
    operation :: Functor f
              => Operation f (RefF a)
              -> Operation f (RefF a)
    operation o = o
        { _opInput  = ref <$> _opInput  o
        , _opOutput = ref <$> _opOutput o
        }
      where
        ref :: RefF a -> RefF a
        ref r
            | Just x <- ptr renamed  = r & refShape .~ x
            | Just x <- ptr replaced = r & refShape .~ x ^. replaceName
            | otherwise              = r
          where
            ptr = Map.lookup (r ^. refShape)

    shape :: Map Id (ShapeF ()) -> Id -> ShapeF () -> Map Id (ShapeF ())
    shape acc n s
        | Just x <- Map.lookup n renamed  = shape acc x s
        | Just x <- Map.lookup n replaced = uncurry Map.insert (pointer x) acc
        | otherwise                       = Map.insert n (rules s) acc
      where
        Override{..} = fromMaybe defaultOverride (Map.lookup n ovs)

        pointer :: Replace -> (Id, ShapeF ())
        pointer r = (r ^. replaceName, Ptr (s ^. info) (r ^. replaceDeriving))

        rules :: ShapeF a -> ShapeF a
        rules = require . optional . rename . retype . prefix

        require, optional :: ShapeF a -> ShapeF a
        require  = _Struct . required %~ (<> _requiredFields)
        optional = _Struct . required %~ (`Set.difference` _optionalFields)

        rename :: ShapeF a -> ShapeF a
        rename = _Struct .members .each ._1 %~ f
          where
            f k = fromMaybe k (Map.lookup k _renamedFields)

        retype :: ShapeF a -> ShapeF a
        retype = references %~ f _replaceName replaced . f id renamed
          where
            f g m v = maybe v (flip (set refShape) v . g) $
                Map.lookup (v ^. refShape) m

        prefix :: ShapeF a -> ShapeF a
        prefix
            | Just p <- _enumPrefix = _Enum._2.kvTraversal %~ first (prependId p)
            | otherwise             = id

    renamed :: Map Id Id
    renamed = vMapMaybe _renamedTo ovs

    replaced :: Map Id Replace
    replaced = vMapMaybe _replacedBy ovs
