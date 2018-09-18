module Flags exposing (Flags)


type alias Flags =
    { environment : String
    , gsp_request_url : String
    , gsp_api_key : String
    , gsp_subscription_key : String
    }
