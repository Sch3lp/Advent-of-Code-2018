module Tests exposing (suite)

-- import Fuzz exposing (Fuzzer, int, list, string)

import Expect exposing (Expectation)
import Main exposing (..)
import Test exposing (..)


testInput =
    """
0
"""


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
                                [ 0 ]
                ]
            , describe "can do stuff"
                [ test "testinput" <|
                    \_ ->
                        True
                            |> Expect.equal
                                True
                , test "puzzle input" <|
                    \_ ->
                        True
                            |> Expect.equal
                                True
                ]
            ]
        ]


puzzleInput =
    """
0
"""
