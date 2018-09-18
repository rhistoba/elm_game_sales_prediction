module Update exposing (update)

import Predictor.Update
import Messages exposing (Msg(..))
import Models exposing (Model)


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        PredictorMsg subMsg ->
            let
                ( updatedPredictor, cmd ) =
                    Predictor.Update.update subMsg model.predictor
            in
                ( { model | predictor = updatedPredictor }, Cmd.map PredictorMsg cmd )
