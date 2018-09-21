module Predictor.Models exposing (..)

import Predictor.PredInput exposing (PredInput, initPredInput)
import Predictor.PredResult exposing (PredResult, initPredResult)


type alias Predictor =
    { predInput : PredInput
    , predResult : PredResult
    }


initialPredictor : Predictor
initialPredictor =
    { predInput = initPredInput
    , predResult = initPredResult
    }
