{-# LANGUAGE FlexibleContexts #-}
module Music.Instrument.Chord 
(
 renderChords
 ,
 renderChordsAnnotating
 ,
 module Music.Diatonic
 ,
 module Music.Diatonic.Chord
 ,
 standardTuning
 ,
 dropD
 , 
 renderMajorChordsWithTuning
 ,
 ControlAnnotation(..)
 ,
 renderPianoChord
 ,
 module Music.Diatonic.Note
 ,
 module Music.Diatonic.Degree
)
where

import Music.Diatonic
import Music.Diatonic.Note
import Music.Diatonic.Degree
import Music.Diatonic.Chord
import Data.List
import Data.Maybe
import Data.Char

type Tuning = [Note]

dropD :: Tuning
dropD = [D,A,D,G,B,E]

data ControlAnnotation = AnnotateNote | AnnotatePosition | AnnotateMarking

data Instrument = Guitar | Piano

rotations =  reverse . (\list -> map (\n -> (take (length list) . drop (length list -n)) (cycle list)) [1..length list] )

inversions chordTuple = map  sequenceDegrees  $ rotations $ extractDegrees chordTuple

sequenceDegrees ds = scanl1 (\x y-> x + mod (y-x) 12) ds

noteToChromaticIndex note =   fromJust (findIndex (flip equiv note) chromaticScale)

degreeToChromaticIndex degree  =   fromJust (findIndex (flip equiv degree) degreeScale')

renderPianoChord chordForm chordRoot = renderPiano (degrees)
    where degrees = extractDegrees (chordRoot,chordForm)


renderMajorChordsWithTuning tuning = renderChordsWithTuning tuning majorChord 

renderMajorChords note = renderChords majorChord note

renderChordsWithTuning tuning = renderChordsFirstFiveFretsWithMaximumHeightOfFour  AnnotateMarking tuning

renderChordsAnnotating :: Deg s Note => ControlAnnotation ->  (a -> s) -> a -> [Char]
renderChordsAnnotating annotation = renderChordsFirstFiveFretsWithMaximumHeightOfFour annotation standardTuning

renderChords :: Deg s Note => (a -> s) -> a -> [Char]
renderChords = renderChordsFirstFiveFretsWithMaximumHeightOfFour AnnotateMarking standardTuning

renderChordsFirstFiveFretsWithMaximumHeightOfFour a t f r = concat $ union (renderChords' a t f r) (renderChords' a (map sharp t) f r)

renderChords' annotate_notes tuning chordForm chordRoot  = map unlines $ intersperse ["       "] $ map Data.List.transpose $ 
  map (\(v,b) -> renderFretBoardHorizontal chordRoot chordForm annotate_notes tuning v b) (zip (chordPositionsVertical) [0..])
    where chordPositionsVertical = positionsVertical (chordRoot,chordForm) tuning

renderFretBoardHorizontal chordRoot chordForm annotate_notes tuning strings iteration = map (\(pos,stringIndex) -> renderString annotate_notes maximumPosition pos iteration (tuning!!stringIndex)) (zip strings [0..])
  where
  maximumPosition = maximum $ (map maximum) chordPositionsVertical
  chordPositionsVertical = positionsVertical (chordRoot,chordForm) tuning

renderString annotate_notes max p iteration stringTuning = map (\i->char i p) [0..max]
  where char index pos | index == pos = fingeringChar pos
                       | otherwise = fretChar index 
        fingeringChar pos = case annotate_notes of { 
                  AnnotateNote -> abbreviateNote $ tuningAndPosToNote stringTuning pos
                ; AnnotateMarking -> fingeringCharUnannotated pos
                ; AnnotatePosition -> head (show pos)
        }
        fretChar 0 = '='
        fretChar _ = '-'
        fingeringCharUnannotated 0 = 'o'
        fingeringCharUnannotated _ = '*'
        

positionsVertical :: Deg s Note => (a, a -> s) -> Tuning -> [[Int]]
positionsVertical chord tuning = map (map fromJust) $ map (map (uncurry (flip elemIndex))) $ map (zipWith (,) (firstFourFretsVertical tuning)) (notesVertical chord tuning)

notesVertical chord tuning = sequence $ map (filter (flip elem (extractChord chord))) (firstFourFretsVertical tuning)

firstFourFretsVertical :: [Note] -> [[Note]]
firstFourFretsVertical tuning = Data.List.transpose (firstFourFrets tuning)

extractDegrees noteChordTuple = map (+ (noteToChromaticIndex (fst noteChordTuple))) $ map degreeToChromaticIndex  $ map fst $ degrees $ (snd noteChordTuple) (fst noteChordTuple)
extractChord noteChordTuple = map snd $ degrees $ (snd noteChordTuple) (fst noteChordTuple)

firstFourFrets tuning = take 4 (frets tuning)

frets :: [Note] -> [[Note]]
frets tuning = map (\n -> (map (canonize . applyNTimes sharp n) tuning)) [0..] 

applyNTimes f n x = iterate f x !! n

standardTuning = [E,A,D,G,B,E]

tuningAndPosToNote tuning pos = canonize $ applyNTimes sharp pos tuning

replaceAt i v xs = map (\(x,i') -> if i==i' then v else x) $  zip xs [0..]
   
renderPiano positions = foldl (markPiano '*') cleanPiano positions
  
markPiano marking piano position   = replaceAt (getPianoPositionCharacterIndex position) marking piano

cleanPiano = map (\x -> if elem x pianoMarkings then ' ' else x ) markedPiano
            
getPianoPositionCharacterIndex pos = i
    where (Just i) = elemIndex (pianoMarkings !! pos) markedPiano

pianoMarkings = ['a'..'l']

abbreviateNote x = "cCdDefFgGaAb" !! n 
    where (Just n) = elemIndex x chromaticScale
    
chromaticScale = [C,sharp C,D,sharp D,E,F,sharp F,G,sharp G,A,sharp A,B]
degreeScale = [First,Second,Third,Fourth,Fifth,Sixth,Seventh]
degreeScale' = iterate (noteMap sharp) First

markedPiano = unlines
        [
         "  ____________________ "
        ," | |b||d| | |g||i||k| |"
        ," | |_||_| | |_||_||_| |"
        ," |a |c |e |f |h |j |l |"
        ," |__|__|__|__|__|__|__|"
        ]