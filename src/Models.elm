module Models exposing (..)

import Flags exposing (Flags)
import Predictor.Models exposing (Predictor, initialPredictor)


type alias Model =
    { flags : Flags
    , predictor : Predictor
    }


initialModel : Flags -> Model
initialModel flags =
    { flags = flags
    , predictor = initialPredictor
    }
