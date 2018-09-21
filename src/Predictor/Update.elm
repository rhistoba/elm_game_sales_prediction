module Predictor.Update exposing (update)

import Predictor.Commands exposing (sendPredRequest)
import Predictor.Messages exposing (Msg(..))
import Predictor.Models exposing (Predictor)


update : Msg -> Predictor -> ( Predictor, Cmd Msg )
update msg predictor =
    case msg of
        InputTitle title ->
            let
                currentPredInput =
                    predictor.predInput

                nextPredInput =
                    { currentPredInput | title = title }
            in
                ( { predictor | predInput = nextPredInput }, Cmd.none )

        InputGenre genre ->
            let
                currentPredInput =
                    predictor.predInput

                nextPredInput =
                    { currentPredInput | genre = genre }
            in
                ( { predictor | predInput = nextPredInput }, Cmd.none )

        InputPlatform platform ->
            let
                currentPredInput =
                    predictor.predInput

                nextPredInput =
                    { currentPredInput | platform = platform }
            in
                ( { predictor | predInput = nextPredInput }, Cmd.none )

        SubmitPrediction flags ->
            ( predictor, sendPredRequest flags predictor.predInput )

        ReceivePredResponce (Ok predResult) ->
            ( { predictor | predResult = predResult }, Cmd.none )

        ReceivePredResponce (Err error) ->
            ( predictor, Cmd.none )
