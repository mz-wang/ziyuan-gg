module Component.App exposing (view)

import Css exposing (..)
import Html.Styled exposing (Html, div)
import Html.Styled.Attributes exposing (css)
import Constants exposing (theme, font)


view : List (Html msg) -> Html msg
view children =
    div
        [ css
            [ backgroundColor theme.primary
            , font.text
            , minHeight (vh 100)
            , minWidth (vw 100)
            ]
        ]
        children
