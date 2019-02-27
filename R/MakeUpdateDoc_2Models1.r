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
#************** Stuff you need to change for your species!!!  **************#
#___________________________________________________________________________________________________
#[~]   #IF YOU NEED TO CHANGE SOMETHING FOR YOUR SPECIES - IT WILL BE MARKED WITH "#[~]" SEARCH FOR THAT!
#ALL REQUIRED CHANGES ARE IN THE TOP 300 LINES OR SO.   
#Top level control variables
SppName<-"Gulf of Maine Atlantic cod"  #[~]
SppLatinName<-"Gadus morhua"           #[~]
Draft<-TRUE                            #[~] is this a draft? if final document use "FALSE"
term.yr<-2011                          #[~]
report.yr<-2012                        #[~] The year that will go into the report title
last.assessment<-2010                  #[~] this refers to year in which your species was last assessed (e.g. the 
                                           # comparison year for your BRP).
dir1<-"/net/home2/dhennen/testEIEIO/test_2model/"  #[~]
#fnames<-c("catch_data.csv","model_results.csv","survey_results.csv") #[~] option to change the 
#file names for your input files the order is important!! {catch data first, then model results then survey data} !!!!!                                                                    
#___________________________________________________________________________________________________
{
#*********************************************************************************
#source standard functions & set up directories - DO NOT MODIFY (OR MOVE) THIS!!#*
#this should not overwrite existing directories                                 #*
#%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%#*
#build a system command with R variables                                      #*
dir.func=paste("~dhennen/EIEIO/",sep="")                                      #*
cmd1<-paste("cd ",dir1,"; mkdir -p Rcode; mkdir -p data; mkdir -p figures;"   #*
            ," mkdir -p latex; mkdir -p tables; cp ",paste(dir.func           #*
            ,"LaTex/",sep=""),"*"," latex/; cp -n ",dir.func                  #*
            ,"example_data/multiModel/" ,"*.csv data/;"                       #*
            ,sep=""                                                           #*                           
)                                                                             #*
system(cmd1)                                                                  #*
source(paste(dir.func,"EIEIO_functions.r",sep=""))                            #*
source(paste(dir.func,"EIEIO_functions2Model.r",sep="")) 
if("fnames"%in%objects()) get.data(dir1,fnames) else get.data(dir1)             #*                                                               #*
SppLatinName.ital<-paste(" (\\\\textit{",SppLatinName,"})",sep="")            #*
#*********************************************************************************
}  #setup (don't modify this!)
#____________________________________________________________________________________________________
{
#[~]
pdf.name<-paste(gsub(" ", "_",SppName, fixed = TRUE),"_Update_",getTimeFlag(),".pdf",sep="")        #[~] name of pdf
#you will make.  This gives a unique name to each instance this is run based on system time.  If you want to overwrite
#your pdf each time, but like the name - use this (just uncomment the line below):
#pdf.name<-paste(gsub(" ", "_",SppName, fixed = TRUE),"_Update.pdf",sep="") 
  
ci.method<-"lognormal" #method for calculating confidence intervals  #[~]
#from model results cv's can be "lognormal" or "gamma"
bounds<-90 #How big (in percentile units) do you want your ci's to be? #[~]

#[~]
#BRP Table values (these will appear exactly as you type them if you enclose with "")
FMSY<-c(0.08,0.12,0.10,0.18) #old and new FMSY for 2 models                                          #[~]
SSBMSY<-c("61,118","61,218","54,743 (40,207 - 73,354)", "80,200 (64,207 - 99,354)") #old and new (2) SSB with CI       #[~]
MSY<-c("10,292","10,392","9,399 (6,806 - 13,153)", "13,399 (10,806 - 17,153)")                                     #[~]
Recr<-c("11,906","9,076","12,006","10,076")

#[~]
#point estimates - need to be numeric for calculations
FMSYpt.est1<-0.18                                                              #[~]
SSBMSYpt.est1<-54743                                                           #[~]
#From second model...
FMSYpt.est2<-0.18                                                              #[~]
SSBMSYpt.est2<-80200

#[~]
#Other BRP values
SSBthreshold1<-0.5*SSBMSYpt.est1                                                #[~]
SSBtarget1<-SSBMSYpt.est1                                                       #[~]
Fthreshold1<-0.4*FMSYpt.est1                                                    #[~]
Ftarget1<-FMSYpt.est1                                                           #[~]
#and from second model
SSBthreshold2<-0.5*SSBMSYpt.est2                                                #[~]
SSBtarget2<-SSBMSYpt.est2                                                       #[~]
Fthreshold2<-0.4*FMSYpt.est2                                                    #[~]
Ftarget2<-FMSYpt.est2 


#[~]
#Projection table values
PYear<-c(2011,2012,2013,2014,2015)                                            #[~]
PCatch1<-c(6830,3767,1249,1503,2030)                                          #[~]
PSSB1<-c(9903,8995,9406,12143,16802)                                          #[~]
PF1<-c(0.86,0.46,0.14,0.14,0.14)                                              #[~]                                              #[~]
#OFL1<-c("1000","1500","1200","1400","1000")                                    #[~]
#Projection table values for the second model
PCatch2<-c(6830,3767,604,1057,2034)                                           #[~]
PSSB2<-c(9903,3022,4460,8611,15802)                                           #[~]
PF2<-c(0.86,0.80,0.18,0.18,0.18)                                              #[~]
#OFL2<-c("1000","1500","1200","1400","2000")                                     #[~]
#[~]
#units for each category 
CatchUnits<-" (mt)"                                                           #[~]
SSBUnits<-" (mt)"                                                             #[~]
RecrUnits<-" (000s)"                                                          #[~]
SurveyUnits<-" (mt)"                                                          #[~]

Rho.adj1<-T  #You must use T if you are adjusting your terminal B and F values for status determination   #[~]
            # if you are just reporting rho adjusted values (not using for status) use F #
Rho.adj2<-T  #You must use T if you are adjusting your terminal B and F values for status determination   #[~]
            # if you are just reporting rho adjusted values (not using for status) use F #
F.retro.adj1<-0.75  #Model 1 terminal F adjusted for retro (if applicable)   #[~]
B.retro.adj1<-5000  #Model 1 terminal B adjusted for retro (if applicable)   #[~]
F.retro.adj2<-0.75  #Model 2 terminal F adjusted for retro (if applicable)   #[~]
B.retro.adj2<-5000  #Model 2 terminal B adjusted for retro (if applicable)   #[~]
BRho.old1<-"0.27" #the 7 year Moh'n rho on SSB from the last assessment mod1            #[~]
BRho.now1<-"0.59" #the 7 year Moh'n rho on SSB from the current assessment mod1          #[~]
FRho.old1<-"0.28" #the 7 year Moh'n rho on F from the last assessment mod1              #[~]
FRho.now1<-"0.49" #the 7 year Moh'n rho on F from the current assessment mod1            #[~]
BRho.old2<-"0.27" #the 7 year Moh'n rho on SSB from the last assessment  mod2           #[~]
BRho.now2<-"0.59" #the 7 year Moh'n rho on SSB from the current assessment mod2          #[~]
FRho.old2<-"0.28" #the 7 year Moh'n rho on F from the last assessment mod2              #[~]
FRho.now2<-"0.49" #the 7 year Moh'n rho on F from the current assessment  mod2          #[~]


#[~]
#Status text variables
Bstatus<-"overfished" #"not overfished"                                       #[~]
Fstatus<-"overfishing is occurring"  #"overfishing is not occurring"          #[~]
Bstatus2<-"overfished" #"not overfished"                                       #[~]
Fstatus2<-"overfishing is occurring"  #"overfishing is not occurring"          #[~]
Bstatus_old<-"overfished" #"not overfished"                                       #[~] #status as of previous assessment
Fstatus_old<-"overfishing is not occurring"  #"overfishing is not occurring"          #[~]
Bstatus_old2<-"overfished" #"not overfished"                                       #[~] #status as of previous assessment
Fstatus_old2<-"overfishing is not occurring"  #"overfishing is not occurring"          #[~]


# Status table variable 
# How many years (previous to current year) of landings/SSB/F/Recruits should we show? 
# You may want to reduce this number if your status table is too wide!
step.back<-9                                                                  #[~]
}  # table values #[~]
#_______________________________________________________________________________________________
{
#*********************************************************************************************************
#      Names for each data source - these should be the exact names in your .csv header rows!!           #
#*********************************************************************************************************

#[~]
#Catch data first - put them in the order you want them displayed...
CYear<-"Year"                #Year column in the catch data                                               #[~]
Fleet1<- "recdisc"      #e.g. recreational discards             #[~]
Fleet2<- "recland"      #e.g. recreational landings              #[~]
Fleet3<-"comdisc"      #e.g.Commercial discards                #[~]
Fleet4<-"comland"      #e.g.Commercial landings            #[~]
#Fleet5<-"Cadisc"      #e.g.Canadian discards               #[~]
#Fleet6<-"Caland"      #e.g.Canadian landings                #[~]
Fleet7<-NULL     #Other discards               #[~]
Fleet8<-NULL     #Other landings                #[~]
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
Survey3<-"MADMF_Spring"                                                         #[~]
Survey3.CV<-"MADMF_SpringCV"                                                    #[~]
Survey4<-NULL                                                                   #[~]
Survey4.CV<-NULL                                                                #[~]
Survey5<-NULL                                                                   #[~]
Survey5.CV<-NULL                                                                #[~]
Survey6<-NULL                                                                   #[~]
Survey6.CV<-NULL                                                                #[~]
Survey7<-NULL                                                                   #[~]
Survey7.CV<-NULL                                                                #[~]
Survey8<-NULL                                                                   #[~]
Survey8.CV<-NULL                                                                #[~]
#[~]
#Model Output - this section is modified to allow two models into the table
Mod1.name<-"M=0.2"
ModYear<-"Year"                                                                                           #[~]      
ModSSB1<-"SSB1"                                                                                            #[~]
ModSSB.CV1<-"SSBCV1"                                                                                       #[~]
FF1<-"F1"                                                                                                  #[~]
FF.CV1<-"FCV1"                                                                                             #[~]
Recruits1<-"Recruits1"                                                                                     #[~]
Recruits.CV1<-"RecruitsCV1"                                                                                #[~]
#Here is the second model and its inputs
Mod2.name<-"M-ramp"                                                                                #[~]      
ModSSB2<-"SSB2"                                                                                            #[~]
ModSSB.CV2<-"SSBCV2"                                                                                       #[~]
FF2<-"F2"                                                                                                  #[~]
FF.CV2<-"FCV2"                                                                                             #[~]
Recruits2<-"Recruits2"                                                                                     #[~]
Recruits.CV2<-"RecruitsCV2" 
#This is the old model
SSB.old1<-"SSB_old1"           #SSB estimates from previous assessment model 1                              #[~]   
F.old1<-"F_old1"               #F estimates from previous assessment  model 1                               #[~]
Recruits.old1<-"Recruits_old1" #etc                                                                         #[~]
SSB.old2<-"SSB_old2"           #SSB estimates from previous assessment    model 2                           #[~]   
F.old2<-"F_old2"               #F estimates from previous assessment  model 2                               #[~]
Recruits.old2<-"Recruits_old2" #etc                                                                         #[~]

#*********************************#
#     ATTENTION VPA USERS:        #
#*********************************#
#if you want to enter the exact values
#for your confidence intervals rather 
#than use a CV an allow the script to 
#generate approximate ones, use this (uncomment and modify):
#ModSSB.CI.VPA1<-c(3000,5562)
#FF.CI.VPA1<-c(0.30,0.86)
#Recruits.CI.VPA1<-c(1.365e3,2.436e4)
#ModSSB.CI.VPA2<-c(3000,5562)
#FF.CI.VPA2<-c(0.30,0.86)
#Recruits.CI.VPA2<-c(1.365e3,2.436e4)
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
Total.name<-"Catch for Assessment"                                    #[~]       

#[~]
#Survey names
Survey1.name<-"NEFSC Spring"      #First survey (they will be shown in this order)    #[~]
Survey2.name<-"NEFSC Fall"        #Second survey                                      #[~]
Survey3.name<-"MADMF Spring"                                                          #[~]
Survey4.name<-NULL                                                                    #[~]                                                                                        #[~]
Survey5.name<-NULL                                                                    #[~]
Survey6.name<-NULL                                                                    #[~]
Survey7.name<-NULL                                                                    #[~]
Survey8.name<-NULL                                                                    #[~]
#[~]
#Model Results Names
ModSSB.name<-"Spawning Stock Biomass"                                                                     #[~]
FF.name<-FFull.tx                                                                                         #[~]
Recruits.name<-"Recruits (age 1)"                                                                         #[~]

#[~]
#BRP Table Names
FMSY.name<-FMSY.tx                                                                                        #[~]
SSBMSY.name<-paste(SSBMSY.tx,SSBUnits<-" (mt)",sep="")                                                    #[~]
MSY.name<-paste("MSY",CatchUnits,sep="")                                                                  #[~]
BRP.Recruits.name<-paste("Median recruits (age 1)",RecrUnits,sep="")                                      #[~]
OFL.name<-"OFL"                                                                                           #[~]
F.Status.name<-F.Status.tx                                                                                #[~]
B.Status.name<-B.Status.tx                                                                                #[~]

#%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
#No need to mess with the part below - automated acquisition of some values...
#Need to get some values from the input model results and pretty them up for display
#Note you will get errors here if your terminal year (term.yr) or model year (ModYear)
#are outsie the range of years in your data!
save(list = ls(all = TRUE), file = "TextVals.RData");PullTextValues2Mod(); #DON'T CHANGE/REMOVE THIS!!
# You now have (where applicable):
# term.SSB1 the terminal SSB used for status determination
# perc.SSBMSY1 the % of the target that term.SSB1 represents
# term.F1 the terminal F used for status determination
# perc.FMSY1 the % of the target that term.F1 represents
# val.SSBMSY1 a pretty version of the BMSY point estimate
# first.mod.yr1 the first year of the model
# NOTE: these values take the rho adjustment into consideration (check the flag on line 107 to make sure)
# You have all of these for model 2 as well (e.g. term.SSB2)
}  #data names  #[~]
#______________________________________________________________________________________________________
{
#_______________________________________________________________________________________________
#
#                             Text Portion: (Modify if you wish)
#_______________________________________________________________________________________________
# ALL TEXT CAN BE PASTED IN ONE LINE - AS LONG AS IT IS BETWEEN QUOTES!!  I ONLY BROKE THESE UP TO
# MAKE THEM EASIER TO SEE...  NOTE THAT R VARIABLES CAN'T BE INSIDE QUOTES ... THE PASTE FUNCTION
# USED HERE CONCATENATES THINGS BETWEEN COMMAS, SO R VARIABLES (NO QUOTES) AND YOUR TEXT (QUOTES)
# CAN BE STRUNG TOGETHER.

#[~]
#Preamble explaining a bit about the special circumstances of the current assessment.  This can be left blank
#e.g. Preamble<-"" and nothing will be added
Preamble<-paste("This assessment of the ",SppName, SppLatinName.ital," stock is an update of the "
  ,"existing ",last.assessment," benchmark assessment (NEFSC 2010). This assessment updates commercial and "
  ,"recreational fishery catch data, research survey indices of abundance, and the analytical "
  ,"assessment models through ", term.yr ,". Additionally, stock projections have been updated through "
  ,PYear[length(PYear)],". In what follows, there are two population assessment models brought forward from the "
  ,last.assessment," benchmark assessment, the ",Mod1.name, " (natural mortality = 0.2) and the ",Mod2.name
  ," (M ramps from 0.2 to 0.4) assessment models (see NEFSC, 2013 for a full description of the model formulations)."
  ,sep="")

#[~]
#State of stock paragraph (not much text to change - mostly automatic variables):
StateOfStock<-paste(sosHead.tx,SppName,SppLatinName.ital
  ," stock is ", Bstatus," and ",Fstatus, fig1.2.ref
  ,". Spawning stock biomass (SSB) in "
  ,term.yr," was estimated to be "
  ,term.SSB1, " under the M=0.2 model and "
  ,term.SSB2, SSBUnits, " under the M-ramp model scenario (",tab1.ref
  ,") which is "
  ,perc.SSBMSY1,"% and ",perc.SSBMSY2 
  ,"% (respectively) of the ",SSBMSY.tx," proxy"
  ," (",val.SSBMSY1, " and ",val.SSBMSY2,"; ",fig1.ref,").  The "     
  ,term.yr," fully selected fishing mortality was "
  ,"estimated to be "
  ,term.F1," and ",term.F2
  ," which is "
  ,perc.FMSY1,"% and ",perc.FMSY2
  ,"% of the ",FMSY.tx," proxy (",FMSYpt.est1, " and ",FMSYpt.est2,"; ", fig2.ref,")."
  ,sep=""  
)

#[~]
#Projections text (this one will require some alterations based on your methods):
Project<-paste(ProjHead.tx," Short term projections sampled from a cumulative distribution "
  ,"function derived from ASAP estimated age 1 recruitment between ",first.mod.yr
  ," and 2009.  Recruitments in 2010 and 2011 were not included due to high variance.  No "
  ,"retrospective adjustments was applied in the projections.  The model adjusts projected "
  ,"recruitment when SSB falls below the ... More species specific information here ...."
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
  #This answer should follow the standard text for single model cases.  I did not program an equivalent 
  #confidence interval extraction function. So it will be up to the ananlyst to write in the appropriate values.
  #Choose one of the following three standard responses:
  
  #------------retro adjustment standard text here -------------#  
  #Alt0
  #," The model used to estimate status of this stock does not allow estimation of a retrospective pattern. "
  
  #Alt1
  ," No retrospective adjustment of spawning stock biomass or fishing mortality in ",term.yr," was required. "
  
  #Alt2 - Easiest to treat each model separately
#  ,"The ",Mod1.name," model had a major " #minor
#  ," retrospective pattern (7-year Mohn's ",rho.tx,", relative to SSB, was ",BRho.old1
#  ," in the ", last.assessment, " assessment and was ",BRho.now1," in ",term.yr," while F = ",FRho.old1," in "
#  , last.assessment," and ",FRho.now1," in ",term.yr,"."
#  ," There was a major retrospective pattern for this assessment because the ",rho.tx
#  ," adjusted estimates of ",term.yr," SSB ","(", rhoSSB.tx,"=",B.retro.adj1,") and ",term.yr," F (",rhoF.tx,"=",F.retro.adj1,")"
#  ," were outside the approximate 90% confidence regions around SSB ("
#  ,"(XXXX - XXXX)"," and F ( 0.XXX - 0.XXX). "," A retrospective "  #ADD CORRECT VALUES!!!!
#  ," adjustment was made for both the determination of stock status and for projections of catch in ",PYear[2],"."  
#  ," The retrospective adjustment changed the ",term.yr," SSB from "
#  ,prettyNum(dt2[dt2[,ModYear]==term.yr,ModSSB1],big.mark=",",scientific=F)
#  ," to ", B.retro.adj1," and the ",term.yr," ",FFull.tx
#  ," from ",dt2[dt2[,ModYear]==term.yr,FF1]," to ",F.retro.adj1,"."  
  
#  ," The ",Mod2.name," had a major " #minor
#  ," retrospective pattern (7-year Mohn's ",rho.tx,", relative to SSB, was ",BRho.old2
#  ," in the ", last.assessment, " assessment and was ",BRho.now2," in ",term.yr," while F = ",FRho.old2," in "
#  , last.assessment," and ",FRho.now2," in ",term.yr,"."
#  ," There was a major retrospective pattern for this assessment because the ",rho.tx
#  ," adjusted estimates of ",term.yr," SSB ","(", rhoSSB.tx,"=",B.retro.adj2,") and ",term.yr," F (",rhoF.tx,"=",F.retro.adj2,")"
#  ," were outside the approximate 90% confidence regions around SSB ("
#  ,"(XXXX - XXXX)"," and F ( 0.XXX - 0.XXX). "," A retrospective "  #ADD CORRECT VALUES!!!!
#  ," adjustment was made for both the determination of stock status and for projections of catch in ",PYear[2],"."  
#  ," The retrospective adjustment changed the ",term.yr," SSB from "
#  ,prettyNum(dt2[dt2[,ModYear]==term.yr,ModSSB2],big.mark=",",scientific=F)
#  ," to ", B.retro.adj2," and the ",term.yr," ",FFull.tx
#  ," from ",dt2[dt2[,ModYear]==term.yr,FF2]," to ",F.retro.adj2,"." 
  #-------------------------------------------------------------#  
                  
  #Question 3  
  ,"} ",item.tx
  ,"Based on this stock assessment, are population projections well determined or uncertain?"
  ,lbreak.tx,indent.tx," \\\\textit{"

  #[~]  Your answer here:                     
  ,"Population projections for ", SppName ,", are reasonably well determined and projected boimass from the last assessment "
  ," was within the confidence bounds of the biomass estimated in the current assessment. "
                       
  #Question 4  
  ,"} ",item.tx
  ,"Describe any changes that were made to the current stock assessment, beyond incorporating additional years of data "
  ," and the affect these changes had on the assessment and stock status."
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
  
  #Question 6                     
  ,"} ",item.tx
  ,"Indicate what data or studies are currently lacking and which would be needed most to improve this stock assessment in the future. "
  ,lbreak.tx,indent.tx," \\\\textit{"
                       
  #[~]  Your answer here:                       
  ,"The ",SppName," assessment could be improved with additional studies on growth and maximum age, as well more precise estimates "
  ," of recreational landings and discards."                       
  
  
  #Question 7                     
  ,"} ",item.tx  
  ,"Are there other important issues?",lbreak.tx,indent.tx," \\\\textit{"                     
                       
  #[~]  Your answer here:                       
  ,"None. "                       
  
                       
  ,"}",enditem.tx
  ,sep=""  
)

#[~]
#Refercence previous assessment/update:
References<-paste( RefHead.tx,lbreak.tx
  ,"Northeast Fisheries Science Center. 2013. 55th Northeast Regional Stock Assessment "
  ,"Workshop (55th SAW) Assessment Summary Report. US Dept Commer, Northeast Fish "
  ,"Sci Cent Ref Doc. 13-01; 41 p. Available from: National Marine Fisheries Service, "
  ,"166 Water Street, Woods Hole, MA 02543-1026, or online at http://www.nefsc.noaa.gov/nefsc"
  ,"/publications/ "
  ,lbreak.tx,lbreak.tx
  ,"Northeast Fisheries Science Center. 2010. 52nd Northeast Regional Stock Assessment "
  ,"Workshop (52nd SAW) Assessment Summary Report. US Dept Commer, Northeast Fish "
  ,"Sci Cent Ref Doc. 10-01; 40 p. Available from: National Marine Fisheries Service, "
  ,"166 Water Street, Woods Hole, MA 02543-1026, or online at http://www.nefsc.noaa.gov/nefsc"
  ,"/publications/ " 
  ,sep=""
)
}  #text  #[~]
#_______________________________________________________________________________________________
{
#%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
#                                        Table Captions
#%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
#[~]
CatchStatusTab.cap<-paste("Catch and status table for ",SppName,".  All weights are in "
  ,CatchUnits," recruitment is in", RecrUnits," and ", FFull.tx," is the fishing mortality on fully "
  ,"selected ages.",sep="")

#[~]
BRPTab.cap<-paste("An ",F40.tx," proxy was used for the overfishing threshold... More species" 
  ," specific information goes here... Intervals shown "
  ,"are 5th and 95th percentiles."
  ,sep="")

#[~]
ProjTab.cap<-paste("Short term projections of total fishery yield and spawning stock biomass for "
  ,SppName, " based on a harvest scenario of fishing at ","75% ", FMSY.tx
  ," between ",PYear[3]," and ",PYear[5],". Catch in ",PYear[2]," has been estimated at "
  ,prettyNum(PCatch1[2],big.mark=",",scientific=F) ,CatchUnits,". "
  ," ... Species specific information goes here... "
  ,sep="")

#[~]
figFish.cap<-paste("Total catch of ",SppName 
  ," between ",min(dt2[,ModYear])," and ",max(dt2[,ModYear])
  ," by fleet (commercial and recreational) and disposition (landings and discards)."
  ,sep=""
)

#[~]
figSurv.cap<-paste("Indices of biomass for the ",SppName
  ," between ",min(dt3[,SurvYear])," and ",max(dt3[,SurvYear])
  ," for the Northeast Fisheries Science Center (NEFSC) spring and fall bottom trawl "
  ,"surveys and Massachusetts Department of Marine Fisheries (MADMF) spring bottom trawl survey."
  ,"  The ",bounds,"% ",ci.method," confidence intervals are shown."
  ,sep=""
)

#[~]
figSSB.cap<-paste("Estimated trends in the spawning stock biomass of ",SppName
  ," between ",min(dt2[,ModYear])," and ",max(dt2[,ModYear])," from the current  (solid line) "
  ,"and previous (dashed line) assessment and the corresponding ",SSBthresh.tx
  ," (", half.tx, SSBMSY.tx ,"; horizontal dashed line) as well as ",SSBtarg.tx
  ,SSBMSY.tx,"; horizontal dotted line) " 
  ," based on the ",term.yr," assessment models ", Mod1.name," (A) and ", Mod2.name," (B). "
  ,"The ",bounds,"% ",ci.method," confidence intervals are shown."
  ,sep="")

#[~]
figF.cap<-paste("Estimated trends in the fully selected fishing mortality (",FFull.tx,")"
  ," of ",SppName," between ",min(dt2[,ModYear])," and ",max(dt2[,ModYear])," from the current "
  ," (solid line) and previous (dashed line) assessment and the"
  ," corresponding ",Fthresh.tx
  ," (",FMSYpt.est1,"; dashed line) as well as ",Ftarg.tx
  ," (0.8 *",FMSY.tx,"; dotted line) " 
  ," based on the ",term.yr," assessment models ", Mod1.name," (A) and ", Mod2.name," (B). "
  ,"The ",bounds,"% ",ci.method," confidence intervals are shown."
  ,sep="")

#[~]
figRecr.cap<-paste("Estimated trends in age 1 recruitment ",RecrUnits," of "
  ,SppName, " between ",min(dt2[,ModYear])," and ",max(dt2[,ModYear])
  ," from the current (solid line) and previous (dashed line) assessment."
  ," based on the ",term.yr," assessment models ", Mod1.name," (A) and ", Mod2.name," (B). "                   
  ," The ",bounds,"% ",ci.method," confidence intervals are shown."
  ,sep=""
)
}  #table and figure captions #[~]

#__________________________________________________________________________________________________
#$$$$$$$$$$$$$$$$$$$$$$$$$$$ NO USER MODIFICATION BELOW THIS POINT $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
#%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
save(list = ls(all = TRUE), file = "AutoAss.RData");FinishAutoAssess2Model(); #DON'T CHANGE/REMOVE THIS!!
#%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
#+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++END







