module Predictor.PredInput exposing (..)

import Misc.Genres exposing (genres)
import Misc.Platforms exposing (platforms)


type alias PredInput =
    { title : String
    , genre : String
    , platform : String
    }


initPredInput : PredInput
initPredInput =
    { title = ""
    , genre = Maybe.withDefault "Action" (List.head genres)
    , platform = Maybe.withDefault "NES" (List.head platforms)
    }
