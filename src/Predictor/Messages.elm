module Predictor.Messages exposing (..)

import Http
import Flags exposing (Flags)
import Predictor.PredResult exposing (PredResult)


type Msg
    = InputTitle String
    | InputGenre String
    | InputPlatform String
    | SubmitPrediction Flags
    | ReceivePredResponce (Result Http.Error PredResult)
