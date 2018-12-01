module Main exposing (intParser, keepIntermediaryResults, scanLine, scanLines, solve1, solve2)

import List.Extra exposing (..)
import Parser exposing ((|.), (|=), Parser, end, int, lazy, map, oneOf, run, succeed, symbol)


type alias Frequencies =
    List Int


type alias IntermediaryResult =
    Int


solve1 : Frequencies -> Int
solve1 f =
    f
        |> keepIntermediaryResults []
        |> List.head
        |> Maybe.withDefault 0


solve2 : Frequencies -> Int
solve2 f =
    let
        loop acc =
            let
                intermediaryResults =
                    Debug.log "intermediary" <| keepIntermediaryResults acc f
            in
            if List.Extra.allDifferent intermediaryResults then
                loop intermediaryResults

            else
                intermediaryResults
                    |> findDuplicate
    in
    loop []


findDuplicate : List IntermediaryResult -> IntermediaryResult
findDuplicate results =
    List.map (\a -> ( a, List.Extra.count (\b -> b == a) results )) results
        |> List.filter (\( a, b ) -> b > 1)
        |> List.map Tuple.first
        |> List.head
        |> Maybe.withDefault 0


keepIntermediaryResults : List IntermediaryResult -> Frequencies -> List IntermediaryResult
keepIntermediaryResults acc f =
    List.foldl (\a b -> (a + (List.head b |> Maybe.withDefault 0)) :: b) acc f


scanLines input =
    input
        |> String.lines
        |> List.filterMap scanLine


scanLine : String -> Maybe Int
scanLine input =
    Parser.run intParser input |> Result.toMaybe


intParser : Parser Int
intParser =
    oneOf
        [ succeed negate
            |. symbol "-"
            |= int
            |. end
        , succeed identity
            |. symbol "+"
            |= int
            |. end
        ]
