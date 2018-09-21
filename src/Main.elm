module Main exposing (init, main)

import Browser exposing (document)
import Flags exposing (Flags)
import Html exposing (Html)
import Messages exposing (Msg(..))
import Models exposing (Model, initialModel)
import Update exposing (update)
import View exposing (view)


init : Flags -> ( Model, Cmd Msg )
init flags =
    ( initialModel flags, Cmd.none )


main : Program Flags Model Msg
main =
    Browser.document
        { init = init
        , view = view
        , update = update
        , subscriptions = always Sub.none
        }
