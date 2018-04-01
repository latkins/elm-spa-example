module Views.Article exposing (view, viewTimestamp)

{-| Viewing a preview of an individual article, excluding its body.
-}

import Data.Article exposing (Article)
import Data.UserPhoto as UserPhoto exposing (UserPhoto)
import DateFormat
import Html exposing (..)
import Html.Attributes exposing (attribute, class, classList, href, id, placeholder, src)
import Route exposing (Route)
import Views.Article.Favorite as Favorite
import Views.Author


-- VIEWS --


{-| Some pages want to view just the timestamp, not the whole article.
-}
viewTimestamp : Article a -> Html msg
viewTimestamp article =
    span [ class "date" ] [ text (formattedTimestamp article) ]


view : (Article a -> msg) -> Article a -> Html msg
view toggleFavorite article =
    let
        author =
            article.author
    in
    div [ class "article-preview" ]
        [ div [ class "article-meta" ]
            [ a [ Route.href (Route.Profile author.username) ]
                [ img [ UserPhoto.src author.image ] [] ]
            , div [ class "info" ]
                [ Views.Author.view author.username
                , span [ class "date" ] [ text (formattedTimestamp article) ]
                ]
            , Favorite.button
                toggleFavorite
                article
                [ class "pull-xs-right" ]
                [ text (" " ++ String.fromInt article.favoritesCount) ]
            ]
        , a [ class "preview-link", Route.href (Route.Article article.slug) ]
            [ h1 [] [ text article.title ]
            , p [] [ text article.description ]
            , span [] [ text "Read more..." ]
            ]
        ]



-- INTERNAL --


formattedTimestamp : Article a -> String
formattedTimestamp article =
    "TODO"
