module Main exposing (main)

import Html.Styled exposing (..)
import Navigation exposing (Location)
import Routes exposing (getRoute, setRoute, Route)
import Page.NotFound as NotFound
import Page.Home as Home
import Component.App as App


-- MODEL --


type alias Model =
    { page : Page }


init : Location -> ( Model, Cmd Msg )
init location =
    loadPage (getRoute location) (Model Blank)



-- VIEW --


type Page
    = NotFound
    | Blank
    | Home


view : Model -> Html Msg
view model =
    case model.page of
        NotFound ->
            App.view [ NotFound.view ]

        Blank ->
            App.view [ text "" ]

        Home ->
            App.view [ Home.view ]



-- UPDATE --


type Msg
    = LocationChange (Maybe Route)


loadPage : Maybe Route -> Model -> ( Model, Cmd Msg )
loadPage maybeRoute model =
    case maybeRoute of
        Nothing ->
            ( { model | page = NotFound }, Cmd.none )

        Just Routes.Root ->
            ( { model | page = Blank }, setRoute Routes.Home )

        Just Routes.Home ->
            ( { model | page = Home }, Cmd.none )


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        LocationChange m ->
            loadPage m model



-- SUBSCRIPTIONS --


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none



-- MAIN --


main : Program Never Model Msg
main =
    Navigation.program (getRoute >> LocationChange)
        { init = init
        , view = view >> toUnstyled
        , update = update
        , subscriptions = subscriptions
        }
