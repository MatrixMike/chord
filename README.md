Instrument Chord
=====

Render music chords on a guitar and piano

Installation:

```
cabal install instrument-chord
```

Example:

```
$ghci

Prelude>:m + Music.Instrument.Chord 
Prelude Music.Instrument.Chord> putStrLn (renderGuitarConcept True AnnotatePositionVertical False True False standardTuning (minorChord C) 4 1 True False [])
Fret: 3
|S3---
|S-4--
0S----
|S--5-
|S3---
|S3---

Fret: 3
3---
-4--
--5-
--5-
3---
3---
Prelude Music.Instrument.Chord> putStrLn (renderGuitarConcept False AnnotateMarking False True True dropD (majorChord F) 4 0 True False [])
=o====
----**
---*--
*-*---

Fret: 1
----**
---*--
***---
------
Prelude Music.Instrument.Chord> putStrLn (renderGuitarConcept False AnnotatePositionHorizontal False False True (reverse standardTuning) (majorChord G) 4 0 True False [])
=234==
------
----5-
1----6

==34==
------
----5-
12---6
Prelude Music.Instrument.Chord> putStrLn (renderGuitarConcept False AnnotateNote False True True standardTuning (minorChord G) 4 1 False False lightChord)
Fret: 3
---bDG
------
------
------
Prelude Music.Instrument.Chord> putStrLn (renderGuitarConcept False AnnotateMarking False True True standardTuning (fifthChord (sharp A)) 4 0 False True powerChord)
Fret: 1
-*----
------
--**--
------
Prelude Music.Instrument.Chord> putStrLn (renderGuitarConcept False AnnotateNote False True True standardTuning (majorChord (flat A)) 4 0 False False [])
Fret: 1
--eaC-
------
-C----
------
Prelude Music.Instrument.Chord> putStrLn (renderGuitarConcept False AnnotatePositionVertical False True True ukelele (majorChord C) 4 0 True False [])
000=
----
----
---3

0=0=
----
----
-3-3
Prelude Music.Instrument.Chord> putStrLn (renderGuitarConcept False AnnotateNote False True True standardTuning (majorScale B) 4 0 True False [])
E===BE
-bea--
gBE-dg
---b--
Prelude Music.Instrument.Chord> putStrLn (renderGuitarConcept False AnnotateNote True True True standardTuning E 13 0 True False [])
 0E====E
 1------
 2--E---
 3------
 4------
 5----E-
 6------
 7-E----
 8------
 9---E--
01------
11------
21E----E
Prelude Music.Instrument.Chord> putStrLn (renderPianoConcept 0 AnnotateMarking (majorChord C))
 ____________________ 
| | || | | | || || | |
| |_||_| | |_||_||_| |
|* |  |* |  |* |  |  |
|__|__|__|__|__|__|__|
Prelude Music.Instrument.Chord> putStrLn (renderPianoConcept 0 AnnotateMarking (majorChord C))
 ____________________ ____________________ 
| | || | | | || || | | |d|| | | |g||a|| | |
| |_||_| | |_||_||_| | |_||_| | |_||_||_| |
|  |  |  |  |  |A |B |  |D |E |  |  |  |  |
|__|__|__|__|__|__|__|__|__|__|__|__|__|__|
Prelude Music.Instrument.Chord> putStrLn (renderPianoConcept 1 AnnotateNote (majorScale A))
[[[0],[3],[2],[0],[1],[0]],[[0],[3],[2],[0],[1],[3]],[[3],[3],[2],[0],[1],[0]],[[3],[3],[2],[0],[1],[3]]]
```
