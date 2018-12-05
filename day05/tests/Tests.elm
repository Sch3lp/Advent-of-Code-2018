module Tests exposing (suite)

-- import Fuzz exposing (Fuzzer, int, list, string)

import Day5 exposing (..)
import Expect exposing (Expectation)
import PuzzleInput exposing (puzzleInput)
import Test exposing (..)


testInput =
    "0"


suite : Test
suite =
    describe "Day 2"
        [ describe "Puzzle 1"
            [ describe "can read input lines"
                [ test "testinput" <|
                    \_ ->
                        testInput
                            |> scanLines
                            |> Expect.equal
                                "0"
                ]
            , describe "triggerUnits"
                [ test "dabAcCaCBAcCcaDA" <|
                    \_ ->
                        "dabAcCaCBAcCcaDA"
                            |> triggerUnitsInTests
                            |> Expect.equal
                                "dabAaCBAcCcaDA"
                , test "dabAaCBAcCcaDA" <|
                    \_ ->
                        "dabAaCBAcCcaDA"
                            |> triggerUnitsInTests
                            |> Expect.equal
                                "dabCBAcCcaDA"
                , test "dabCBAcCcaDA" <|
                    \_ ->
                        "dabCBAcCcaDA"
                            |> triggerUnitsInTests
                            |> Expect.equal
                                "dabCBAcaDA"
                , test "dabCBAcaDA" <|
                    \_ ->
                        "dabCBAcaDA"
                            |> triggerUnitsInTests
                            |> Expect.equal
                                "dabCBAcaDA"
                ]
            , describe "solve1"
                [ test "testinput: dabAcCaCBAcCcaDA" <|
                    \_ ->
                        "dabAcCaCBAcCcaDA"
                            |> solve1
                            |> Expect.equal
                                "dabCBAcaDA"
                , test "puzzleInput" <|
                    \_ ->
                        puzzleInput
                            |> solve1
                            |> String.length
                            |> Expect.equal
                                4
                ]
            ]
        ]


triggerUnitsInTests =
    toUnits >> triggerUnits >> asString
