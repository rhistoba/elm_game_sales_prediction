module Predictor.Models exposing (..)

import Predictor.PredInput exposing (PredInput, initPredInput)
import Predictor.PredResult exposing (PredResult, initPredResult)


type alias Predictor =
    { pred_input : PredInput
    , pred_result : PredResult
    }


initialPredictor : Predictor
initialPredictor =
    { pred_input = initPredInput
    , pred_result = initPredResult
    }
