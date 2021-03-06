module Tests exposing (suite)

-- import Fuzz exposing (Fuzzer, int, list, string)

import Day2 exposing (..)
import Expect exposing (Expectation)
import Test exposing (..)


suite : Test
suite =
    describe "Day 2"
        [ describe "Puzzle 1"
            [ describe "check"
                [ test "no dupes" <|
                    \_ ->
                        "abcdef"
                            |> check
                            |> Expect.equal
                                (Model 0 0)
                , test "1 dupe" <|
                    \_ ->
                        "abbcde"
                            |> check
                            |> Expect.equal
                                (Model 1 0)
                , test "2 dupes" <|
                    \_ ->
                        "aabcdd"
                            |> check
                            |> Expect.equal
                                (Model 1 0)
                , test "no trips" <|
                    \_ ->
                        "abcdef"
                            |> check
                            |> Expect.equal
                                (Model 0 0)
                , test "1 trip" <|
                    \_ ->
                        "abcccd"
                            |> check
                            |> Expect.equal
                                (Model 0 1)
                , test "2 trips" <|
                    \_ ->
                        "ababab"
                            |> check
                            |> Expect.equal
                                (Model 0 1)
                , test "1 trip, 1 dupe" <|
                    \_ ->
                        "bababc"
                            |> check
                            |> Expect.equal
                                (Model 1 1)
                ]
            , describe "solve1"
                [ test "testinput" <|
                    \_ ->
                        testInput
                            |> solve1
                            |> Expect.equal
                                12
                , test "puzzle input" <|
                    \_ ->
                        puzzleInput
                            |> solve1
                            |> Expect.equal
                                7533
                ]
            ]
        , describe "Puzzle 2"
            [ describe "solve2"
                [ test "testinput" <|
                    \_ ->
                        testInput2
                            |> solve2
                            |> Expect.equal
                                0
                , test "puzzle input" <|
                    \_ ->
                        puzzleInput
                            |> solve2
                            |> Expect.equal
                                0
                ]
            ]
        ]


testInput =
    """
abcdef
bababc
abbcde
abcccd
aabcdd
abcdee
ababab
"""


testInput2 =
    """
abcde
fghij
klmno
pqrst
fguij
axcye
wvxyz
"""


