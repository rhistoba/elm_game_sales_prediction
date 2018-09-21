module Predictor.Commands exposing (predInputEncoded, predRequest, predResultDecoder, sendPredRequest)

import Flags exposing (Flags)
import Http
import Json.Decode as Decode exposing (at, field, index, map2, string)
import Json.Encode as Encode
import Predictor.Messages exposing (..)
import Predictor.PredInput exposing (PredInput)
import Predictor.PredResult exposing (PredResult)


sendPredRequest : Flags -> PredInput -> Cmd Msg
sendPredRequest flags predInput =
    Http.send ReceivePredResponce <|
        predRequest flags predInput


predRequest : Flags -> PredInput -> Http.Request PredResult
predRequest flags predInput =
    Http.request
        { method = "POST"
        , headers =
            [ Http.header "Content-Type" "application/json"
            , Http.header "Authorization" ("Bearer " ++ flags.gsp_api_key)
            , Http.header "Ocp-Apim-Subscription-Key" flags.gsp_subscription_key
            ]
        , url = flags.gsp_request_url
        , body = Http.jsonBody <| predInputEncoded predInput
        , expect = Http.expectJson predResultDecoder
        , timeout = Nothing
        , withCredentials = False
        }


predInputEncoded : PredInput -> Encode.Value
predInputEncoded predInput =
    let
        obj =
            [ ( "Name", Encode.string predInput.title )
            , ( "Genre", Encode.string predInput.genre )
            , ( "Platform", Encode.string predInput.platform )
            ]

        input1 =
            Encode.list Encode.object [ obj ]

        inputs =
            Encode.object [ ( "input1", input1 ) ]
    in
    Encode.object [ ( "Inputs", inputs ), ( "GlobalParameters", Encode.object [] ) ]


predResultDecoder : Decode.Decoder PredResult
predResultDecoder =
    let
        customDecoder key =
            field "Results" <| field "output1" <| index 0 <| field key string
    in
    map2 PredResult
        (customDecoder "Scored Label Mean")
        (customDecoder "Scored Label Standard Deviation")
