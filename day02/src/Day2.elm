module Day2 exposing (Model, check, checkDupes, checkTrips, countCombos, group, limitTo1, scanLines, solve1, solve2)

import List.Extra exposing (..)
import Set exposing (..)


type alias Model =
    { dupes : Int, trips : Int }


solve1 : String -> Int
solve1 input =
    let
        summedModel =
            scanLines input
                |> List.map check
                |> List.foldl countCombos (Model 0 0)
    in
    summedModel.dupes * summedModel.trips


solve2 : Int -> Int
solve2 i =
    i


countCombos : Model -> Model -> Model
countCombos m1 m2 =
    { dupes = m1.dupes + m2.dupes, trips = m1.trips + m2.trips }


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


checkDupes : List ( String, Int ) -> Int
checkDupes input =
    input
        |> List.filter (\( someChar, count ) -> count == 2)
        |> List.length
        |> limitTo1


checkTrips : List ( String, Int ) -> Int
checkTrips input =
    input
        |> List.filter (\( someChar, count ) -> count == 3)
        |> List.length
        |> limitTo1


limitTo1 : Int -> Int
limitTo1 i =
    if i > 1 then
        1

    else
        i


scanLines input =
    input
        |> String.lines
