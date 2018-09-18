module Predictor.Update exposing (update)

import Predictor.Commands exposing (sendPredRequest)
import Predictor.Messages exposing (Msg(..))
import Predictor.Models exposing (Predictor)


update : Msg -> Predictor -> ( Predictor, Cmd Msg )
update msg predictor =
    case msg of
        InputTitle title ->
            let
                current_pred_input =
                    predictor.pred_input

                next_pred_input =
                    { current_pred_input | title = title }
            in
                ( { predictor | pred_input = next_pred_input }, Cmd.none )

        InputGenre genre ->
            let
                current_pred_input =
                    predictor.pred_input

                next_pred_input =
                    { current_pred_input | genre = genre }
            in
                ( { predictor | pred_input = next_pred_input }, Cmd.none )

        InputPlatform platform ->
            let
                current_pred_input =
                    predictor.pred_input

                next_pred_input =
                    { current_pred_input | platform = platform }
            in
                ( { predictor | pred_input = next_pred_input }, Cmd.none )

        SubmitPrediction flags ->
            ( predictor, sendPredRequest flags predictor.pred_input )

        ReceivePredResponce (Ok pred_result) ->
            ( { predictor | pred_result = pred_result }, Cmd.none )

        ReceivePredResponce (Err error) ->
            ( predictor, Cmd.none )
