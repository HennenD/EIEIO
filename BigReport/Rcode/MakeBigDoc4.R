#%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
#source standard functions
dir.func<- "/home/dhennen/DRH_general_R_code/"
source(paste(dir.func,"functions.L.r",sep=""))
dir.func=paste("/home/dhennen/EIEIO/BigReport/",sep="") 
source(paste(dir.func,"EIEIO_functions.r",sep=""))                            #*
source(paste(dir.func,"EIEIO_functions2Model.r",sep="")) 
#This is a driver for the big document - run each of the individual reports and then compile the latex of the whole thing
#Some things you want to be permanent
rho_tab<-c();save(rho_tab,file="rho_tab.RData");
#_______________________________________________________________________________________________________

#HAL_UNIT
if(T){
  source("/home/dhennen/EIEIO/BigReport/HAL_UNIT/ATHAL1.r")
  convert_call(SPP_LatexCall("HAL_UNIT_"),"/home/dhennen/EIEIO/BigReport/latex/","HALUNIT_")
}
#_______________________________________________________________________________________________________

#COD_GOM
if(T){
source("/home/dhennen/EIEIO/BigReport/COD_GM/MakeUpdateDoc_2Models1_gom_cod_2015_v5.r")
load(file="rho_tab.RData")
rho_tab<-rbind(rho_tab,data.frame(Stock="CODGM(M=0.2)","Bterm"=prettyNum(dt2[dt2[,ModYear]==term.yr,ModSSB1],big.mark=",",scientific=F)
    ,"Brho"=prettyNum(B.retro.adj1,big.mark=",",scientific=F)
    ,"BCI"=paste(prettyNum(BCLL1,big.mark=",",scientific=F),"-",prettyNum(BCLU1,big.mark=",",scientific=F))   
    #,"BCI"=paste("1,713 - 2,892")   
    ,"Fterm"=round(dt2[dt2[,ModYear]==term.yr,FF1],3)
    ,"Frho"=F.retro.adj1
    #,"FCI"=paste("0.664 - 1.387")
    ,"FCI"=paste(round(as.numeric(FCLL1),3),"-",round(as.numeric(FCLU1),3))
      #paste(prettyNum(FCLL,big.mark=",",scientific=F),"-",prettyNum(FCLU,big.mark=",",scientific=F))
    ,"Adj"="No"
    )
)
rho_tab<-rbind(rho_tab,data.frame(Stock="CODGM(M ramp)","Bterm"=prettyNum(dt2[dt2[,ModYear]==term.yr,ModSSB2],big.mark=",",scientific=F)
    ,"Brho"=prettyNum(B.retro.adj2,big.mark=",",scientific=F)
    #,"BCI"=paste("1,942 - 3,298")  
    ,"BCI"=paste(prettyNum(BCLL2,big.mark=",",scientific=F),"-",prettyNum(BCLU2,big.mark=",",scientific=F))       
    ,"Fterm"=round(dt2[dt2[,ModYear]==term.yr,FF2],3)
    ,"Frho"=F.retro.adj2
    #,"FCI"=paste("0.654 - 1.304")
    ,"FCI"=paste(round(as.numeric(FCLL2),3),"-",round(as.numeric(FCLU2),3))    
      #paste(prettyNum(FCLL,big.mark=",",scientific=F),"-",prettyNum(FCLU,big.mark=",",scientific=F))
    ,"Adj"="No"
    )
)
save(rho_tab,file="rho_tab.RData")
convert_call(SPP_LatexCall("COD_GM_"),"/home/dhennen/EIEIO/BigReport/latex/","CODGM_")
}
#_______________________________________________________________________________________________________

#COD_GB
if(T) {
source("/home/dhennen/EIEIO/BigReport/COD_GB/MakeUpdateDoc_Server1-cod.v10.r")
convert_call(SPP_LatexCall("COD_GB_"),"/home/dhennen/EIEIO/BigReport/latex/","CODGB_")
}
#_______________________________________________________________________________________________________

