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
Prelude Music.Instrument.Chord> putStrLn (renderChords D majorChord)
-oo---
------
*--*-*
----*-

Prelude Music.Instrument.Chord> putStrLn (renderChords C majorChord)
o--o-o
----*-
--*---
-*----
       
o--o--
----*-
--*---
-*---*
       
---o-o
----*-
--*---
**----
       
---o--
----*-
--*---
**---*

```
