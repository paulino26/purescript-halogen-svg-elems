module Halogen.Svg.Attributes.Color
  ( Color(..)
  , printColor
  ) where

import Prelude
import Data.Maybe (Maybe(..))
import Halogen.Svg.Attributes.Utils (printArray, showWithSpaces)

data Color = RGB Int Int Int
           | RGBA Int Int Int Number
           | Named String
           | NoColor

derive instance eqColor :: Eq Color

instance showColor :: Show Color where
  show = case _ of
    RGB r g b    -> "(RGB "  <> showWithSpaces [r, g, b] <> ")"
    RGBA r g b o -> "(RGBA " <> showWithSpaces [r, g, b] <> " " <> show o <> ")"
    Named s      -> "(Named " <> show s <> ")"
    NoColor -> "NoColor"

printColor :: Color -> String
printColor = case _ of
  RGB r g b    -> "rgb("  <> printArray [r, g, b] <> ")"
  RGBA r g b o -> "rgba(" <> printArray [r, g, b] <> "," <> show o <> ")"
  Named str    -> str
  NoColor      -> "None"
