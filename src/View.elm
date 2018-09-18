module View exposing (..)

import Predictor.View
import Models exposing (Model)
import Html exposing (Html)
import Messages exposing (Msg(..))


view : Model -> Html Msg
view model =
    Html.map PredictorMsg (Predictor.View.view model.flags model.predictor)
    
