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
            , describe "triggerUnit"
                [ test "Aa -> Nothing" <|
                    \_ ->
                        ( "A", "a" )
                            |> triggerUnit
                            |> Expect.equal
                                Nothing
                , test "aA -> Nothing" <|
                    \_ ->
                        ( "a", "A" )
                            |> triggerUnit
                            |> Expect.equal
                                Nothing
                , test "aB -> aB" <|
                    \_ ->
                        ( "a", "B" )
                            |> triggerUnit
                            |> Expect.equal
                                (Just ( "a", "B" ))
                , test "Ab -> Ab" <|
                    \_ ->
                        ( "A", "b" )
                            |> triggerUnit
                            |> Expect.equal
                                (Just ( "A", "b" ))
                , test "puzzle input" <|
                    \_ ->
                        True
                            |> Expect.equal
                                True
                ]
            ]
        ]
