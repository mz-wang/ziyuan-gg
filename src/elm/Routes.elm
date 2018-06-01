module Routes exposing (Route(..), getRoute, setRoute)

import Navigation exposing (Location, modifyUrl)
import UrlParser exposing (Parser, map, oneOf, parseHash, top)


type Route
    = Root
    | Home


toString : Route -> String
toString route =
    let
        segments =
            case route of
                Root ->
                    []

                Home ->
                    []
    in
        "#/" ++ String.join "/" segments


parseRoute : Parser (Route -> a) a
parseRoute =
    oneOf
        [ map Home top
        ]


getRoute : Location -> Maybe Route
getRoute location =
    if String.isEmpty location.hash then
        Just Root
    else
        parseHash parseRoute location


setRoute : Route -> Cmd msg
setRoute =
    toString >> modifyUrl
