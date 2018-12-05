module Day5 exposing (Unit, UnitPair, asString, scanLines, solve1, solve2, toUnits, triggerUnit, triggerUnits)

import List.Extra exposing (..)
import Set exposing (..)


type alias Unit =
    String


type alias UnitPair =
    ( Unit, Unit )


solve1 : String -> String
solve1 input =
    let
        loop units =
            let
                result =
                    triggerUnits units
            in
            if units == result then
                units

            else
                loop result
    in
    toUnits input |> loop |> asString


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


triggerUnits : List Unit -> List Unit
triggerUnits allUnits =
    let
        loop : List Unit -> List Unit -> List Unit
        loop acc units =
            case units of
                h :: h2 :: t ->
                    if sameType h h2 then
                        List.concat [ acc, t ]

                    else
                        loop (List.append acc [ h ]) (h2 :: t)

                h :: t ->
                    List.append acc [ h ]

                [] ->
                    acc
    in
    loop [] allUnits


sameType unit1 unit2 =
    String.toLower unit1 == String.toLower unit2


toUnits =
    String.split ""


asString =
    String.join ""


solve2 : Int -> Int
solve2 i =
    i


scanLines input =
    input
