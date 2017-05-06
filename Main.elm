module Main exposing (..)

import Html exposing (Html, button, div, text, input, label)
import Html.Events exposing (onClick)


main =
    Html.program { init = initModel, view = view, update = update, subscriptions = subscriptions }


type Control
    = TextField
    | EmailField
    | Ratings


type alias Question =
    { control : Control
    , label : String
    , isFinished : Bool
    }


type alias Model =
    { questions : List Question
    }


type Msg
    = None


initModel : ( Model, Cmd msg )
initModel =
    ( { questions = [ { control = TextField, label = "Name", isFinished = False } ]
      }
    , Cmd.none
    )


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    ( model, Cmd.none )


view : Model -> Html Msg
view model =
    div []
        (List.map
            renderQuestion
            model.questions
        )


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none


renderQuestion : Question -> Html Msg
renderQuestion question =
    case question.control of
        TextField ->
            renderInputQuestion question

        EmailField ->
            renderInputQuestion question

        Ratings ->
            renderInputQuestion question


renderInputQuestion : Question -> Html Msg
renderInputQuestion question =
    div []
        [ label [] [ text question.label ]
        , input [] []
        ]
