module Main exposing (Model, Msg(..), init, main, update, view)

import Browser
import Html exposing (Attribute, Html, button, div, input, text)
import Html.Attributes exposing (..)
import Html.Events exposing (onClick, onInput)


main =
    Browser.sandbox { init = init, update = update, view = view }


type FieldType
    = IP4
    | NodeName
    | Location
    | Contact



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
    = Change FieldType String
    | Send


update : Msg -> Model -> Model
update msg model =
    case msg of
        Change fieldType newContent ->
            case fieldType of
                IP4 ->
                    { model | ip4 = newContent }

                NodeName ->
                    { model | node_name = newContent }

                Location ->
                    { model | location = newContent }

                Contact ->
                    { model | contact = newContent }

        Send ->
            model



-- View


view : Model -> Html Msg
view model =
    div []
        (List.map
            (\( fieldType, fieldString, fieldValue ) ->
                div
                    []
                    [ input
                        [ placeholder fieldString
                        , value (fieldValue model)
                        , onInput (Change fieldType)
                        ]
                        []
                    ]
            )
            [ ( IP4, "IPv4 address", .ip4 )
            , ( NodeName, "Node name", .node_name )
            , ( Location, "Location", .location )
            , ( Contact, "Contact", .contact )
            ]
        )
