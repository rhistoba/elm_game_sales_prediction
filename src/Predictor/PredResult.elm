module Predictor.PredResult exposing (..)


type alias PredResult =
    { scored_label_mean : String
    , scored_label_std : String
    }


initPredResult : PredResult
initPredResult =
    { scored_label_mean = ""
    , scored_label_std = ""
    }
