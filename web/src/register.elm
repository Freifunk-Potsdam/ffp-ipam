module Main exposing (Model, Msg(..), init, main, update, view)

import Browser
import Html exposing (Attribute, Html, button, div, input, text)
import Html.Attributes exposing (..)
import Html.Events exposing (onClick, onInput)


main =
    Browser.sandbox { init = init, update = update, view = view }



-- Model


type alias Model =
    { ip4 : String
    , node_name : String
    , location : String
    , contact : String
    }


init : Model
init =
    { ip4 = ""
    , node_name = ""
    , location = ""
    , contact = ""
    }



-- Update


type Msg
    = Change String
    | Send


update : Msg -> Model -> Model
update msg model =
    case msg of
        Change newContent ->
            { model | ip4 = newContent }

        Send ->
            model



-- View


view : Model -> Html Msg
view model =
    div []
        [ div [] [ input [ placeholder "IPv4 address", value model.ip4, onInput Change ] [] ]
        , div [] [ input [ placeholder "Node name", value model.node_name, onInput Change ] [] ]
        , div [] [ input [ placeholder "Location", value model.location, onInput Change ] [] ]
        , div [] [ input [ placeholder "Contact", value model.contact, onInput Change ] [] ]
        , div [] [ button [ onClick Send ] [ text "Send" ] ]
        ]
