module Day2 exposing (Combination(..), Model, check, checkDupes, checkTrips, limitTo1, scanLines, solve1, solve2)

import List.Extra exposing (..)
import Set exposing (..)


type Combination number
    = Dupes Int
    | Trips Int


type alias Model =
    { dupes : Combination Int, trips : Combination Int }


solve1 : Int -> Int
solve1 i =
    i


solve2 : Int -> Int
solve2 i =
    i


check : String -> Model
check input =
    let
        charsPerCount =
            String.split "" input
                |> group
    in
    Model (checkDupes charsPerCount) (checkTrips charsPerCount)


group : List String -> List ( String, Int )
group results =
    List.map (\a -> ( a, List.Extra.count (\b -> b == a) results )) results


checkDupes : List ( String, Int ) -> Combination Int
checkDupes input =
    input
        |> List.filter (\( someChar, count ) -> count == 2)
        |> List.length
        |> limitTo1
        |> Dupes


checkTrips : List ( String, Int ) -> Combination Int
checkTrips input =
    input
        |> List.filter (\( someChar, count ) -> count == 3)
        |> List.length
        |> limitTo1
        |> Trips


limitTo1 : Int -> Int
limitTo1 i =
    if i > 1 then
        1

    else
        i


scanLines input =
    input
        |> String.lines
