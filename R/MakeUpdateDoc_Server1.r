#Remove all objects that currently exist in memory
rm(list=ls(all=TRUE))
#Load required packages
require(graphics)
if("lattice" %in% rownames(installed.packages()) == FALSE) {install.packages("lattice")}
require(lattice)
if("xtable" %in% rownames(installed.packages()) == FALSE) {install.packages("xtable")}
require(xtable)
#%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
#___________________________________________________________________________________________________
#********* Stuff you need to change for your species!!!  **********#
#[~]   #IF YOU NEED TO CHANGE SOMETHING FOR YOUR SPECIES - IT WILL BE MARKED WITH "#[~]" SEARCH FOR THAT!
#ALL REQUIRED CHANGES ARE IN THE TOP 300 LINES OR SO.   
#Top level control variables
dir1<-"/net/home2/dhennen/testEIEIO/test_example/"        #[~]
SppName<-"generic fish species"                           #[~]
SppLatinName<-"Pseudopisces examplus"                     #[~]
Draft<-TRUE                                               #[~] is this a draft? if final document use "FALSE"
report.yr<-2012                                           #[~] The year that will go into the report title
term.yr<-2010                                             #[~]
last.assessment<-2008                                     #[~]
#fnames<-c("catch_data.csv","model_results.csv","survey_results.csv") #[~] option to change the 
#file names for your input files the order is important!! {catch data first, then model results then survey data} !!!!!

