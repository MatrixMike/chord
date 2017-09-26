Tue 26 Sep 2017 13:06:49 AEST 
I found this useful to learn from. I have hidden musical interests and the project builds and executes so that is a good start.
I followed suggestions from hlint and used hindent.
I chose this to work on because it uses libraries and responds nicely to 'cabal repl' ==> use :browse

I used to build with stack build but this project responds better to cabal build but gives some warnings and suggestions which I intend to follow up.

This sequence when executed suggests some improvements.
cabal clean && cabal build

cabal suggests to configure but when 'cabal configure' executed it does not cope well.

I generally add {-# OPTIONS_GHC -fwarn-missing-signatures #-}  to .hs files to allow suggestions which usually increase readibility and support faster learning. This often shows me some signatures that I would never have worked out myself.

