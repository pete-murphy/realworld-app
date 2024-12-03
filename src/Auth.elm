module Auth exposing (User, onPageLoad, viewCustomPage)

import Api.User
import Auth.Action
import Dict exposing (Dict)
import Route exposing (Route)
import Route.Path
import Shared
import View exposing (View)


type alias User =
    Api.User.User


onPageLoad : Shared.Model -> Route () -> Auth.Action.Action User
onPageLoad shared req =
    case shared.user of
        Just user ->
            Auth.Action.loadPageWithUser user

        Nothing ->
            Auth.Action.replaceRoute
                { path = Route.Path.Login
                , query = Dict.empty
                , hash = Nothing
                }


viewCustomPage : Shared.Model -> Route () -> View Never
viewCustomPage shared route =
    View.none
