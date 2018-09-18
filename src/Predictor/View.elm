module Predictor.View exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (onInput, onSubmit, targetValue, on)
import Predictor.Models exposing (Predictor)
import Predictor.Messages exposing (Msg(..))
import Misc.Genres exposing (genres)
import Misc.Platforms exposing (platforms)
import Json.Decode as Json
import Flags exposing (Flags)


view : Flags -> Predictor -> Html Msg
view flags predictor =
    div [ class "ui container" ]
        [ h1 [] [ text "Game Sales Prediction" ]
        , p [] [ text "Input game title, genre and platform. Then predictor will give you that sales." ]
        , Html.form [ class "ui form", onSubmit (SubmitPrediction flags) ]
            [ div [ class "field" ]
                [ label [] [ text "Title" ]
                , input [ type_ "text", name "title", placeholder "Input game title here!", onInput InputTitle ] []
                ]
            , div [ class "field" ]
                [ label [] [ text "Genre" ]
                , select [ class "ui fluid dropdown", onChange InputGenre ]
                    (List.map (\genre -> option [ value genre ] [ text genre ]) genres)
                ]
            , div [ class "field" ]
                [ label [] [ text "Platform" ]
                , select [ class "ui fluid dropdown", onChange InputPlatform ]
                    (List.map (\platform -> option [ value platform ] [ text platform ]) platforms)
                ]
            , button [ class "ui button", type_ "submit" ] [ text "Submit" ]
            ]
        , h2 [] [ text ("Predicted sales: " ++ predictor.pred_result.scored_label_mean ++ "(in million)") ]
        ]


onChange : (String -> msg) -> Attribute msg
onChange handler =
    on "change" (Json.map handler targetValue)
