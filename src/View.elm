module View exposing (view)

import Browser exposing (Document)
import Html exposing (Html)
import Messages exposing (Msg(..))
import Models exposing (Model)
import Predictor.View


view : Model -> Document Msg
view model =
    let
        predictorView =
            Html.map PredictorMsg (Predictor.View.view model.flags model.predictor)
    in
    { title = "Main"
    , body = [ predictorView ]
    }
