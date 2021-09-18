module Test.Main where

import Prelude

import Data.Tuple.Nested ((/\))
import Effect (Effect)
import Effect.Aff (Aff, launchAff_)
import Halogen (ClassName(..), Component)
import Halogen.Aff (awaitBody)
import Halogen.HTML as HH
import Halogen.HTML.Events as HE
import Halogen.HTML.Properties as HP
import Halogen.Hooks as Hooks
import Halogen.Svg.Attributes as SA
import Halogen.Svg.Elements as SE
import Halogen.VDom.Driver (runUI)

main :: Effect Unit
main = launchAff_ do
  body <- awaitBody
  void $ runUI rootComp 0 body

type Input = Int
type Output = Int
data Query a = Query a

rootComp :: Component Query Input Output Aff
rootComp = Hooks.component \_ input -> Hooks.do
  count /\ countId <- Hooks.useState input

  Hooks.pure do
    HH.div_
      [ HH.button
          [ HE.onClick \_ -> Hooks.modify_ countId (_ + 1)
          , HP.class_ $ ClassName "someClass"
          ]
          [ HH.text $ show count ]
      , SE.svg
          [ SA.viewBox 0.0 0.0 100.0 100.0 ]
          [ SE.circle
              [ SA.r 10.0 ]
          ]
      ]