#HAD_GB
if(T) {
source("/home/dhennen/EIEIO/BigReport/HAD_GB/MakeUpdateDoc_Server1_GBH_2015_v9.r")
load(file="rho_tab.RData")
rho_tab<-rbind(rho_tab,data.frame(Stock="HADGB","Bterm"=prettyNum(dt2[dt2[,ModYear]==term.yr,ModSSB],big.mark=",",scientific=F)
    ,"Brho"=prettyNum(B.retro.adj,big.mark=",",scientific=F)
    ,"BCI"=paste(prettyNum(BCLL,big.mark=",",scientific=F),"-",prettyNum(BCLU,big.mark=",",scientific=F))   
    ,"Fterm"=round(dt2[dt2[,ModYear]==term.yr,FF],3)
    ,"Frho"=F.retro.adj
    ,"FCI"=paste(round(as.numeric(FCLL),3),"-",round(as.numeric(FCLU),3))
      #paste(prettyNum(FCLL,big.mark=",",scientific=F),"-",prettyNum(FCLU,big.mark=",",scientific=F))
    ,"Adj"="Yes"
    )
)
save(rho_tab,file="rho_tab.RData")
convert_call(SPP_LatexCall("HAD_GB_"),"/home/dhennen/EIEIO/BigReport/latex/","HADGB_")
}
#_______________________________________________________________________________________________________

#HAD_GM
if(T) {
source("/home/dhennen/EIEIO/BigReport/HAD_GM/MakeUpdateDoc_Server1_gom_haddock_2015_3.r")
load(file="rho_tab.RData")
rho_tab<-rbind(rho_tab,data.frame(Stock="HADGM","Bterm"=prettyNum(dt2[dt2[,ModYear]==term.yr,ModSSB],big.mark=",",scientific=F)
    ,"Brho"=prettyNum(B.retro.adj,big.mark=",",scientific=F)
    ,"BCI"=paste(prettyNum(BCLL,big.mark=",",scientific=F),"-",prettyNum(BCLU,big.mark=",",scientific=F))   
    #,"BCI"=paste("7,229 - 14,453")
    ,"Fterm"=round(dt2[dt2[,ModYear]==term.yr,FF],3)
    ,"Frho"=F.retro.adj
    #,"FCI"=paste("0.164 - 0.373")
    ,"FCI"=paste(round(as.numeric(FCLL),3),"-",round(as.numeric(FCLU),3))
      #paste(prettyNum(FCLL,big.mark=",",scientific=F),"-",prettyNum(FCLU,big.mark=",",scientific=F))
    ,"Adj"="No"
    )
)
save(rho_tab,file="rho_tab.RData")
convert_call(SPP_LatexCall("HAD_GM_"),"/home/dhennen/EIEIO/BigReport/latex/","HADGM_")
}
#_______________________________________________________________________________________________________

#YEL_GB
if(T) {
source("/home/dhennen/EIEIO/BigReport/YEL_GB/MakeUpdateDoc_Server1_GBYT_bigdoc_v3.r")
convert_call(SPP_LatexCall("YEL_GB_"),"/home/dhennen/EIEIO/BigReport/latex/","YELGB_")

}
#_______________________________________________________________________________________________________

#YEL_SNEMA
if(T) {
source("/home/dhennen/EIEIO/BigReport/YEL_SNEMA/MakeUpdateDoc_Server1_SNEMAYT_bigdoc_v3.r")
load(file="rho_tab.RData")
rho_tab<-rbind(rho_tab,data.frame(Stock="YELSNEMA","Bterm"=prettyNum(dt2[dt2[,ModYear]==term.yr,ModSSB],big.mark=",",scientific=F)
    ,"Brho"=prettyNum(B.retro.adj,big.mark=",",scientific=F)
    ,"BCI"=paste(prettyNum(BCLL,big.mark=",",scientific=F),"-",prettyNum(BCLU,big.mark=",",scientific=F))   
    ,"Fterm"=round(dt2[dt2[,ModYear]==term.yr,FF],3)
    ,"Frho"=F.retro.adj
    ,"FCI"=paste(round(as.numeric(FCLL),3),"-",round(as.numeric(FCLU),3))
      #paste(prettyNum(FCLL,big.mark=",",scientific=F),"-",prettyNum(FCLU,big.mark=",",scientific=F))
    ,"Adj"="No"
    )
)
save(rho_tab,file="rho_tab.RData")
convert_call(SPP_LatexCall("YEL_SNEMA_"),"/home/dhennen/EIEIO/BigReport/latex/","YELSNEMA_")

}
#_______________________________________________________________________________________________________

