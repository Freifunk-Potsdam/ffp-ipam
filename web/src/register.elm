module Main exposing (Model, Msg(..), init, main, update, view)

import Browser
import Html exposing (Attribute, Html, button, div, input, text)
import Html.Attributes exposing (..)
import Html.Events exposing (onClick, onInput)
import IP


main =
    Browser.sandbox { init = init, update = update, view = view }


type FieldType
    = IP4
    | NodeName
    | Location
    | Contact


type FieldValue
    = Good String
    | Bad String String



-- Model


type alias Model =
    { ip4 : FieldValue
    , node_name : FieldValue
    , location : FieldValue
    , contact : FieldValue
    }


init : Model
init =
    { ip4 = Good ""
    , node_name = Good ""
    , location = Good ""
    , contact = Good ""
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
                    if IP.validate newContent then
                        { model | ip4 = Good newContent }

                    else
                        { model | ip4 = Bad newContent "E.g. 10.0.0.1." }

                NodeName ->
                    { model | node_name = Good newContent }

                Location ->
                    { model | location = Good newContent }

                Contact ->
                    { model | contact = Good newContent }

        Send ->
            model



-- View


view : Model -> Html Msg
view model =
    let
        inputFields =
            List.map
                (\( fieldType, fieldString, fieldValue ) ->
                    let
                        -- if Good input is detected, we want only an input
                        -- field. Otherwise (Bad), we want to show the error
                        -- message beside it.
                        elements =
                            case fieldValue model of
                                Good goodString ->
                                    [ input
                                        [ placeholder fieldString
                                        , value goodString
                                        , onInput (Change fieldType)
                                        ]
                                        []
                                    ]

                                Bad errorString errorDesc ->
                                    [ input
                                        [ placeholder fieldString
                                        , value errorString
                                        , onInput (Change fieldType)
                                        ]
                                        []
                                    , text
                                        errorDesc
                                    ]
                    in
                    div
                        []
                        elements
                )
                [ ( IP4, "IPv4 address", .ip4 )
                , ( NodeName, "Node name", .node_name )
                , ( Location, "Location", .location )
                , ( Contact, "Contact", .contact )
                ]
    in
    div
        []
        (inputFields
            ++ [ div [] [ button [ onClick Send ] [ text "Register" ] ]
               ]
            ++ [ text "Hello! This does nothing yet. There are " ]
            ++ [ Html.a
                    [ href "https://github.com/Freifunk-Potsdam/ffp-ipam" ]
                    [ text "sources available" ]
               ]
            ++ [ text "." ]
        )
