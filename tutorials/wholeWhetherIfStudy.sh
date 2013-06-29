#!/bin/tcsh

####Alias for running CorpusSearch, including path to the CorpusSearch code on my computer.

set CS="java -classpath /Users/yoelw/CurrentLx/OldNorse/CS_2.003.03.jar csearch/CorpusSearch"




####Aliases for the various corpora the study will use, including paths to where the corpus files are stored in my computer.

set icepahc="/Users/yoelw/icecorpus/finished/*.psd"

set ycoe="/Users/yoelw/CurrentLx/OldNorse/historicalsyntaxcourse/YCOE/*.psd"

set ppcme2="/Users/yoelw/CurrentLx/OldNorse/ppcmeWork/*.ref"

set ppceme="/Users/yoelw/OldNorse/historicalsyntaxcourse/PENN-CORPORA/PPCEME-RELEASE-1/corpus/psd/*/*.psd"

set ppcmbe="/Users/yoelw/CurrentLx/OldNorse/historicalsyntaxcourse/PENN-CORPORA/PPCMBE/*.ref"



#### Run the English coding query on YCOE, PPCME2, PPCEME, PPCMBE.
#### The "rm" remove commands just delete any old versions of the output files.
#### The first line just lets the user know what's going on by outputing a message to the shell.

echo "Running English Study..."

rm whetherif.ymeb.cod
$CS whetherif.c $ycoe $ppcme2 $ppceme $ppcmbe -out whetherif.ymeb.cod

rm whetherif.ymeb.cod.ooo
$CS codes.q whetherif.ymeb.cod

####This produces an output file containing only the codes from the coding query, whetherif.ymeb.cod.ooo




#### Run the Icelandic coding query on IcePaHC
#### The "rm" remove commands just delete any old versions of the same files.

echo "Running Icelandic Study..."

rm whetherifice.ice.cod
$CS whetherifice.c $icepahc -out whetherifice.ice.cod

rm whetherifice.ice.cod.ooo
$CS codes.q whetherifice.ice.cod




#### The commands below run R scripts which read in codes generated by the CorpusSearch coding queries, fits a logistic model, outputs a summary of the model and model comparison, and then outputs various nice plots from the data. All of this happens in the current directory.

#### R script doing the above for the diachronic English data from the York-Toronto-Helsinki Corpus of Old English Prose and the Penn Historical Corpora.

echo "Running English Statistics..."

Rscript whetherif_newggplot2.R


####R script doing the above for the Icelandic Parsed Historical Corpus (IcePaHC) data.

echo "Running Icelandic Statistics..."

Rscript whetherifice_newggplot2.R