puzzleInput =
    """
mphcuiszrnjzxwkbgdzqeoyxfa
mihcuisgrnjzxwkbgdtqeoylia
mphauisvrnjgxwkbgdtqeiylfa
mphcuisnrnjzxwkbgdgqeoylua
mphcuisurnjzxwkbgdtqeoilfi
mkhcuisvrnjzowkbgdteeoylfa
mphcoicvrnjzxwksgdtqeoylfa
mxhcuisvrndzxwkbgdtqeeylfa
dphcuisijnjzxwkbgdtqeoylfa
mihvuisvrqjzxwkbgdtqeoylfa
mphcuisrrnvzxwkbgdtqeodlfa
mphtuisdrnjzxskbgdtqeoylfa
mphcutmvsnjzxwkbgdtqeoylfa
mphcunsvrnjzswkggdtqeoylfa
mphcuisvrwjzxwkbpdtqeoylfr
mphcujsdrnjzxwkbgdtqeovlfa
mpfcuisvrdjzxwkbgdtteoylfa
mppcuisvrpjzxwkbgdtqeoywfa
mphcuisvrnjzxwkbfptqroylfa
mphcuisvrnjzxwkbgstoeoysfa
mphcufsvrnjzcwkbgdeqeoylfa
mphcuissrnjzxwkbgdkquoylfa
sphcuxsvrnjzxwkbgdtqioylfa
mphcuiivrhjzxwkbgdtqevylfa
echcuisvrnjzxwkbgltqeoylfa
mphcuisvrljexwkbvdtqeoylfa
mpjcuisvrnjzxwkhidtqeoylfa
mphcuisvrfjzmwkbgdtqeoylfl
mwhcuisvrnjzxwkbgdtqeoytfm
mphcuisvrsjzxwkbgdaqeoylfh
mohcuisvrnjzxwkbgdtqtoymfa
maycuisvrnjzxwkbgdtqboylfa
pphcuisvqnjzxwkbgdtqeoylfd
mprcuisvrnjtxwmbgdtqeoylfa
mfhcuisgrnjzxckbgdtqeoylfa
mphiubsvrnjzxwkbgdtqeoyufa
dphctisvrnjzxwkbgdtqeoylfk
mphcuisvrnjznwksgdtqeoyzfa
mpwcuisvrnjziwkbgdtqaoylfa
mphduzsvrnjznwkbgdtqeoylfa
mphccisvrnjzxwebgdtqeoylqa
xphcuisvrnjzxwkfvdtqeoylfa
mphcupsvrnjzxwkbgdtfeoylpa
mphcuisvrtjzjwkbgdtqeoylfe
mpbcuisvrnjzxwkbgdmieoylfa
mphcuisvrnjzxwkbgjtqetylaa
mphcuisvrnjzxwpbgdtgdoylfa
ophcufsvrqjzxwkbgdtqeoylfa
iphcuhsvrnjzxwkbgetqeoylfa
mphcuisvunjzxwwbgdtqeoylqa
mphcpisvrnjzowkbgdtveoylfa
mphcuisvrnjzxhkbgdtqeotlla
mphcuisvrnjzxwkbodtgeoylha
mphcuisvrjjzxwkbwdtqtoylfa
mphcwisvrnjnxwkbgjtqeoylfa
mplcuicqrnjzxwkbgdtqeoylfa
mphcuisvrnjzxydbgdtqeoylfn
ophckisvrnjzxwkbgdtqeozlfa
mphcuisvrkjzxwkbgdtteoblfa
yphcuisvrnjcxwkbggtqeoylfa
mphcuisvrnazxwfbqdtqeoylfa
mphcuisvrmjzxwkbgdtlwoylfa
mphctksvrnjzxwibgdtqeoylfa
mphcuisprnjzxlebgdtqeoylfa
mphcuisnrnjzxakbgdtueoylfa
mphcuiavrnjoxwtbgdtqeoylfa
nphcuisvrnjzxwkbgdtqzoylfk
mphcuisrrnjmxwkbgdtqdoylfa
mphcuisvrujzxwkvgdtqehylfa
mphcuisvrnfzxwkogdtqebylfa
mphcuisvrnjwdwkbgdtqeoyxfa
mphcuisvrntzxwkrgxtqeoylfa
mpzcuisvrnjzxwebgdtqeoylsa
aphcuikvrnjzxwwbgdtqeoylfa
mphcqisvrnjzxwkpgdtqeoelfa
mphcuusvrnjzxwkbgdtjeodlfa
mphcuisvrnjzewkbgdtteoylza
mphcuisvanjzxwkbgdtheoylfc
mphcjishrnjzxwkbgltqeoylfa
mpxcuislrnjzxwkbgdtqeoynfa
mphcuisvrnjjxwkbgdtmeoxlfa
mphcimsvrnjzxwkbsdtqeoylfa
mphcxisvcnjzxwjbgdtqeoylfa
mphcuisbrvjzxwkbgdtqeoymfa
mplcuisvrnjzxwkbgdtaenylfa
mphcuihvrnjzxwkygytqeoylfa
mphcbisvrnjzxhkbgdtqezylfa
mphcuisarnjzxwkbgatqeoylfv
mphcumsvrnjzxwkbgdrqebylfa
mlhcuisvrnwzxwkbgdtqeoylfx
mpkcuisvrkjzxwkbgdtqeoylfo
mphcuissrnjzxwkbgdtqmoylfc
mphcuiwvrnjuxwkfgdtqeoylfa
mphcuicvlnjzxwkbgdvqeoylfa
mphcuisvrvvzxwkbfdtqeoylfa
myhcuisvrnjpxwkbgntqeoylfa
mpocuisvrnjzxwtbgitqeoylfa
mphcuisvrnjzxwkbgdtwewyqfa
mphcuisvtnjzxwwbgdtqeoolfa
mphcuisvrnjzxgkbgdyqeoyyfa
mphcuisvrdjzxwkbgpyqeoylfa
bphcuisvrnjzxwkbgxtqefylfa
sphcuisvrdjzxwktgdtqeoylfa
mphcuvsvrnjmxwobgdtqeoylfa
mphcuisvrnjzxwkbsdtqeuylfb
mnhcmisvynjzxwkbgdtqeoylfa
mphckisvrnjzxwkhgdkqeoylfa
mpacuisvrnjzxwkbgdtqeoolaa
mpgcuisvrnjzxwkbzdtqeoynfa
mphcuisvrojzxwkbzdtqeoylga
mphcuisvknjfxwkbydtqeoylfa
mphcuistrnjzxwkbgdqqeuylfa
bpvcuiszrnjzxwkbgdtqeoylfa
mphcuxsvrnjzswkbgdtqeoelfa
mphcuisvbnjzxwlbgdtqeoylla
mphcuisvonczxwkbgktqeoylfa
mphcuisvrnkzxwvbgdtquoylfa
mphcuisvrnjzxokfgdtqeoylia
tphcuisvrnjzxwkbjdwqeoylfa
mihcuisvrnjzpwibgdtqeoylfa
mphcuisvrejzxwkbgdtqjuylfa
mprcuisvrnjixwkxgdtqeoylfa
mpqcuiszrnjzxwkbgdtqeodlfa
mphcuasvrnjzzakbgdtqeoylva
mphcuisvrnjzmwkbtdtqeoycfa
mphcuisvrnjzxwkbcdtqioylxa
mphckisvrnjzxwkbcdtqeoylfm
mphcuisvrnjuxwbogdtqeoylfa
mphcuisdrnjzxwkbldtqeoylfx
mphcuisvrnjoxwkbgdtqeyyyfa
mphcuicvqnjzxwkbgdtqeoylna
mpmcuisvrnjzxwkbgdtqktylfa
mphcuisvrnqzxwkggdtqeoykfa
mphcuisvryjzxwkbydtqejylfa
mphcugsvrnjzxwkbghtqeeylfa
rphcuusvrnjzxwkwgdtqeoylfa
zphwuiyvrnjzxwkbgdtqeoylfa
cphcuivvrnjzxwkbgdtqenylfa
mphcuisvrnjzxwkagotqevylfa
mprcuisvrcjzxwkbgdtqeoytfa
mphjugsvrnezxwkbgdtqeoylfa
mphcuisvryjzxwkbgltqeoylaa
mphcursvrnjzxfkbgdtqeoydfa
mphcuisvrcuzxwkbgdtqeoylfw
mphcuisvrijzxwkbgdtqeoelfh
xphcuisvenjzxjkbgdtqeoylfa
mphcuisvrnazxwkbgdeqeoylaa
mphcuisbrsjzxwkbgdtqeoygfa
mlhvuisvrnjzxwkbgdtqeoylfh
mphcuisvrnjzxukbgdtqeoyhfy
mpzcuilvrnjzawkbgdtqeoylfa
hphcuisjfnjzxwkbgdtqeoylfa
mahcuisvrnjzxwkegdtqeoylfi
mphcuixvrnjzcwkbgdtqetylfa
mphcuisvrnjzxwkdgdtqeoklfj
mlhcuisvrnjzxwkbgdteeoylka
mphcuifvrnjbxwkrgdtqeoylfa
mphcuasvrnjzzwkbgdtqeoylva
mphcuisvrnjzxwkboutqeoylba
mbhcuisvcnjzxwklgdtqeoylfa
mpbcuisvrnjzxgkbgdtqesylfa
mphcuisvrnjfswkbgdtqeoylfd
mphcuisvrnjzxwkbgdoweoysfa
uphcuisvrnjzrwkbgdtqelylfa
mphcuisvrnjzxwkbgdtqyoylsi
mpqcuiqvxnjzxwkbgdtqeoylfa
mphcuisorfjzxwkbgatqeoylfa
mphcuisvrntfxwkbzdtqeoylfa
mphcuisvrnrzxwkbgdtueoylfl
mphcuisvrnjzewkagdtyeoylfa
mpocuisdrnjzxwkbgdtqeozlfa
mphcuisvrnjjxwkbgdtoeoylfm
mphcuisvenjzxwkbgdtqwoylza
mpmcuisvrnjzxwkbgdtqeoxlfr
mphcuisvgnjhxwkbgdtqeoplfa
mphcuisvrnjzowkdgdtqeoyyfa
mphcuisqynjzxwkbgdtqeoylda
hphcuisvgnjzxwkbgdtbeoylfa
iphcuipvrnuzxwkbgdtqeoylfa
mphcuisvrnjzsikbpdtqeoylfa
mpwcuhsvrnjzxbkbgdtqeoylfa
mnhjuisvcnjzxwkbgdtqeoylfa
mphcudsvrnjzxwkbgdtqloilfa
mpncuiwvrwjzxwkbgdtqeoylfa
mphcuisvrnjgawkbgdtqeoylya
mphcuisvrnjzxwkbggtteoslfa
mphcuisvrnjzxwkbgdvqeoylpe
mphcuisvrnczxfkbgktqeoylfa
mphcuifvrnjzxwkbgdbmeoylfa
mphcuisvrnjytwkbgdtqeoylla
mphcuisvrnjzxwkbgdtjeoxlfn
mphjuisvrnjzxwkbghtqeoyffa
mphcuisvrnjzxkrbgdtqeoylaa
mphcbisvrnjzxwkbgttqeoylfs
mphkuksvbnjzxwkbgdtqeoylfa
nphcuidvrnjzxwhbgdtqeoylfa
mphguzsvrnjzxwkbgdaqeoylfa
mihcuisfrnjzxwkbgdtqhoylfa
mphcuisvrnrzxwpbgdtqesylfa
zphcuisvrnjzxwkbddtqeoylaa
mphcuigvmnjzxwkbgdtqeoylba
mjhcuisvrnjzxjkbgdtqeoylha
mphnuisvrnjznwkbgdtqnoylfa
mkhcuisvrnjcxwkbgdqqeoylfa
mphcuisvenjzxwbbqdtqeoylfa
qphcuisnrnjzawkbgdtqeoylfa
mphcuisvrdjzxwkbgdtqeoywca
mphcuzsvvnjzxwfbgdtqeoylfa
pphcuxsvrnjzxwkbgdtmeoylfa
mphiuvsvrnjzxlkbgdtqeoylfa
mphlqisvrnjzxkkbgdtqeoylfa
mmhcuisvrnjzxwkbgatqeoylea
mphduisrrnjoxwkbgdtqeoylfa
mphcuisvrnjnxwkvgdyqeoylfa
mphcuvsvrnjzxgkbgdtqeoylfz
mphcuisvryjzxwkbggtqkoylfa
iphcuisvrdjzxwkbgotqeoylfa
mphcuisvrnjzxwhbgdtqwoyofa
mphcorbvrnjzxwkbgdtqeoylfa
mghcuisvrnpzxykbgdtqeoylfa
mphauisvrnjnxwkbzdtqeoylfa
mphcgisvrnjzxwkwgdtqeoygfa
mphcuisvrnjzxwkggotqeoylba
mphcuesvrnjzxwkbgdwqebylfa
yphcuisvrnjzxwkbgdxqeoylja
ephyuisvrnjzywkbgdtqeoylfa
mfhcuisqrnjzxwkbgdlqeoylfa
mphkuisvrnjzxwkbertqeoylfa
mphcuusgrnjzxwkbggtqeoylfa
mphcuildrnjvxwkbgdtqeoylfa
mphcuiuvrnjzlwkbgwtqeoylfa
mppcuisvrljzxwkbgdtqeoylfw
mphcwiwvrnjzxwsbgdtqeoylfa
mphcubivrnjzxwkqgdtqeoylfa
mphcuisvrnjpxwkngdtqeoylpa
pchcuisvrgjzxwkbgdtqeoylfa
mphcuisvlnjzxwkbgdtmeoylfw
mphcuisvrnjzywkbgdvqeoylfj
mpzcuisvrnezxwktgdtqeoylfa
mphcuisvrnjbxwkbgzrqeoylfa
mphcuisvrnjzxwktgdtqeodtfa
jphcuiavrnjzxwkbgdtqeoylfv
mphcuisvrnjzxwkbddppeoylfa
mphcuissrkjzxwkbgxtqeoylfa
mphcuisvrhjzxwxbgdtqeoylxa
mphcvisvgnjjxwkbgdtqeoylfa
mphcuisprnjwxwtbgdtqeoylfa
mphcuissrnjzxqkbgdtqeoymfa
mphcuiabrnjzxokbgdtqeoylfa
mphcuisvrnczxwkbgmtpeoylfa
"""
