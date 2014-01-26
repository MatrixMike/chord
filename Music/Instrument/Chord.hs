module Music.Instrument.Chord
(
 renderChords
 ,
 renderChordsAnnotating
 ,
 standardTuning
 ,
 dropD
 , 
 renderMajorChordsWithTuning
 ,
 ControlAnnotation (..)
 ,
 renderPianoChord
 ,
 module Music.Diatonic.Note
 ,
 module Music.Diatonic.Degree
 ,
 module Music.Diatonic
 ,
 module Music.Diatonic.Chord
)
where

import Music.Instrument.Internals
import Music.Instrument.Guitar
import Music.Instrument.Piano
import Music.Instrument.Common

import Music.Diatonic
import Music.Diatonic.Note
import Music.Diatonic.Degree
import Music.Diatonic.Chord