module Main exposing (intParser, scanLine, scanLines, solve1, solve2)

import List.Extra exposing (..)
import Parser exposing ((|.), (|=), Parser, end, int, lazy, map, oneOf, run, succeed, symbol)
import Set exposing (..)


solve1 : Int -> Int
solve1 i =
    i


solve2 : Int -> Int
solve2 i =
    i


scanLines input =
    input
        |> String.lines
        |> List.filterMap scanLine


scanLine : String -> Maybe Int
scanLine input =
    Parser.run intParser input |> Result.toMaybe


intParser : Parser Int
intParser =
    succeed identity
        |= int
        |. end