#YEL_CCGM
if(T) {
source("/home/dhennen/EIEIO/BigReport/YEL_CCGM/MakeUpdateDoc_Server1_CCGOMYT_bigdoc_v4.r")
load(file="rho_tab.RData")
rho_tab<-rbind(rho_tab,data.frame(Stock="YELCCGM","Bterm"=prettyNum(dt2[dt2[,ModYear]==term.yr,ModSSB],big.mark=",",scientific=F)
    ,"Brho"=prettyNum(B.retro.adj,big.mark=",",scientific=F)
    ,"BCI"=paste(prettyNum(BCLL,big.mark=",",scientific=F),"-",prettyNum(BCLU,big.mark=",",scientific=F))   
    ,"Fterm"=round(dt2[dt2[,ModYear]==term.yr,FF],3)
    ,"Frho"=F.retro.adj
    ,"FCI"=paste(round(as.numeric(FCLL),3),"-",round(as.numeric(FCLU),3))
      #paste(prettyNum(FCLL,big.mark=",",scientific=F),"-",prettyNum(FCLU,big.mark=",",scientific=F))
    ,"Adj"="Yes"
    )
)
save(rho_tab,file="rho_tab.RData")
convert_call(SPP_LatexCall("YEL_CCGM_"),"/home/dhennen/EIEIO/BigReport/latex/","YELCCGM_")
}
#_______________________________________________________________________________________________________

#FLW_GM
if(T) {
source("/home/dhennen/EIEIO/BigReport/FLW_GM/MakeUpdateDoc_Server3.r")
convert_call(SPP_LatexCall("FLW_GM_"),"/home/dhennen/EIEIO/BigReport/latex/","FLWGM_")

}
#_______________________________________________________________________________________________________

#FLW_SNEMA
if(T) {
source("/home/dhennen/EIEIO/BigReport/FLW_SNEMA/MakeUpdateDoc_Server3.r")
load(file="rho_tab.RData")
rho_tab<-rbind(rho_tab,data.frame(Stock="FLWSNEMA","Bterm"=prettyNum(dt2[dt2[,ModYear]==term.yr,ModSSB],big.mark=",",scientific=F)
    ,"Brho"=prettyNum(B.retro.adj,big.mark=",",scientific=F)
    ,"BCI"=paste(prettyNum(BCLL,big.mark=",",scientific=F),"-",prettyNum(BCLU,big.mark=",",scientific=F))   
    ,"Fterm"=round(dt2[dt2[,ModYear]==term.yr,FF],3)
    ,"Frho"=F.retro.adj
    ,"FCI"=paste(round(as.numeric(FCLL),3),"-",round(as.numeric(FCLU),3))
      #paste(prettyNum(FCLL,big.mark=",",scientific=F),"-",prettyNum(FCLU,big.mark=",",scientific=F))
    ,"Adj"="No"
    )
)
save(rho_tab,file="rho_tab.RData")
convert_call(SPP_LatexCall("FLW_SNEMA_"),"/home/dhennen/EIEIO/BigReport/latex/","FLWSNEMA_")

}
#_______________________________________________________________________________________________________

#FLW_GB
if(T) {
source("/home/dhennen/EIEIO/BigReport/FLW_GB/MakeUpdateDoc_Server3.r")
load(file="rho_tab.RData")
rho_tab<-rbind(rho_tab,data.frame(Stock="FLWGB","Bterm"=prettyNum(dt2[dt2[,ModYear]==term.yr,ModSSB],big.mark=",",scientific=F)
    ,"Brho"=prettyNum(B.retro.adj,big.mark=",",scientific=F)
    ,"BCI"=paste(prettyNum(BCLL,big.mark=",",scientific=F),"-",prettyNum(BCLU,big.mark=",",scientific=F))   
    ,"Fterm"=round(dt2[dt2[,ModYear]==term.yr,FF],3)
    ,"Frho"=F.retro.adj
    ,"FCI"=paste(round(as.numeric(FCLL),3),"-",round(as.numeric(FCLU),3))
      #paste(prettyNum(FCLL,big.mark=",",scientific=F),"-",prettyNum(FCLU,big.mark=",",scientific=F))
    ,"Adj"="Yes"
    )
)
save(rho_tab,file="rho_tab.RData")
convert_call(SPP_LatexCall("FLW_GB_"),"/home/dhennen/EIEIO/BigReport/latex/","FLWGB_")

}
#_______________________________________________________________________________________________________

