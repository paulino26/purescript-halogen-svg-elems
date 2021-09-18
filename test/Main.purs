module Test.Main where

import Prelude

import Data.Foldable (for_)
import Effect (Effect)
import Effect.Aff (Aff, launchAff_)
import Halogen (Component)
import Halogen.Aff (selectElement)
import Halogen.HTML.Properties as HP
import Halogen.Hooks as Hooks
import Halogen.Svg.Attributes (Color(..))
import Halogen.Svg.Attributes as SA
import Halogen.Svg.Elements as SE
import Halogen.VDom.Driver (runUI)
import Web.DOM.ParentNode (QuerySelector(..))

main :: Effect Unit
main = launchAff_ do
  mbDivElem <- selectElement $ QuerySelector "#halogen"
  for_ mbDivElem \divElem -> do
    void $ runUI rootComp 0 divElem

type Input = Int
type Output = Int
data Query a = Query a

rootComp :: Component Query Input Output Aff
rootComp = Hooks.component \_ _ -> Hooks.do
  Hooks.pure do
    SE.svg
      [ SA.viewBox 0.0 0.0 30.0 10.0 ]
      -- https://developer.mozilla.org/en-US/docs/Web/SVG/Element/use
      [ SE.circle
          [ HP.id "circleId"
          , SA.cx 5.0
          , SA.cy 5.0
          , SA.r 4.0
          , SA.stroke $ Named "blue"
          ]
      , SE.use
          [ SA.href "#circleId"
          , SA.x 10.0
          , SA.fill $ Named "blue"
          ]
      , SE.use
          [ SA.href "#circleId"
          , SA.x 20.0
          , SA.fill $ Named "white"
          , SA.stroke $ Named "red"
          ]
      ]
