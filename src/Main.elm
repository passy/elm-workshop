import Html exposing (div, button, text)
import Html.Events exposing (onClick)
import StartApp.Simple as StartApp


main : Signal Html.Html
main =
  StartApp.start { model = model, view = view, update = update }


model : number
model = 0


view : Signal.Address Action -> number -> Html.Html
view address model =
  div []
    [ button [ onClick address Decrement ] [ text "-" ]
    , div [] [ text (toString model) ]
    , button [ onClick address Increment ] [ text "+" ]
    ]


type Action = Increment | Decrement


update : Action -> number -> number
update action model =
  case action of
    Increment -> model + 1
    Decrement -> model - 1
