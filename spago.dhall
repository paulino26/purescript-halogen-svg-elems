{-
Welcome to a Spago project!
You can edit this file as you like.
-}
{ name = "halogen-svg"
, dependencies =
  [ "aff"
  , "effect"
  , "halogen"
  , "halogen-hooks"
  , "halogen-vdom"
  , "maybe"
  , "newtype"
  , "prelude"
  , "psci-support"
  , "safe-coerce"
  , "strings"
  , "tuples"
  , "typelevel-prelude"
  , "unsafe-coerce"
  , "web-uievents"
  ]
, packages = ./packages.dhall
, sources = [ "src/**/*.purs", "test/**/*.purs" ]
}
