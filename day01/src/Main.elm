module Main exposing (intParser, scanLine, scanLines, solve1)

import Parser exposing ((|.), (|=), Parser, end, int, lazy, map, oneOf, run, succeed, symbol)


solve1 =
    List.foldl (+) 0


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
