module Day5 exposing (Unit, asString, sameType, scanLines, solve1, solve2, toUnits, triggerUnits)

import List.Extra exposing (..)
import Set exposing (..)


type alias Unit =
    String


solve1 : String -> String
solve1 input =
    let
        loop counter units =
            let
                updatedCounter =
                    Debug.log "loop" <| (counter + 1)

                result =
                    triggerUnits <| units
            in
            if units == result then
                units

            else
                loop updatedCounter result
    in
    toUnits input |> loop 1 |> asString


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
