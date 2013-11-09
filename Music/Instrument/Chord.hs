module Music.Instrument.Chord 
(
  renderChords
 ,module Music.Diatonic
 ,module Music.Diatonic.Chord
)
where

import Music.Diatonic 
import Music.Diatonic.Chord
import Data.List
import Data.Maybe

standardTuningFirstFret = [E,A,D,G,B,E]

applyNTimes f 0 x = x
applyNTimes f n x = applyNTimes f (n-1) (f x)

standardTuningFrets = map (\n -> (map (canonize . applyNTimes sharp n) standardTuningFirstFret)) [0..] 

standardTuningFirstFourFrets = take 4 standardTuningFrets
standardTuningFirstFourFretsStrings  = Data.List.transpose standardTuningFirstFourFrets 

fingerings chord = sequence $ map (filter (flip elem (extractChord chord) )) ( standardTuningFirstFourFretsStrings )

positions chord =  map (map fromJust ) $ map (map (uncurry (flip elemIndex) )) $ map (zipWith (,) standardTuningFirstFourFretsStrings   )  (fingerings chord)

renderString :: Int -> String
renderString n =  modifyHead ((\x -> if x=='-' then '-' else 'o'))  (map (\x->if x==n then ('*') else ('-')) [0..4])

modifyHead f (x:xs) = (f x:xs)
modifyHead f [] = []

renderChords chord = concat $ map  ( unlines) $ intersperse ["       "] $  map Data.List.transpose $ map ( map renderString) (positions chord)

extractChord (note,chord) = map snd $ degrees $ chord note
