{-
Welcome to a Spago project!
You can edit this file as you like.
-}
{ name = "halogen-svg"
, dependencies =
  [ "aff"
  , "effect"
  , "foldable-traversable"
  , "halogen"
  , "halogen-hooks"
  , "maybe"
  , "newtype"
  , "prelude"
  , "psci-support"
  , "safe-coerce"
  , "strings"
  , "typelevel-prelude"
  , "unsafe-coerce"
  , "web-dom"
  , "web-uievents"
  ]
, packages = ./packages.dhall
, sources = [ "src/**/*.purs", "test/**/*.purs" ]
}