#______________________________________________________________________________________________
#setup (don't modify this!) 
{
#*********************************************************************************
#source standard functions & set up directories - DO NOT MODIFY (OR MOVE) THIS!!#*
#this should not overwrite existing directories                                 #*
#%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%#*
#build a system command with R variables                                        #*
dir.func=paste("~dhennen/EIEIO/",sep="")                                        #*
cmd1<-paste("cd ",dir1,"; mkdir -p Rcode; mkdir -p data; mkdir -p figures;"     #*
            ," mkdir -p latex; mkdir -p tables; cp ",paste(dir.func             #*
            ,"LaTex/",sep=""),"*"," latex/; cp -n ",dir.func,"example_data/"    #*
            ,"*.csv data/;"                                                     #*
            ,sep=""                                                             #*                           
)                                                                               #*
system(cmd1)                                                                    #*
source(paste(dir.func,"EIEIO_functions.r",sep=""))                              #*
if("fnames"%in%objects()) get.data(dir1,fnames) else get.data(dir1)             #*
SppLatinName.ital<-paste(" (\\\\textit{",SppLatinName,"})",sep="")              #*
#*********************************************************************************
}  
#_______________________________________________________________________________________________
#Go ahead and modify below here...
{
#[~] 
pdf.name<-paste(gsub(" ", "_",SppName, fixed = TRUE),"_Update_",getTimeFlag(),".pdf",sep="")        #[~] name of pdf
#you will make.  This gives a unique name to each instance this is run based on system time.  If you want to overwrite
#your pdf each time, but like the name - use this (just uncomment the line below):
#pdf.name<-paste(gsub(" ", "_",SppName, fixed = TRUE),"_Update.pdf",sep="")  

#[~] 
#if you want to substitute an Favg over a certain set of ages for FFull - uncomment this (and adjust the ages!):  
#MakeFavg(age1=3,age2=7)
#FFull.tx=Favg.tx


ci.method<-"lognormal" #method for calculating confidence intervals  #[~]
#from model results cv's can be "lognormal", "gamma" or "normal" (use "normal" for VPA confidence intervals) 
bounds<-90 #How big (in percentile units) do you want your ci's to be? #[~]

#[~]
#BRP Table values (these will appear exactly as you type them if you enclose with "")
FMSY<-c("0.20","0.27 (0.24 - 0.31)") #old and new FMSY                      #[~]
SSBMSY<-c("11,447","10,051 (8,092 - 12,187)") #old and new SSB with CI      #[~]
MSY<-c("2,352","2,075 (1,785 - 2,362)")                                     #[~]
#Recr<-c("11,906","9,076")                                                    #[~]

#[~]
#point estimates - need to be numeric for calculations
FMSYpt.est<-0.27                                                              #[~]
SSBMSYpt.est<-10051                                                           #[~]

#[~]
#Other BRP values
SSBthreshold<-0.5*SSBMSYpt.est                                                #[~]
SSBtarget<-SSBMSYpt.est                                                       #[~]
Fthreshold<-FMSYpt.est                                                        #[~]
Ftarget<-FMSYpt.est                                                           #[~]

#[~]
#Projection table values
PYear<-c(2011,2012,2013,2014)                                            #[~]
PCatch<-c("848", "1207", "1273", "1465")                                        #[~]
#--note that Projected SSB continues onto 2 lines in the below example--#
PSSB<-c("5212 (4952 - 5561)","5995 (5123 - 6745)", "6819 (5880 - 7732)"
        ,"7741 (6741 - 8754)")          #[~]
#Please use 3 significant digits
PF<-c("0.471", "0.270","0.270","0.270")                                               #[~]
#**** NOTE OFL removed from table, but should be mentioned in caption
#OFL<-c("2,100","1,900", "1,657", "2,292", "2,292", "2,292")                         #[~]

#[~]
#units for each category 
CatchUnits<-" (mt)"                                                           #[~]
SSBUnits<-" (mt)"                                                             #[~]
RecrUnits<-" (000s)"                                                          #[~]
SurveyUnits<-" (kg)"                                                          #[~]

#[~]
#Status text variables PLEASE USE THE EXACT WORDING SHOWN !   (these exact words trigger a switch in the BRP table - others give you a blank)
Bstatus<-"overfished" #"not overfished"                                       #[~]
Fstatus<-"overfishing is occurring"  #"overfishing is not occurring"          #[~]
Bstatus_old<-"overfished" #"not overfished"                                       #[~] #status as of previous assessment
Fstatus_old<-"overfishing is not occurring"  #"overfishing is not occurring"       #[~]
BRho.old<-"0.27" #the 7 year Mohn's rho on SSB from the last assessment             #[~]
BRho.now<-"0.59" #the 7 year Mohn's rho on SSB from the current assessment          #[~]
FRho.old<-"0.28" #the 7 year Mohn's rho on F from the last assessment               #[~]
FRho.now<-"0.49" #the 7 year Mohn's rho on F from the current assessment            #[~]

Rho.adj<-T  #You must use T if you are adjusting your terminal B and F values for status determination   #[~]
            # if you are just reporting rho adjusted values (not using for status) use F #
F.retro.adj<-0.75  #terminal F adjusted for retro (if applicable)   #[~]
B.retro.adj<-2800  #terminal B adjusted for retro (if applicable)   #[~]

BRho.old<-"0.14"  #the 7 year Moh'n rho on SSB from the last assessment             #[~]
BRho.now<-"1.06"  #the 7 year Moh'n rho on SSB from the current assessment          #[~]
FRho.old<-"-0.16" #the 7 year Moh'n rho on F from the last assessment               #[~]
FRho.now<-"-0.53" #the 7 year Moh'n rho on F from the current assessment            #[~]

#Confidence limits only used for rho adjust decision
BCL<-c("355", "739")  # the cofidence limits around the terminal B from the model #[~]
FCL<-c("1.053","2.348")  # the cofidence limits around the terminal B from the model #[~]

# Status table variable 
# How many years (previous to current year) of landings/SSB/F/Recruits should we show? 
# You may want to reduce this number if your status table is too wide!
step.back<-9                                                                  #[~]
Stretch<-1.0    #adjust this up if your tables look too cramped vertically (don't want to go much higher than 1.2)  #[~]
}  #table values #[~]
#_______________________________________________________________________________________________
{
#Names for each data source - these should be the exact names in your .csv header rows!!
  #***** NOTE R DOES NOT LIKE VARIABLE NAMES THAT START WITH NUMBERS *******#
#[~]
#Catch data first - put them in the order you want them displayed...  They don't need to be in 
#this order in your catch data file, but there does need to be something for Fleet1, the others
#are nit required (e.g. you can have Fleet1, Fleet4 and Fleet7 only - just make sure that you fill
#in the corresponding table names below Fleet1.names, Fleet4.name, Fleet7.name - see line ~185)
CYear<-"Year"                #Year column in the catch data                                #[~]
Fleet1<- "recdisc"      #e.g. recreational discards                                        #[~] #You must have a fleet 1!!
Fleet2<- "recland"      #e.g. recreational landings                                        #[~]
Fleet3<-"comdisc"      #e.g.Commercial discards                                            #[~]
Fleet4<-"comland"      #e.g.Commercial landings                                            #[~]
Fleet5<-"Cadisc"      #e.g.Canadian discards                                               #[~]
Fleet6<-"Caland"      #e.g.Canadian landings                                               #[~]
Fleet7<-NULL     #Other discards                                                           #[~]
Fleet8<-NULL     #Other landings                                                           #[~]
Total<-"total"  #Total removals for table (sometimes not = to sum landings + sum discards) #[~]
#If there are any fleets you do not want included in table 1 - you can use this optional vector to 
#not include them - just uncomment below
#ExcludeFromTab1<-c(Fleet5,Fleet6)    #fleets to not include in table 1                     #[~]

#[~]
#survey Data
SurvYear<-"Year"             #Year column in the survey data                    #[~]
Survey1<-"NEFSC_Spring"      #First survey (they will be shown in this order)   #[~]
Survey1.CV<-"NEFSC_SpringCV" #First survey cv                                   #[~]
Survey2<-"NEFSC_Fall"        #Second survey                                     #[~]
Survey2.CV<-"NEFSC_FallCV"   #etc...                                            #[~]
Survey3<- "MADMF_Spring"                                                        #[~]
Survey3.CV<- "MADMF_SpringCV"                                                   #[~]
Survey4<-"NEFSC_Shrimp"                                                         #[~]
Survey4.CV<-"NEFSC_ShrimpCV"                                                    #[~]
Survey5<-NULL                                                                   #[~]
Survey5.CV<-NULL                                                                #[~]
Survey6<-NULL                                                                   #[~]
Survey6.CV<-NULL                                                                #[~]
Survey7<-NULL                                                                   #[~]
Survey7.CV<-NULL                                                                #[~]
Survey8<-NULL                                                                   #[~]
Survey8.CV<-NULL                                                                #[~]
#[~]
#Model Output
ModYear<-"Year"                                                            #[~]      
ModSSB<-"SSB"                 #SSB estimates from the current model        #[~]
ModSSB.CV<-"SSBCV"            #CV on SSB from the current model            #[~]
FF<-"F"                       #F estimates from the current model          #[~]
FF.CV<-"FCV"                  #CV on F estimates from the current model    #[~]
Recruits<-"Recruits"                                                       #[~]
Recruits.CV<-"RecruitsCV"                                                  #[~]
SSB.old<-"SSB_old"           #SSB estimates from previous assessment       #[~]   
F.old<-"F_old"               #F estimates from previous assessment         #[~]
Recruits.old<-"Recruits_old" #etc                                          #[~]

#*********************************#
#     ATTENTION VPA USERS:        #
#*********************************#
#if you want to enter the exact values
#for your confidence intervals rather 
#than use a CV and allow the script to 
#generate approximate ones, use this (uncomment and modify):
#ModSSB.CI.VPA<-c(3000,5562)
#FF.CI.VPA<-c(0.30,0.86)
#Recruits.CI.VPA<-c(1.365e3,2.436e4)
#NOTE - make sure you describe your confidence
#intervals in the figure captions!!!
#*********************************#
#_______________________________________________________________________________________________
#Names for data sources in tables/figs these should exactly how you want them to print!!
#[~]
#Fishery names
Fleet1.name<-"Recreational discards"      #display name for fleet1    #[~]
Fleet2.name<-"Recreational landings"      #display name for fleet2    #[~]
Fleet3.name<-"Commercial discards"      #display name for fleet3      #[~]
Fleet4.name<-"Commercial landings"      #display name for fleet4      #[~]
Fleet5.name<-"CA discards"         #display name for fleet5           #[~]
Fleet6.name<-"CA landings"         #display name for fleet16          #[~]
Fleet7.name<-NULL        #etc...                                      #[~]
Fleet8.name<-NULL        #                                            #[~]
Total.name<-"Catch for Assessment"                                                                        #[~]

#[~]
#Survey names
Survey1.name<-"NEFSC Spring"      #First survey (they will be shown in this order)    #[~]
Survey2.name<-"NEFSC Fall"        #Second survey                                      #[~]
Survey3.name<-"MADMF Spring"                                                          #[~]
Survey4.name<-"NEFSC Shrimp"                                                          #[~]
Survey5.name<-NULL                                                                    #[~]
Survey6.name<-NULL                                                                    #[~]
Survey7.name<-NULL                                                                    #[~]
Survey8.name<-NULL                                                                    #[~]

#[~]
#Model Results Names
ModSSB.name<-"Spawning Stock Biomass"                 #[~]
FF.name<-FFull.tx                                     #[~]
Recruits.name<-"Recruits (age 3)"                     #[~]
Old.Recruits.name<-"Recruits_old"                     #[~]

#[~]
#BRP Table Names
FMSY.name<-FMSYproxy.tx   #F.MSY.tx                                      #[~]
SSBMSY.name<-paste(SSBMSY.tx,SSBUnits,sep="")                            #[~]
MSY.name<-paste("MSY",CatchUnits,sep="")                                 #[~]
#OFL.name<-paste("OFL",CatchUnits,sep="")                                 #[~] Removed from table
BRP.Recruits.name<-paste("Median recruits (age 3)",RecrUnits,sep="")     #[~]
F.Status.name<-F.Status.tx                                               #[~]                                                                   #[~]
B.Status.name<-B.Status.tx                                               #[~]                                                                        #[~]


#%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%#

#Need to get some values from the input model results and pretty them up for display
save(list = ls(all = TRUE), file = "TextVals.RData");PullTextValues(); #DON'T CHANGE/REMOVE THIS!!
# You now have (where applicable):
# term.SSB the terminal SSB used for status determination
# perc.SSBMSY the % of the target that term.SSB1 represents
# term.F the terminal F used for status determination
# perc.FMSY the % of the target that term.F1 represents
# val.SSBMSY a pretty version of the BMSY point estimate
# first.mod.yr the first year of the model
# NOTE: these values take the rho adjustment into consideration (check the flag on line 106 to make sure)

}  #data names #[~]
#_______________________________________________________________________________________________
{
#_______________________________________________________________________________________________
#
#                             Text Portion: (Modify for your assessment)
#_______________________________________________________________________________________________  
  
# ALL TEXT CAN BE PASTED IN ONE LINE - AS LONG AS IT IS BETWEEN QUOTES!!  I ONLY BROKE THESE UP TO
# MAKE THEM EASIER TO SEE...  NOTE THAT R VARIABLES CAN'T BE INSIDE QUOTES ... THE PASTE FUNCTION
# USED HERE CONCATENATES THINGS BETWEEN COMMAS, SO R VARIABLES (NO QUOTES) AND YOUR TEXT (QUOTES)
# CAN BE STRUNG TOGETHER.

#[~]
#Preamble explaining a bit about the special circumstances of the current assessment.  This can be left blank
#e.g. Preamble<-"" and nothing will be added
Preamble<-paste("This assessment of the ",SppName, SppLatinName.ital," stock is an operational assessment of the "
                ,"existing ",last.assessment," benchmark VPA assessment (NEFSC 2008). "
                ,"Based on the previous assessment the stock was overfished, but overfishing was not occurring. "
                ,"This assessment "
                ,"updates commercial fishery catch data, research survey indices "
                ,"of abundance, and the analytical VPA assessment "
                ,"models and reference points through ", term.yr ,". Additionally, stock projections have been updated through "
                ,PYear[length(PYear)]
,sep="")


#[~]
#State of stock paragraph (not much text to change - mostly automatic variables):
StateOfStock<-paste(sosHead.tx,"Based on this updated assessment, ",SppName,SppLatinName.ital
  ," stock is ", Bstatus," and ",Fstatus, fig1.2.ref,". "
  ," Retrospective adjustments were made to the model results. "
  ," Spawning stock biomass (SSB) in "
  ,term.yr," was estimated to be "
  ,term.SSB 
  ,SSBUnits," which is "
  ,perc.SSBMSY
  ,"% of the biomass target (",SSBMSYproxy.tx," = "
  ,val.SSBMSY,"; ",fig1.ref,").  The "     
  ,term.yr," fully selected fishing mortality was "
  ,"estimated to be "
  ,term.F
  ," which is "
  ,perc.FMSY
  ,"% of the overfishing threshold proxy (",FMSYproxy.tx," = ",FMSYpt.est,"; ", fig2.ref,")."
  ,sep=""  
)

#[~]
#Projections text (this one will require some alterations based on your methods):
Project<-paste(ProjHead.tx,"Short term projections of biomass were derived by sampling from a cumulative "
  ," distribution "
  ," function of recruitment estimates from ADAPT VPA (with split time series between 1994 and 1995)."
  ," The annual fishery selectivity, maturity ogive, and mean weights at age used  in projection "
  ," are the most recent 5 year averages; "              
  ," retrospective adjustments were applied in the projections."
  ,sep="" 
)

#Special comments section (these will depend completely on your assessment!):
#The following questions will appear in your document answer using your expert opinion as lead analyst for your stock.
#If you cannot answer, or the question does not apply to your stock, anwer "Not applicable" or "None" or something similar.

# 1. What are the most important sources of uncertainty in this stock assessment? 
#   Explain, and describe qualitatively how they affect the assessment results 
#   (such as estimates of biomass, F, recruitment, and population projections). 
# 2. Does this assessment model have a retrospective pattern? If so, is the pattern strong, moderate, or mild?
# 3. Based on this stock assessment, are population projections well determined or uncertain? 
# 4. Describe any changes that were made to the current stock assessment, beyond incorporating additional years of data
#   and the affect these changes had on the assessment and stock status.
# 5. If the stock status has changed a lot since the previous assessment, explain why this occurred.
# 6. Indicate what data or studies are currently lacking and would be needed most to improve this stock assessment in the future.
# 7. Are there other important issues?

#%%%%%%----------IMPORTANT: Please do not comment out the questions!!!!--------%%%%%#
save(list = ls(all = TRUE), file ="CIVals.RData");PullCI(); #Leave this in to get your confidence limits on SSB and F
#They will be BCLL, BCLU and FCLL,FCLU #


SpecialComments<-paste(SpecComHead.tx
  #Question 1 
  ,item.tx
  ,"What are the most important sources of uncertainty in this stock assessment? " 
  ," Explain, and describe qualitatively how they affect the assessment results "
  ,"(such as estimates of biomass, F, recruitment, and population projections). "
  ,lbreak.tx,indent.tx," \\\\textit{"
  
  #[~]  Your answer here:
  ,"The largest source of uncertainty is the estimate of natural mortality based on longevity, "
  ,"which is not well studied in ",SppName 
  ,", and assumed constant over time.  Natural mortality affects the scale of the biomass and fishing mortality estimates. "
  ,"Other sources of uncertainty include possible changes in growth parameters over time and unreported recreational discarding, "
  ," niether of which had a substantial affect on model outcomes in sensitivity runs."

  #Question 2                      
  ,"} ",item.tx
  ," Does this assessment model have a retrospective pattern? If so, is the pattern minor, or major?"
  ," (A major retrospective pattern occurs when the adjusted SSB or ",FFull.tx," lies outside of the approximate "
  ," joint confidence region for SSB and ",FFull.tx
  ,")."
  #,"; see ",RhoDecisionTab.ref,")." #Only include this line when preparing for the big report - the reference won't work
                                    #without the executive summary.
  ,lbreak.tx,indent.tx," \\\\textit{"
  
   #[~]  Your answer here:          

    #------------retro adjustment standard text here -------------#
  ," The 7-year Mohn's ",rho.tx,", relative to SSB, was ",BRho.old," in the ", last.assessment, " assessment and was "
  ,BRho.now," in ",term.yr,"."
  ," The 7-year Mohn's ",rho.tx,", relative to F, was ",FRho.old," in the ", last.assessment, " assessment and was "
  ,FRho.now," in ",term.yr,"."
  ," There was a major retrospective pattern for this assessment because the ",rho.tx
  ," adjusted estimates of ",term.yr," SSB ","(", rhoSSB.tx,"=",B.retro.adj,") and ",term.yr," F (",rhoF.tx,"=",F.retro.adj,")"
  ," were outside the approximate 90% confidence regions around SSB ("
  ,prettyNum(BCLL,big.mark=",",scientific=F)," - ",prettyNum(BCLU,big.mark=",",scientific=F)
  ,") and F (",FCLL," - ",FCLU,"). "                   #****Using these values requires the PullCI function****#
  ," A retrospective "
  ," adjustment was made for both the determination of stock status and for projections of catch in ",PYear[2],"."  
  ," The retrospective adjustment changed the ",term.yr," SSB from "
  ,prettyNum(dt2[dt2[,ModYear]==term.yr,ModSSB],big.mark=",",scientific=F)
  ," to ", term.SSB," and the ",term.yr," ",FFull.tx
  ," from ",dt2[dt2[,ModYear]==term.yr,FF]," to ",term.F,"."
  #-------------------------------------------------------------#
  
  #Alt0
  #," The model used to estimate status of this stock does not allow estimation of a retrospective pattern. "
  #Alt1
  #," No retrospective adjustment of spawning stock biomass or fishing mortality in ",term.yr," was required. "
  
  #," Projections for catches in ",PYear[2]," and beyond are based on adjusting all numbers at age in "
  #, PYear[1]," by applying the age specific Mohn's ",rho.tx," for numbers at age (the scalar Mohn's ",rho.tx
  #," for SSB to all numbers at age)"
  
  #^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  
  #Question 3  
  ,"} ",item.tx
  ,"Based on this stock assessment, are population projections well determined or uncertain? If this stock is in a "
  ," rebuilding plan, how do the projections compare to the rebuilding schedule?"
  ,lbreak.tx,indent.tx," \\\\textit{"

  #^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  
  #[~]  Your answer here:                     
  ,"Population projections for ", SppName ,", are reasonably well determined and projected biomass from the last assessment "
  ," was within the confidence bounds of the biomass estimated in the current assessment. This stock was not in a rebuilding"
  ," plan."
                       
  #Question 4  
  ,"} ",item.tx
  ,"Describe any changes that were made to the current stock assessment, beyond incorporating additional years of data "
  ," and the effect these changes had on the assessment and stock status."
  ,lbreak.tx,indent.tx," \\\\textit{"

  #[~]  Your answer here:                     
  ," No changes, other than the incorporation of new data were made to the ",SppName," assessment for this update."
  ," However, commercial discards were increased over the last ten years due to an adjustment in NEFSC discard estimation "
  ," methodology."                       
  
  #Question 5                        
  ,"} ",item.tx
  ,"If the stock status has changed a lot since the previous assessment, explain why this occurred. "
  ,lbreak.tx,indent.tx," \\\\textit{"

  #[~]  Your answer here:
  ,"The overfishing status of ",SppName, " changed due to the increase in estimated commercial discards, which increased catch "
  ," relative to estimated biomass."
  
  #^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^  
  #Question 6 
   ,"} ",item.tx
  ,"Provide qualitative statements describing the condition of the stock that relate to stock status. "
  ,lbreak.tx,indent.tx," \\\\textit{"
                       
  #[~]  Your answer here:                       
  ,"The ",SppName," shows a truncated age structure, consistent with high fishing mortality on the oldest ages of fish. "
  ," Estiamtes of commercial discards have increased over time, while biomass estiamtes have decreased, resulting in an "
  ," increase in fishing mortality."  

  #^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  
  #Question 7   
  ,"} ",item.tx
  ,"Indicate what data or studies are currently lacking and which would be needed most to improve this stock assessment in the future. "
  ,lbreak.tx,indent.tx," \\\\textit{"
                       
  #[~]  Your answer here:                       
  ,"The ",SppName," assessment could be improved with additional studies on growth and maximum age, as well more precise estimates "
  ," of recreational landings and discards."                       
  
  
  #Question 8                     
  ,"} ",item.tx  
  ,"Are there other important issues?",lbreak.tx,indent.tx," \\\\textit{"                     
                       
  #[~]  Your answer here:                       
  ,"The review panel requested several sensitivity runs that are available on the Stock Assessment Supplementary Information "
  ," website (",PortalLink.tx,")."
  
                       
  ,"}",enditem.tx
  ,sep=""  
)

#[~]
#Reference previous assessment/update:
References<-paste( RefHead.tx,lbreak.tx
  ,"Smith, A. and S. Jones.  2008.  In.  Northeast Fisheries Science Center. 2008. Assessment of 19 Northeast Groundfish Stocks "
  ,"through 2007: Report of the 3rd Groundfish Assessment Review Meeting (GARM III), Northeast Fisheries Science Center, Woods"
  ," Hole, Massachusetts, August 4-8, 2008. US Dep Commer, NOAA Fisheries, Northeast Fish Sci Cent Ref Doc. 08-15; 884 p + xvii. "
  ,"http://www.nefsc.noaa.gov/publications/crd/crd0815/"
  ,lbreak.tx,lbreak.tx
  ,sep=""
)

}  #text #[~]
#_______________________________________________________________________________________________
{
#%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
#                           Table Captions (requires your input!)
#__________________________________________________________________________________________________  
#[~] 
CatchStatusTab.cap<-paste("Catch and status table for ",SppName,".  All weights are in "
  ,CatchUnits," recruitment is in", RecrUnits," and ", FFull.tx," is the fishing mortality on fully "
  ,"selected ages (ages 8 and 9). Model results are from the current updated VPA assessment."                   
                          ,sep="")

#[~]
BRPTab.cap<-paste(" Comparison of reference points estimated in an earlier assessment and from the current "
 ," assessment update."
 ," An ",F40.tx," proxy was used for the overfishing threshold and was based on long-term stochastic projections."                
  ,sep="")

#[~]
ProjTab.cap<-paste("Short term projections of total fishery catch and spawning stock biomass for "
  ,SppName, " based on a harvest scenario of fishing at ", FMSYproxy.tx
  ," between ",PYear[3]," and ",PYear[length(PYear)],". Catch in ",PYear[2]," was assumed to be "
  ,prettyNum(PCatch[2],big.mark=",",scientific=F) ,CatchUnits,". The catch in ",PYear[1],", ",
  prettyNum(PCatch[1],big.mark=",",scientific=F) ,CatchUnits," is also the ",PYear[1]," OFL."
  #," ... Species specific information goes here... "
  ,sep="")

#[~]
figFish.cap<-paste("Total catch of ",SppName 
  ," between ",min(dt2[,ModYear])," and ",max(dt2[,ModYear])
  ," by fleet (commercial, recreational, or Canadian) and disposition (landings and discards)."
  ,sep=""
)

#[~]
figSurv.cap<-paste("Indices of biomass for the ",SppName
  ," between ",min(dt3[,SurvYear])," and ",max(dt3[,SurvYear])
  ," for the Northeast Fisheries Science Center (NEFSC) spring and fall bottom trawl "
  ,"surveys."
  ,"  The approximate ",bounds,"% ",ci.method," confidence intervals are shown."
  ,sep=""
)

#[~]
figSSB.cap<-paste("Trends in spawning stock biomass of ",SppName
  ," between ",min(dt2[,ModYear])," and ",max(dt2[,ModYear])," from the current  (solid line) "
  ,"and previous (dashed line) assessment and the corresponding ",SSBthresh.tx
  ," (", half.tx, SSBMSYproxy.tx ,"; horizontal dashed line) as well as ",SSBtarg.tx
  ," (",SSBMSYproxy.tx,"; horizontal dotted line) " 
  ," based on the ",report.yr," assessment.  Biomass was adjusted for a retrospective pattern "
  ," and the adjustment is shown in red. "                
  ," The approximate ",bounds,"% ",ci.method," confidence intervals are shown."
  ,sep="")

#[~]
figF.cap<-paste("Trends in the fully selected fishing mortality (",FFull.tx,")"
  ," of ",SppName," between ",min(dt2[,ModYear])," and ",max(dt2[,ModYear])," from the current "
  ," (solid line) and previous (dashed line) assessment and the"
  ," corresponding ",Fthresh.tx
  ," (",FMSYproxy.tx,"=",FMSYpt.est,"; horizontal dashed line). "
  ,FFull.tx, " was adjusted for a retrospective pattern "
  ," and the adjustment is shown in red. "              
  #," as well as ",Ftarg.tx
  #," (0.4 *",FMSY.tx,"; dotted line) " 
  ," based on the ",report.yr," assessment."
  ," The approximate ",bounds,"% ",ci.method," confidence intervals are shown."
  ,sep="")

#[~]
figRecr.cap<-paste("Trends in ",Recruits.name,RecrUnits," of "
  ,SppName, " between ",min(dt2[,ModYear])," and ",max(dt2[,ModYear])
  ," from the current (solid line) and previous (dashed line) assessment." 
 ," The approximate ",bounds,"% ",ci.method," confidence intervals are shown."
  ,sep=""
)

#_______________________________________________________________________________________________
}  #figure and table captions  #[~]
#%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
#               ***********     End user modification section    ***************
#_______________________________________________________________________________________________
#%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

#__________________________________________________________________________________________________
#$$$$$$$$$$$$$$$$$$$$$$$$$$$ NO USER MODIFICATION BELOW THIS POINT $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
#%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
save(list = ls(all = TRUE), file = "AutoAss.RData");FinishAutoAssess(); #DON'T CHANGE/REMOVE THIS!!
#%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
#+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++END

