# EIEIO
Report writing software for NEFSC groundfish assessments 

This code has been used to produce the assessment reports for the 2015 and 2017 groundfish stock assessments. 

Analysts modify a simple R script that points to assessment results and hold text for display. 
The code in this directory will take the user scripts and compile LaTex files to produce pdf of reports. These are later concatenated into a large report for submission to NEFSC publication office. There is also code to construct a largely automated executive summary. 



#Rscripts and summary
+ MakeUpdateDoc_Server1.r - user interface for an assessment based on one model
+ MakeUpdateDoc_2Models1.r - user interface for an assessment based on two models
#
+ EIEIO_functions.r - functions to produce a stand alone summary report for each stock 
+ EIEIO_functions2Model - functions to produce a stand alone summary report for each stock using 2 models 
#
+ MakeTexMaps.R - function to produce a pdf of maps made in the ADIOS! database viewer
+ ReName.r - functions to batch rename files required for inclusion in the SASINF database used to display assessment related data products. 
#
#BigReport/Rcode
+ MakeBigDoc4.R - harvest and compile results from individual MakeUpdateDoc*.r scripts and create some tables as well as calling the LaTex code to produce the big assessment report for publication.
+ TestChanges.R - simple sandbox 

#Still to do:
+ 508 compliance!

Tracking changes to EIEIO_functions here
 Versioning:
 10/2/15 table structure altered to prevent tables being split onto 2 pages
 10/14/15 command line interface no longer used. A LaTex file is now written and read by the LaTex compile command
 7/9/17 order rearranged to make debugging easier. To debug run from here to ~line 635





