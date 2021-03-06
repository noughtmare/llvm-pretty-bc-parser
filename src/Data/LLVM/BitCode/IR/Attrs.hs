module Data.LLVM.BitCode.IR.Attrs where

import Data.LLVM.BitCode.Bitstream
import Data.LLVM.BitCode.Match
import Data.LLVM.BitCode.Record
import Text.LLVM.AST

import Control.Monad ((<=<),mzero)


-- | Matching function for parsing the linkage types out of fields.
linkage :: Match Field Linkage
linkage  = choose <=< numeric
  where
  choose :: Match Int Linkage
  choose n = case n of
    0  -> return External
    1  -> return Weak
    2  -> return Appending
    3  -> return Internal
    4  -> return Linkonce
    5  -> return DLLImport
    6  -> return DLLExport
    7  -> return ExternWeak
    8  -> return Common
    9  -> return Private
    10 -> return WeakODR
    11 -> return LinkonceODR
    12 -> return AvailableExternally
    13 -> return LinkerPrivate
    14 -> return LinkerPrivateWeak
    15 -> return LinkerPrivateWeakDefAuto
    16 -> return Weak
    17 -> return WeakODR
    18 -> return Linkonce
    19 -> return LinkonceODR
    _  -> mzero

visibility :: Match Field Visibility
visibility = choose <=< numeric
  where
  choose :: Match Int Visibility
  choose n = case n of
    0 -> return DefaultVisibility
    1 -> return HiddenVisibility
    2 -> return ProtectedVisibility
    _ -> mzero
