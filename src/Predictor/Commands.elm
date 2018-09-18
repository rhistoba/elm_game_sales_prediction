module Predictor.Commands exposing (predInputEncoded, predRequest, predResultDecoder, sendPredRequest)

import Flags exposing (Flags)
import Http
import Json.Decode as Decode exposing (at, field, string, index)
import Json.Decode.Pipeline exposing (custom, decode, required)
import Json.Encode as Encode
import Predictor.Messages exposing (..)
import Predictor.PredInput exposing (PredInput)
import Predictor.PredResult exposing (PredResult)


sendPredRequest : Flags -> PredInput -> Cmd Msg
sendPredRequest flags pred_input =
    predRequest flags pred_input
        |> Http.send ReceivePredResponce


predRequest : Flags -> PredInput -> Http.Request PredResult
predRequest flags pred_input =
    Http.request
        { method = "POST"
        , headers =
            [ Http.header "Content-Type" "application/json"
            , Http.header "Authorization" ("Bearer " ++ flags.gsp_api_key)
            , Http.header "Ocp-Apim-Subscription-Key" flags.gsp_subscription_key
            ]
        , url = flags.gsp_request_url
        , body = predInputEncoded pred_input |> Http.jsonBody
        , expect = Http.expectJson predResultDecoder
        , timeout = Nothing
        , withCredentials = False
        }


predInputEncoded : PredInput -> Encode.Value
predInputEncoded pred_input =
    let
        obj =
            Encode.object
                [ ( "Name", Encode.string pred_input.title )
                , ( "Genre", Encode.string pred_input.genre )
                , ( "Platform", Encode.string pred_input.platform )
                ]

        input1 =
            Encode.list [ obj ]

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
        decode PredResult
            |> custom (customDecoder "Scored Label Mean")
            |> custom (customDecoder "Scored Label Standard Deviation")