#FLD_GMGB
if(T) {
source("/home/dhennen/EIEIO/BigReport/FLD_GMGB/MakeUpdateDoc_Server2e.r")
convert_call(SPP_LatexCall("FLD_GMGB_"),"/home/dhennen/EIEIO/BigReport/latex/","FLDGMGB_")

}
#_______________________________________________________________________________________________________

#FLD_SNEMA
if(T) {
source("/home/dhennen/EIEIO/BigReport/FLD_SNEMA/MakeUpdateDoc_Server1c.r")
convert_call(SPP_LatexCall("FLD_SNEMA_"),"/home/dhennen/EIEIO/BigReport/latex/","FLDSNEMA_")

}
#_______________________________________________________________________________________________________

#PLA_UNIT
if(T){
source("/home/dhennen/EIEIO/BigReport/PLA_UNIT/MakeUpdateDoc_Server1-ampl.v7.r")
load(file="rho_tab.RData")
rho_tab<-rbind(rho_tab,data.frame(Stock="PLAUNIT","Bterm"=prettyNum(dt2[dt2[,ModYear]==term.yr,ModSSB],big.mark=",",scientific=F)
    ,"Brho"=prettyNum(B.retro.adj,big.mark=",",scientific=F)
    ,"BCI"=paste(prettyNum(BCLL,big.mark=",",scientific=F),"-",prettyNum(BCLU,big.mark=",",scientific=F))   
    ,"Fterm"=round(dt2[dt2[,ModYear]==term.yr,FF],3)
    ,"Frho"=F.retro.adj
    ,"FCI"=paste(round(as.numeric(FCLL),3),"-",round(as.numeric(FCLU),3))
      #paste(prettyNum(FCLL,big.mark=",",scientific=F),"-",prettyNum(FCLU,big.mark=",",scientific=F))
    ,"Adj"="Yes"
    )
)
save(rho_tab,file="rho_tab.RData")
convert_call(SPP_LatexCall("PLA_UNIT_"),"/home/dhennen/EIEIO/BigReport/latex/","PLAUNIT_")

}
#_______________________________________________________________________________________________________

#WIT_UNIT
if(T){
source("/home/dhennen/EIEIO/BigReport/WIT_UNIT/witch_2015_autoreport7.r")
load(file="rho_tab.RData")
rho_tab<-rbind(rho_tab,data.frame(Stock="WITUNIT","Bterm"=prettyNum(dt2[dt2[,ModYear]==term.yr,ModSSB],big.mark=",",scientific=F)
    ,"Brho"=prettyNum(B.retro.adj,big.mark=",",scientific=F)
    ,"BCI"=paste(prettyNum(BCLL,big.mark=",",scientific=F),"-",prettyNum(BCLU,big.mark=",",scientific=F))   
    ,"Fterm"=round(dt2[dt2[,ModYear]==term.yr,FF],3)
    ,"Frho"=F.retro.adj
    ,"FCI"=paste(round(as.numeric(FCLL),3),"-",round(as.numeric(FCLU),3))
      #paste(prettyNum(FCLL,big.mark=",",scientific=F),"-",prettyNum(FCLU,big.mark=",",scientific=F))
    ,"Adj"="Yes"
    )
)
save(rho_tab,file="rho_tab.RData")
convert_call(SPP_LatexCall("WIT_UNIT_"),"/home/dhennen/EIEIO/BigReport/latex/","WITUNIT_")

}
#_______________________________________________________________________________________________________

