module Day5 exposing (Unit, UnitPair, scanLines, solve1, solve2, triggerUnit)

import List.Extra exposing (..)
import Set exposing (..)


solve1 : Int -> Int
solve1 i =
    i


type alias Unit =
    String


type alias UnitPair =
    ( Unit, Unit )


triggerUnit : UnitPair -> Maybe UnitPair
triggerUnit ( unit1, unit2 ) =
    let
        lower1 =
            String.toLower unit1

        lower2 =
            String.toLower unit2
    in
    if lower1 == lower2 then
        Nothing

    else
        Just ( unit1, unit2 )


solve2 : Int -> Int
solve2 i =
    i


scanLines input =
    input
