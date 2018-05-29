module Page.Home exposing (view)

import Css exposing (..)
import Css.Foreign exposing (descendants)
import Html.Styled exposing (Html, a, div, img, text)
import Html.Styled.Attributes exposing (css, src, href)
import Constants exposing (font, theme)


type alias ImageSrc =
    String


type alias Href =
    String


view : Html msg
view =
    grid
        [ name, profile, links ]


grid : List (Html msg) -> Html msg
grid children =
    div
        [ css
            [ height (vh 100)
            , width (vw 100)
            , property "display" "grid"
            , property "grid-template-columns" "15vw auto 15vw"
            , property "grid-template-rows" "1fr 15vh 2em 35vh 2em 10vh 1fr"
            ]
        ]
        children


name : Html msg
name =
    div
        [ css
            [ displayFlex
            , property "grid-column" "2 / span 1"
            , property "grid-row" "2 / span 1"
            , flexDirection column
            , justifyContent spaceAround
            ]
        ]
        [ div
            [ css
                [ font.heading ]
            ]
            [ text "Michael Wang | 王子元" ]
        ]


profile : Html msg
profile =
    div
        [ css
            [ height (pct 100)
            , width (pct 100)
            , displayFlex
            , alignItems center
            , property "grid-column" "2 / span 1"
            , property "grid-row" "4 / span 1"
            ]
        ]
        [ img
            [ css
                [ maxHeight (pct 100)
                , width auto
                , borderRadius (pct 50)
                , border3 (px 2) solid theme.textPrimary
                ]
            , src "public/images/profile.jpg"
            ]
            []
        , div
            [ css
                [ font.text
                , marginLeft (em 4)
                ]
            ]
            [ text blurb ]
        ]


blurb : String
blurb =
    """
    Software engineer at Uber trying to help make transportation as reliable as running water ™.
    I'm passionate about AI, delicious food and training to become a professional LoL player.
    """


links : Html msg
links =
    div
        [ css
            [ displayFlex
            , justifyContent spaceAround
            , alignItems center
            , property "grid-column" "2 / span 1"
            , property "grid-row" "6 / span 1"
            ]
        ]
        [ link "public/icons/github.png" "https://github.com/mz-wang" "GitHub"
        , link "public/icons/linkedin.png" "https://www.linkedin.com/in/ziyuanmichaelwang" "LinkedIn"
        , link "public/icons/opgg.png" "https://na.op.gg/summoner/userName=argv" "OP.GG"
        ]


link : ImageSrc -> Href -> String -> Html msg
link icon dest description =
    a
        [ css
            [ displayFlex
            , justifyContent flexStart
            , alignItems center
            , font.text
            , hover
                [ color theme.accent
                , cursor pointer
                , descendants
                    [ Css.Foreign.img
                        [ border3 (px 2) solid theme.accent ]
                    ]
                ]
            ]
        , href dest
        , Html.Styled.Attributes.target "_blank"
        ]
        [ img
            [ css
                [ maxHeight (px 48)
                , width auto
                , backgroundColor theme.textPrimary
                , borderRadius (pct 50)
                , border3 (px 2) solid theme.textPrimary
                , marginRight (em 0.5)
                ]
            , src icon
            ]
            []
        , text description
        ]
