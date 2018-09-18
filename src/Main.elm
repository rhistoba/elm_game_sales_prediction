module Main exposing (..)

import Html exposing (Html)
import Models exposing (Model, initialModel)
import Update exposing (update)
import View exposing (view)
import Flags exposing (Flags)
import Messages exposing (Msg(..))


init : Flags -> ( Model, Cmd Msg )
init flags =
    ( initialModel flags, Cmd.none )


main : Program Flags Model Msg
main =
    Html.programWithFlags
        { view = view
        , init = init
        , update = update
        , subscriptions = always Sub.none
        }
