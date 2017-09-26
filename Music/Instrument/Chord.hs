{-# OPTIONS_GHC -fwarn-missing-signatures #-}

module Music.Instrument.Chord
  ( renderGuitarConcept
  , standardTuning
  , dropD
  , ControlAnnotation(..)
  , renderPianoConcept
  , module Music.Diatonic.Note
  , module Music.Diatonic.Degree
  , module Music.Diatonic
  , module Music.Diatonic.Chord
  , module Music.Diatonic.Scale
  , module Music.Diatonic.Harmony
  , ukelele
  , lightChord
  , powerChord
  , fifthChord
  , findPositionPatterns
  , getPositionPatternRange
  , sus2
  , sus4
  , chordToScale
  , slash
  , hConcat
  , standardWidths
  ) where

import Music.Instrument.Common
import Music.Instrument.Guitar
import Music.Instrument.GuitarRender
import Music.Instrument.Piano

import Music.Diatonic
import Music.Diatonic.Chord
import Music.Diatonic.Degree
import Music.Diatonic.Harmony
import Music.Diatonic.Note
import Music.Diatonic.Scale
