module Constants exposing (theme, font)

import Css exposing (..)


theme :
    { accent : Color
    , primary : Color
    , secondary : Color
    , textPrimary : Color
    , textSecondary : Color
    }
theme =
    { primary = hex "#362c36"
    , secondary = hex "#4d4c59"
    , textPrimary = hex "#f7f6f0"
    , textSecondary = hex "#71777d"
    , accent = hex "#a7cbd5"
    }


font :
    { heading : Style
    , subtitle : Style
    , text : Style
    }
font =
    { heading =
        batch
            [ fontFamilies [ "Raleway", "sans-serif" ]
            , fontSize (em 4)
            , fontWeight normal
            , color theme.textPrimary
            ]
    , subtitle =
        batch
            [ fontFamilies [ "Raleway", "sans-serif" ]
            , fontSize (em 1.5)
            , fontWeight normal
            , color theme.textSecondary
            ]
    , text =
        batch
            [ fontFamilies [ "Open Sans", "sans-serif" ]
            , fontSize (em 1)
            , fontWeight normal
            , color theme.textPrimary
            ]
    }
