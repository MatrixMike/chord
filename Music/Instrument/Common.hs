module Music.Instrument.Common where 

import Music.Diatonic
import Music.Diatonic.Note
import Music.Diatonic.Degree
import Music.Diatonic.Chord
import Data.List
import Data.Maybe
import Data.Char



data ControlAnnotation = AnnotateNote | AnnotatePosition | AnnotateMarking

abbreviateNote x = "cCdDefFgGaAb" !! fromJust (elemIndex x chromaticScale)
    
chromaticScale = [C,sharp C,D,sharp D,E,F,sharp F,G,sharp G,A,sharp A,B]

tuningAndPosToNote tuning pos = canonize $ applyNTimes sharp pos tuning

applyNTimes f n x = iterate f x !! n