#HKW_UNIT
if(T){
source("/home/dhennen/EIEIO/BigReport/HKW_UNIT/MakeUpdateDoc_Server4.r")
load(file="rho_tab.RData")
rho_tab<-rbind(rho_tab,data.frame(Stock="HWKUNIT","Bterm"=prettyNum(dt2[dt2[,ModYear]==term.yr,ModSSB],big.mark=",",scientific=F)
    ,"Brho"=prettyNum(B.retro.adj,big.mark=",",scientific=F)
    ,"BCI"=paste(prettyNum(BCLL,big.mark=",",scientific=F),"-",prettyNum(BCLU,big.mark=",",scientific=F))   
    ,"Fterm"=round(dt2[dt2[,ModYear]==term.yr,FF],3)
    ,"Frho"=F.retro.adj
    ,"FCI"=paste(round(as.numeric(FCLL),3),"-",round(as.numeric(FCLU),3))
      #paste(prettyNum(FCLL,big.mark=",",scientific=F),"-",prettyNum(FCLU,big.mark=",",scientific=F))
    ,"Adj"="No"
    )
)
save(rho_tab,file="rho_tab.RData")
convert_call(SPP_LatexCall("HKW_UNIT_"),"/home/dhennen/EIEIO/BigReport/latex/","HKWUNIT_")

}
#_______________________________________________________________________________________________________

#OPT_UNIT
if(T){
source("/home/dhennen/EIEIO/BigReport/OPT_UNIT/oceanpout_2015_autoreport_v6.r")
convert_call(SPP_LatexCall("OPT_UNIT_"),"/home/dhennen/EIEIO/BigReport/latex/","OPTUNIT_")

}
#_______________________________________________________________________________________________________

#POK_UNIT
if(T){
source("/home/dhennen/EIEIO/BigReport/POK_UNIT/MakeUpdateDoc_2Models1_Retro_v3.r")
load(file="rho_tab.RData")
rho_tab<-rbind(rho_tab,data.frame(Stock="POLUNIT","Bterm"=prettyNum(dt2[dt2[,ModYear]==term.yr,ModSSB1],big.mark=",",scientific=F)
    ,"Brho"=prettyNum(B.retro.adj1,big.mark=",",scientific=F)
    ,"BCI"=paste(prettyNum(BCLL1,big.mark=",",scientific=F),"-",prettyNum(BCLU1,big.mark=",",scientific=F))   
    ,"Fterm"=round(dt2[dt2[,ModYear]==term.yr,FF1],3)
    ,"Frho"=F.retro.adj1
    ,"FCI"=paste(round(as.numeric(FCLL1),3),"-",round(as.numeric(FCLU1),3))
      #paste(prettyNum(FCLL,big.mark=",",scientific=F),"-",prettyNum(FCLU,big.mark=",",scientific=F))
    ,"Adj"="Yes"
    )
)
save(rho_tab,file="rho_tab.RData")
convert_call(SPP_LatexCall("POK_UNIT_"),"/home/dhennen/EIEIO/BigReport/latex/","POKUNIT_")

}
#_______________________________________________________________________________________________________

#RED_UNIT
if(T){
source("/home/dhennen/EIEIO/BigReport/RED_UNIT/MakeUpdateDoc_Server1_Retro_v3.r")
load(file="rho_tab.RData")
rho_tab<-rbind(rho_tab,data.frame(Stock="REDUNIT","Bterm"=prettyNum(dt2[dt2[,ModYear]==term.yr,ModSSB],big.mark=",",scientific=F)
    ,"Brho"=prettyNum(B.retro.adj,big.mark=",",scientific=F)
    ,"BCI"=paste(prettyNum(BCLL,big.mark=",",scientific=F),"-",prettyNum(BCLU,big.mark=",",scientific=F))   
    ,"Fterm"=round(dt2[dt2[,ModYear]==term.yr,FF],3)
    ,"Frho"=F.retro.adj
    ,"FCI"=paste(round(as.numeric(FCLL),3),"-",round(as.numeric(FCLU),3))
      #paste(prettyNum(FCLL,big.mark=",",scientific=F),"-",prettyNum(FCLU,big.mark=",",scientific=F))
    ,"Adj"="Yes"
    )
)
save(rho_tab,file="rho_tab.RData")
convert_call(SPP_LatexCall("RED_UNIT_"),"/home/dhennen/EIEIO/BigReport/latex/","REDUNIT_")

}
#_______________________________________________________________________________________________________

#CAT_UNIT
if(T){
source("/home/dhennen/EIEIO/BigReport/CAT_UNIT/MakeUpdateDoc_Server3.r")
convert_call(SPP_LatexCall("CAT_UNIT_"),"/home/dhennen/EIEIO/BigReport/latex/","CATUNIT_")

}
#_______________________________________________________________________________________________________


#_______________________________________________________________________________________________________
{
load(file="rho_tab.RData")
dir.tables<-"/home/dhennen/EIEIO/BigReport/ExSum/tables/"

#Make a nice xtable out of the harvest from the individual reports...
  RhoTab<- rho_tab
  colnames(RhoTab)<-c("Stock",paste("$B_{",term.yr,"}$",sep=""),"$B_{\\rho}$","Conf. limits"
        ,paste("$F_{",term.yr,"}$",sep=""),"$F_{\\rho}$","Conf. limits","Adj?")
  
  disp<-c("s",rep("s",dim(RhoTab)[2]))
  pathname=dir.tables
  filename="RhoDecisionTab.csv"
  tab.env="tabular"
  align=c("l",rep("c@{\\hspace{.2cm}}",(dim(RhoTab)[2])))
  
  #align=NULL
  hline<-c(-1,0,(dim(RhoTab)[1])) 
  
  Rhocap<-paste("The biomass ($B$) and exploitation rate ($F$) values used for status determination were "
    ," adjusted to account for a retrospective pattern in some stocks.  "
    ," In general, when the $B$ or $F$ values adjusted for restrospective pattern ($B_{\\rho}$ and $F_{\\rho}$) "
    ," were outside of the approximate $90\\%$ confidence interval (Conf. limits), the "
    ," $\\rho$ adjusted values were used to determine stock status (Adj. $=$ Yes). "
    ," There were exceptions however, such as YELSNEMA and CODGM(M=0.2) and details regarding each decision can be found in the "
    ," report and reviewer comments sections for each stock. "
    ," Only stocks that had both an estimable 7-year Mohn's $\\rho$ for $B$ and $F$ and estimable approximate "
    ," 90\\% confidence limits on "
    ," terminal year $B$ and $F$ values are included. "  
    ,sep="")
  
  xtab3<-xtable(x=RhoTab,caption=Rhocap,display=disp,align=align
                ,label="RhoDecision_tab")
  
  #print(xtable(xtab3),sanitize.text.function=function(x){x})
  
  suppressWarnings(print.xtable(x=xtab3
               ,file=paste(pathname,substr(filename,1,(nchar(filename)-3)),"tex",sep="") 
               ,caption.placement="top"
               ,tabular.environment=tab.env
               ,floating=T
               ,floating.environment="table*"
               #,table.placement="H"         
               ,include.rownames=F
               ,hline.after=hline
               ,sanitize.text.function=function(x){x}
               #,add.to.row=addtorow
  ))
  print("___________Rho Decision completed____________") 
} #rho_table code  

#_______________________________________________________________________________________________________
#If you want to publish from here
if(T){
#compile and time stamp the LaTex doc
system(paste("cd /home/dhennen/EIEIO/BigReport/latex/; pdflatex -halt-on-error GroundfishUpdate2015_v2.tex; "
             ," pdflatex -halt-on-error GroundfishUpdate2015_v2.tex;",sep=""))  
#Copy and time stamp the latest version    
pdf.name<-paste("Groundfish_Update_",getTimeFlag(),".pdf",sep="")
dir.latex<-"/home/dhennen/EIEIO/BigReport/latex/"
system(paste("cd ",dir.latex,"../; cp ",dir.latex,"GroundfishUpdate2015_v2.pdf ./",pdf.name,sep=""))
}

#_______________________________________________________________________________________________________
#Clean up function to reduce the number of .pdf files
if(F){
  q<-"; rm *.pdf; "
  clean1<-paste("cd EIEIO/BigReport/CAT_UNIT",q," cd ../COD_GB",q,"cd ../COD_GM",q,"cd ../FLD_GMGB"
        ,q,"cd ../FLW_GB",q,"cd ../FLW_GM",q,"cd ../FLW_SNEMA",q,"cd ../HAD_GB",q,"cd ../HAD_GM"
        ,q,"cd ../HAL_UNIT",q,"cd ../HKW_UNIT",q,"cd ../OPT_UNIT",q,"cd ../PLA_UNIT",q,"cd ../POK_UNIT"
        ,q,"cd ../RED_UNIT",q,"cd ../WIT_UNIT",q,"cd ../YEL_CCGM",q,"cd ../YEL_GB",q,"cd ../YEL_SNEMA"
        ,q,"cd ../oldversions",q,sep=""        
        )
  system(clean1)
}

