# Versioning:
# 10/2/15 table structure altered to prevent tables being split onto 2 pages
# 10/14/15 command line interface no longer used. A LaTex file is now written and read by the LaTex compile command
# 7/9/17 order rearranged to make debugging easier. To debug run from here to ~line 635
#%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
FinishAutoAssess<-function(){
  #Load the objects in memory here
  load("AutoAss.RData")
  #%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  #there are some variables that need to be declared as null if they have been commented out by the user...
  obj<-objects()
  if(!"Preamble"%in%obj) Preamble<-NULL
  if(!"StateOfStock"%in%obj) StateOfStock<-NULL
  if(!"Project"%in%obj) Project<-NULL
  if(!"SpecialComments"%in%obj) SpecialComments<-NULL
  if(!"References"%in%obj) References<-NULL
  if(!"CatchStatusTab.cap"%in%obj) CatchStatusTab.cap<-NULL
  if(!"BRPTab.cap"%in%obj) BRPTab.cap<-NULL
  if(!"ProjTab.cap"%in%obj) ProjTab.cap<-NULL
  if(!"figFish.cap"%in%obj) figFish.cap<-NULL
  if(!"figSurv.cap"%in%obj) figSurv.cap<-NULL
  if(!"figSSB.cap"%in%obj) figSSB.cap<-NULL
  if(!"figF.cap"%in%obj) figF.cap<-NULL
  if(!"figRecr.cap"%in%obj) figRecr.cap<-NULL
  if(!"Draft"%in%obj) Draft<-F #assumming if someone blanks this they mean it to be a final draft!
  if(!"Com.Discards"%in%obj) Com.Discards<-NULL
  if(!"Rec.Landings"%in%obj) Rec.Landings<-NULL
  if(!"Rec.Discards"%in%obj) Rec.Discards<-NULL
  if(!"CA.Landings"%in%obj) CA.Landings<-NULL
  if(!"CA.Discards"%in%obj) CA.Discards<-NULL
  if(!"Com.Landings.name"%in%obj) Com.Landings.name<-NULL
  if(!"Com.Discards.name"%in%obj) Com.Discards.name<-NULL
  if(!"Rec.Landings.name"%in%obj) Rec.Landings.name<-NULL
  if(!"Rec.Discards.name"%in%obj) Rec.Discards.name<-NULL
  if(!"CA.Landings.name"%in%obj) CA.Landings.name<-NULL
  if(!"CA.Discards.name"%in%obj) CA.Discards.name<-NULL
  if(!"Fleet1"%in%obj) Fleet1<-NULL
  if(!"Fleet2"%in%obj) Fleet2<-NULL
  if(!"Fleet3"%in%obj) Fleet3<-NULL
  if(!"Fleet4"%in%obj) Fleet4<-NULL
  if(!"Fleet5"%in%obj) Fleet5<-NULL
  if(!"Fleet6"%in%obj) Fleet6<-NULL
  if(!"Fleet7"%in%obj) Fleet7<-NULL
  if(!"Fleet8"%in%obj) Fleet8<-NULL
  if(!"Fleet1.name"%in%obj) Fleet1.name<-NULL
  if(!"Fleet2.name"%in%obj) Fleet2.name<-NULL
  if(!"Fleet3.name"%in%obj) Fleet3.name<-NULL
  if(!"Fleet4.name"%in%obj) Fleet4.name<-NULL
  if(!"Fleet5.name"%in%obj) Fleet5.name<-NULL
  if(!"Fleet6.name"%in%obj) Fleet6.name<-NULL
  if(!"Fleet7.name"%in%obj) Fleet7.name<-NULL
  if(!"Fleet8.name"%in%obj) Fleet8.name<-NULL
  if(!"Total"%in%obj) Total<-NULL
  if(!"Total.name"%in%obj) Total.name<-NULL
  if(!"ModSSB"%in%obj) ModSSB<-NULL
  if(!"ModSSB.CV"%in%obj) ModSSB.CV<-NULL  
  if(!"FF"%in%obj) FF<-NULL
  if(!"FF.CV"%in%obj) FF.CV<-NULL  
  if(!"Recruits"%in%obj) Recruits<-NULL 
  if(!"Recruits.old"%in%obj) Recruits.old<-NULL
  if(!"OFL"%in%obj) {OFL<-NULL;OFL.name<-NULL;} #can't have these names if the data doesn't exist!
  if(!"MSY"%in%obj) {MSY<-NULL;MSY.name<-NULL;}  
  if(is.null(Recruits)) BRP.Recruits.name<-NULL
  if(!"SSBthreshold"%in%obj) SSBthreshold<-NULL
  if(!"SSBtarget"%in%obj) SSBtarget<-NULL
  if(!"Fthreshold"%in%obj) Fthreshold<-NULL
  if(!"Ftarget"%in%obj) Ftarget<-NULL
  if(!"Survey1"%in%obj) Survey1<-NULL
  if(!"Survey1.name"%in%obj) Survey1.name<-NULL
  if(!"Survey1.CV"%in%obj) Survey1.CV<-NULL
  if(!"Survey2"%in%obj) Survey2<-NULL
  if(!"Survey2.name"%in%obj) Survey2.name<-NULL
  if(!"Survey2.CV"%in%obj) Survey2.CV<-NULL
  if(!"Survey3"%in%obj) Survey3<-NULL
  if(!"Survey3.name"%in%obj) Survey3.name<-NULL
  if(!"Survey3.CV"%in%obj) Survey3.CV<-NULL
  if(!"Survey4"%in%obj) Survey4<-NULL
  if(!"Survey4.name"%in%obj) Survey4.name<-NULL
  if(!"Survey4.CV"%in%obj) Survey4.CV<-NULL
  if(!"Survey5"%in%obj) Survey5<-NULL
  if(!"Survey5.name"%in%obj) Survey5.name<-NULL
  if(!"Survey5.CV"%in%obj) Survey5.CV<-NULL
  if(!"Survey6"%in%obj) Survey6<-NULL
  if(!"Survey6.name"%in%obj) Survey6.name<-NULL
  if(!"Survey6.CV"%in%obj) Survey6.CV<-NULL
  if(!"Survey7"%in%obj) Survey7<-NULL
  if(!"Survey7.name"%in%obj) Survey7.name<-NULL
  if(!"Survey7.CV"%in%obj) Survey7.CV<-NULL
  if(!"Survey8"%in%obj) Survey8<-NULL
  if(!"Survey8.name"%in%obj) Survey8.name<-NULL
  if(!"Survey8.CV"%in%obj) Survey8.CV<-NULL
  if(!"F.retro.adj"%in%obj) F.retro.adj<-NULL
  if(!"B.retro.adj"%in%obj) B.retro.adj<-NULL
  if(!"report.yr"%in%obj) report.yr<-NULL 
  if(!"ExcludeFromTab1"%in%obj) ExcludeFromTab1<-NULL
  if(!"pdf.name"%in%obj) pdf.name<-paste(gsub(" ", "_",SppName, fixed = TRUE),"_Update_",getTimeFlag(),".pdf",sep="")
  if(!"ModSSB.CI.VPA"%in%obj) ModSSB.CI.VPA<-NULL
  if(!"FF.CI.VPA"%in%obj) FF.CI.VPA<-NULL
  if(!"Recruits.CI.VPA"%in%obj) Recruits.CI.VPA<-NULL
  if(!"ModSSB.CV"%in%obj) ModSSB.CV<-NULL
  if(!"FF.CV"%in%obj) FF.CV<-NULL
  if(!"Recruits.CV"%in%obj) Recruits.CV<-NULL
  if(!"upload"%in%obj) upload<-F
  if(!"PYear"%in%obj) PYear<-NULL
  if(!"PCatch"%in%obj) PCatch<-NULL
  if(!"PSSB"%in%obj) PSSB<-NULL
  if(!"PF"%in%obj) PF<-NULL
  if(!"SSB.old"%in%obj) SSB.old<-NULL
  if(!"F.old"%in%obj) F.old<-NULL
  if(!"ModSSB.name"%in%obj) ModSSB.name<-NULL
  if(!"FF.name"%in%obj) FF.name<-NULL
  if(!"Recruits.name"%in%obj) Recruits.name<-NULL
  if(!"FMSY.name"%in%obj) FMSY.name<-NULL
  if(!"SSBMSY.name"%in%obj) SSBMSY.name<-NULL
  if(!"MSY.name"%in%obj) MSY.name<-NULL
  if(!"BRP.Recruits.name"%in%obj) BRP.Recruits.name<-NULL
  if(!"F.Status.name"%in%obj) F.Status.name<-NULL
  if(!"B.Status.name"%in%obj) B.Status.name<-NULL
  if(!"ModSSB"%in%obj) ModSSB<-NULL
  if(!"Recr"%in%obj) Recr<-NULL
  if(!"BRho.old"%in%obj) Rho.old<-NULL  
  if(!"BRho.now"%in%obj) Rho.now<-NULL
  if(!"FRho.old"%in%obj) Rho.old<-NULL  
  if(!"FRho.now"%in%obj) Rho.now<-NULL  
  if(!"Rho.adj"%in%obj)  Rho.adj<-F  
  if(!"SSBUnits"%in%obj)  SSBUnits<-NULL  
  if(!"Stretch"%in%obj)  Stretch<-1.0 
  if(!"ReportType"%in%obj)  ReportType<-"Update"  
  
  #%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  doc_status<-""
  if(Draft) doc_status<-"\\\\textit{draft working paper for peer review only}"
  
  #Pattern matching and escaping to make text readable for LaTex 
  Preamble<-sanitize(Preamble)
  StateOfStock<-sanitize(StateOfStock)
  Project<-sanitize(Project)
  SpecialComments<-sanitize(SpecialComments)
  References<-sanitize(References) 
  CatchStatusTab.cap<-sanitize.Tab.cap(CatchStatusTab.cap)
  BRPTab.cap<-sanitize.Tab.cap(BRPTab.cap)
  ProjTab.cap<-sanitize.Tab.cap(ProjTab.cap)
  figFish.cap<-sanitize(figFish.cap)
  figSurv.cap<-sanitize(figSurv.cap)
  figSSB.cap<-sanitize( figSSB.cap )
  figF.cap<-sanitize(figF.cap)
  figRecr.cap<-sanitize(figRecr.cap)
  doc_status<-sanitize(doc_status)
  Recruits.name<-sanitize.row(Recruits.name)
  FF.name<-sanitize.row(FF.name)
  ModSSB.name<-sanitize.row(ModSSB.name)
  #%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  # check to see that the first letter of the species name is a capital for the title page
  SppNameTitle<-capitalize.first(SppName)
  #%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  #We are going to need to get a prefix for all these variables that need to be passed to the larger doc
  #start with a lookup function - can also hold the path to the reviewer comments for each stock and the 
  #correct authorship, etc...  
  #These are only used for final drafts...
  if(Draft==F) {file1<-"~/EIEIO/BigReport/StockLookUpTable.csv"
  inp<-read.csv(file1)
  pref<-inp[inp$Stock==SppName,"Prefix"]
  auth<-inp[inp$Stock==SppName,"Analyst"] }
  #%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  # Collate Data
  #The first table consists of the catch and model results.  Columns are years and rows are
  #the data sources
  #REMOVALS READ
  #Start with Fleet 1
  com.land<-NULL
  if(!is.null(Fleet1)) if(!Fleet1%in%ExcludeFromTab1) com.land<-as.vector(dt1[dt1[,CYear]>=(term.yr-step.back) & dt1[,CYear]<=term.yr,Fleet1])
  if(!is.null(com.land)) names(com.land)<-as.character(seq((term.yr-step.back),term.yr))
  #US commercial discards
  com.disc<-NULL
  if(!is.null(Fleet2)) if(!Fleet2%in%ExcludeFromTab1) com.disc<-as.vector(dt1[dt1[,CYear]>=(term.yr-step.back) & dt1[,CYear]<=term.yr,Fleet2])
  if(!is.null(com.disc)) names(com.disc)<-as.character(seq((term.yr-step.back),term.yr))
  #US recreational landings
  rec.land<-NULL
  if(!is.null(Fleet3)) if(!Fleet3%in%ExcludeFromTab1) rec.land<-as.vector(dt1[dt1[,CYear]>=(term.yr-step.back) & dt1[,CYear]<=term.yr,Fleet3])
  if(!is.null(rec.land)) names(rec.land)<-as.character(seq((term.yr-step.back),term.yr))
  #US recreational discards
  rec.disc<-NULL
  if(!is.null(Fleet4)) if(!Fleet4%in%ExcludeFromTab1) rec.disc<-as.vector(dt1[dt1[,CYear]>=(term.yr-step.back) & dt1[,CYear]<=term.yr,Fleet4])
  if(!is.null(rec.disc)) names(rec.disc)<-as.character(seq((term.yr-step.back),term.yr))
  #Other catch sources (e.g. Canada)
  ca.land<-NULL
  if(!is.null(Fleet5)) if(!Fleet5%in%ExcludeFromTab1) ca.land<-as.vector(dt1[dt1[,CYear]>=(term.yr-step.back) & dt1[,CYear]<=term.yr,Fleet5])
  if(!is.null(ca.land)) names(ca.land)<-as.character(seq((term.yr-step.back),term.yr))
  #US commercial discards
  ca.disc<-NULL
  if(!is.null(Fleet6)) if(!Fleet6%in%ExcludeFromTab1) ca.disc<-as.vector(dt1[dt1[,CYear]>=(term.yr-step.back) & dt1[,CYear]<=term.yr,Fleet6])
  if(!is.null(ca.disc)) names(ca.disc)<-as.character(seq((term.yr-step.back),term.yr))
  #place holders for additional fleets
  oth.land<-NULL
  if(!is.null(Fleet7)) if(!Fleet7%in%ExcludeFromTab1) oth.land<-as.vector(dt1[dt1[,CYear]>=(term.yr-step.back) & dt1[,CYear]<=term.yr,Fleet7])
  if(!is.null(oth.land)) names(oth.land)<-as.character(seq((term.yr-step.back),term.yr))
  #US commercial discards
  oth.disc<-NULL
  if(!is.null(Fleet8)) if(!Fleet8%in%ExcludeFromTab1) oth.disc<-as.vector(dt1[dt1[,CYear]>=(term.yr-step.back) & dt1[,CYear]<=term.yr,Fleet8])
  if(!is.null(oth.disc)) names(oth.disc)<-as.character(seq((term.yr-step.back),term.yr))  
  
  #Total catch used in assessment 
  tot<-NULL
  if(!is.null(Total)) {
    tot<-as.vector(dt1[dt1[,CYear]>=(term.yr-step.back) & dt1[,CYear]<=term.yr,Total])
    names(tot)<-as.character(seq((term.yr-step.back),term.yr)) }
  
  #MODEL RESULTS READ
  #Start with the SSB from model_results 
  SSB<-NULL
  if(!is.null(ModSSB)) {SSB<-as.vector(dt2[dt2[,ModYear]>=(term.yr-step.back) & dt2[,ModYear]<=term.yr,ModSSB])
  names(SSB)<-as.character(seq((term.yr-step.back),term.yr))}
  #Now get the Full F 
  Ffull<-NULL
  if(!is.null(FF)) {Ffull<-as.vector(dt2[dt2[,ModYear]>=(term.yr-step.back) & dt2[,ModYear]<=term.yr,FF])
  names(Ffull)<-as.character(seq((term.yr-step.back),term.yr))}
  #Now recruits
  recr<-NULL
  if(!is.null(Recruits)) {recr<-as.vector(dt2[dt2[,ModYear]>=(term.yr-step.back) & dt2[,ModYear]<=term.yr,Recruits])
  names(recr)<-as.character(seq((term.yr-step.back),term.yr))}
  
  #Now create some blank rows just to add visual cues to the table
  blank<-rep(NA,length(SSB))
  
  #stack these vectors to make the table - must check to see if they exist first!
  tab1<-c()
  #assume that there are commercial landings 
  tab1<-prettyNum(round(com.land),big.mark=",",scientific=F);tab1<-t(data.frame(tab1));rownames(tab1)[1]<-Fleet1.name;
  if(!is.null(com.disc)) {tab1<-rbind(tab1,prettyNum(round(com.disc),big.mark=",",scientific=F));rownames(tab1)[dim(tab1)[1]]<-Fleet2.name;}
  if(!is.null(rec.land)) {tab1<-rbind(tab1,prettyNum(round(rec.land),big.mark=",",scientific=F));rownames(tab1)[dim(tab1)[1]]<-Fleet3.name;}
  if(!is.null(rec.disc)) {tab1<-rbind(tab1,prettyNum(round(rec.disc),big.mark=",",scientific=F));rownames(tab1)[dim(tab1)[1]]<-Fleet4.name;}
  if(!is.null(ca.land)) {tab1<-rbind(tab1,prettyNum(round(ca.land),big.mark=",",scientific=F));rownames(tab1)[dim(tab1)[1]]<-Fleet5.name;}
  if(!is.null(ca.disc)) {tab1<-rbind(tab1,prettyNum(round(ca.disc),big.mark=",",scientific=F));rownames(tab1)[dim(tab1)[1]]<-Fleet6.name;}
  if(!is.null(oth.land)) {tab1<-rbind(tab1,prettyNum(round(oth.land),big.mark=",",scientific=F));rownames(tab1)[dim(tab1)[1]]<-Fleet7.name;}
  if(!is.null(oth.disc)) {tab1<-rbind(tab1,prettyNum(round(oth.disc),big.mark=",",scientific=F));rownames(tab1)[dim(tab1)[1]]<-Fleet8.name;}    
  if(!is.null(tot)) {tab1<-rbind(tab1,prettyNum(round(tot),big.mark=",",scientific=F));rownames(tab1)[dim(tab1)[1]]<-Total.name;}
  nfish<-dim(tab1)[1] #track the number of fisheries inputs
  #Now add the model results
  if(!is.null(SSB)) {tab1<-rbind(tab1,prettyNum(SSB,big.mark=",",scientific=F));rownames(tab1)[dim(tab1)[1]]<-ModSSB.name}
  if(!is.null(Ffull)) {tab1<-rbind(tab1,Ffull);rownames(tab1)[dim(tab1)[1]]<-FF.name}
  if(!is.null(recr)) {tab1<-rbind(tab1,prettyNum(recr,big.mark=",",scientific=F));rownames(tab1)[dim(tab1)[1]]<-Recruits.name}

  #Produce an xtable
  disp<-c("s", rep("f",dim(tab1)[2]))
  
  #need to alter the digits argument a bit here
  ncols<-dim(tab1)[2]+1
  nrows<-which(rownames(tab1)==FF.name)-1
    
  #Check for "\\\\" in row names and substitute "\\"
  rownames(tab1)=sanitize.Row.Names(tab1)
  
  #check units on recruitment before deciding on the digits!
  if(!is.null(recr)) rec.row<-rep(ifelse(median(recr)<100,2,0),ncols) else {rec.row<-NULL;}
  mdat <- matrix(c(rep(0,ncols*nrows),rep(2,ncols), rec.row),
                 nrow = dim(tab1)[1], ncol=ncols, byrow=TRUE)
  digits<-mdat
  pathname=dir.tables
  filename="Catch_Status_Table.csv"
  tab.env="tabular"  
  align=c(rep("l",1),rep("@{\\hspace{.2cm}}r",(dim(tab1)[2])))
  #align=NULL
  hline<-c(-1,(dim(tab1)[1]))
  
  addtorow <- list()
  addtorow$pos <- list()
  addtorow$pos[[1]] <- 0
  addtorow$command[[1]] <- paste("\\hline \\multicolumn{",(dim(tab1)[2]+1),"}{c}{\\textit{Data}} \\\\ "
                                 ,sep="")
  addtorow$pos[[2]] <- nfish #number of catch lines
  addtorow$command[[2]] <- paste("\\multicolumn{",(dim(tab1)[2]+1),"}{c}{\\textit{Model Results}} \\\\ "
                                 ,sep="")
  
  lab1<-substr(filename,1,(nchar(filename)-4))
  if(Draft==F) {lab1<-paste(gsub("_", "", pref, fixed = TRUE),lab1,sep="")}  
  
  xtab1<-xtable(x=tab1,caption=CatchStatusTab.cap,display=disp,align=align,digits=digits
                ,label=lab1)
  
  print(xtable(xtab1),sanitize.text.function=function(x){x})
  
  print.xtable(x=xtab1
               ,file=paste(pathname,substr(filename,1,(nchar(filename)-3)),"tex",sep="") 
               ,caption.placement="top"
               ,tabular.environment=tab.env
               ,floating=T    
               ,table.placement="H"
               ,floating.environment="table"
               ,include.rownames=T
               ,hline.after=hline
               ,sanitize.text.function=function(x){x}
               ,add.to.row=addtorow
  )
  print("___________Table 1 completed____________")
  #%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    # We need to make the Table of reference points next
    tab2<-c()
    if(!is.null(recr)) {
    rnd<-ifelse(median(dt2[,Recruits])<100,2,0) #check the units on recruitment before rounding
    if(is.null(Recruits.old)) {rec.vec<-c();rec.vec[1]<-"";
          rec.vec[2]<-prettyNum(round(median(dt2[,Recruits]),rnd),big.mark=",",scientific=F)}
    else rec.vec<-c(prettyNum(round(median(dt2[is.finite(dt2[,Recruits.old]),Recruits.old]),rnd)
                ,big.mark=",",scientific=F),prettyNum(round(median(dt2[,Recruits]),rnd),big.mark=",",scientific=F))
    } else rec.vec<-NULL
    #Added functionality for Brian who needs a different type of recruitment calculation
    if(!is.null(Recr)) rec.vec<-Recr
    #Add status row  
    #first check on the existence of reference points
    if(!"Fstatus_old"%in%obj | is.null(Fstatus_old)) Fstatus_old<-""
    if(!"Fstatus"%in%obj | is.null(Fstatus)) Fstatus<-""
    FStatus<-c(Fst.chk(Fstatus_old),Fst.chk(Fstatus))
    if(!"Bstatus_old"%in%obj | is.null(Bstatus_old)) Bstatus_old<-""
    if(!"Bstatus"%in%obj | is.null(Bstatus) ) Bstatus<-""
    BStatus<-c(Bst.chk(Bstatus_old),Bst.chk(Bstatus))
    #tab2<-rbind(FMSY,SSBMSY,MSY,OFL,rec.vec,FStatus,BStatus)  #with OFL
    #dimnames(tab2)[[1]]<-sanitize.cap(c(FMSY.name,SSBMSY.name,MSY.name,OFL.name,BRP.Recruits.name,F.Status.name,B.Status.name))
    tab2<-rbind(FMSY,SSBMSY,MSY,rec.vec,FStatus,BStatus)  #without OFL (moved to projection table)
    dimnames(tab2)[[1]]<-sanitize.cap(c(FMSY.name,SSBMSY.name,MSY.name,BRP.Recruits.name,F.Status.name,B.Status.name))
    
    colnames(tab2)<-c(paste(last.assessment),paste(report.yr))
    
    disp<-c("s", rep("s",dim(tab2)[2]))
    pathname=dir.tables
    filename="BRP_Table.csv"
    tab.env="tabular"
    align=c("l",rep("r",(dim(tab2)[2])))
    #align=NULL
    hline<-c(-1,0,(dim(tab2)[1]))
    
    lab1<-substr(filename,1,(nchar(filename)-4))
    if(Draft==F) {lab1<-paste(gsub("_", "", pref, fixed = TRUE),lab1,sep="")}   
    
    xtab2<-xtable(x=tab2,caption=BRPTab.cap,display=disp,align=align
                  ,label=lab1)
    
    #need to highlight a column...
    xtab2 <- color.column(xt=xtab2, column=paste(last.assessment), col="gray80")
    
    #Here is an example of how to alter just one cell:
    #xtab2 <- alter.cell(xt=xtab2,ncol=2,nrow=2,change="bold",col="lightblue") #
    
    print(xtable(xtab2),sanitize.text.function=function(x){x})
    
    #caption is missing!
    print.xtable(x=xtab2
                 ,file=paste(pathname,substr(filename,1,(nchar(filename)-3)),"tex",sep="") 
                 ,caption.placement="top"
                 ,tabular.environment=tab.env
                 ,floating=T
                 ,table.placement="H"              
                 ,floating.environment="table"
                 ,include.rownames=T
                 ,hline.after=hline
                 ,sanitize.text.function=function(x){x}
                 #,add.to.row=addtorow
    )
    print("___________Table 2 completed____________")
    #%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    #Projection Table
    if(!is.null(PYear)){ #Sometimes there are no projection tables
    tab3<-data.frame(PYear,PCatch,PSSB,PF)   #,OFL 
    #Option to remove firtst row from table
    #tab3=tab3[-1,]
    #Preserve the Pcatch from the first row as a foot note (usually not needed)
    Tab3note=paste0("\\footnote{Assumed ",PYear[1]," catch was ",PCatch[1]," ",CatchUnits,".}")
    #Case where the SSB is a ratio!
    if(!is.null(SSBUnits)) SSBcolName=paste("SSB",SSBUnits) else SSBcolName=ModSSB.name
      
    colnames(tab3)<-c("Year",paste("Catch",CatchUnits),SSBcolName,FF.name)  #,OFL.name
    colnames(tab3)=gsub("\\\\","\\",colnames(tab3),fixed=T) #switch out "\\\\" for "\\"
    
    #Add a blank row and relabel the columns 
    blankLine=rep(NA,dim(tab3)[2])
    tab3=rbind(tab3,blankLine,blankLine) #make an extra 2 rows
    tab3[4:dim(tab3)[1],]=tab3[2:(dim(tab3)[1]-2),] #shift everything down by 2 rows
    tab3[2,]=blankLine
    newColNm=colnames(tab3)
    tab3[3,]=newColNm
    
    
    disp<-c("s","d", rep("s",dim(tab3)[2]-1))
    pathname=dir.tables
    filename="Proj_Table.csv"
    tab.env="tabular"
    align=c("l",rep("c",(dim(tab3)[2])))
    
    #align=NULL
    hline<-c(-1,0,2,3,(dim(tab3)[1]))
    
    lab1<-substr(filename,1,(nchar(filename)-4))
    if(Draft==F) {lab1<-paste(gsub("_", "", pref, fixed = TRUE),lab1,sep="")}   
    
    xtab3<-xtable(x=tab3,caption=ProjTab.cap,display=disp,align=align
                  ,label=lab1)
    
    #print(xtable(xtab3),sanitize.text.function=function(x){x})
    
    suppressWarnings(print.xtable(x=xtab3
                 ,file=paste(pathname,substr(filename,1,(nchar(filename)-3)),"tex",sep="") 
                 ,caption.placement="top"
                 ,tabular.environment=tab.env
                 ,floating=T
                 ,floating.environment="table"
                 ,table.placement="H"         
                 ,include.rownames=F
                 ,hline.after=hline
                 ,sanitize.text.function=function(x){x}
                 #,add.to.row=addtorow
    ))
    }
    print("___________Table 3 completed____________")
    #%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    # First plot will be the stacked bar plot
    filename<-paste(dir.figures,"FisheryPlot1",sep="")
    png(filename=paste(filename,"png",sep="."),width=900,height=600, type="cairo")
  
    #list the fishery data names and preferred table names
    fish.names<-c(Fleet1.name,Fleet2.name,Fleet3.name,Fleet4.name,Fleet5.name
                  ,Fleet6.name,Fleet7.name,Fleet8.name) 
    fish.data.names<-c(Fleet1,Fleet2,Fleet3,Fleet4,Fleet5,Fleet6,Fleet7,Fleet8) 
     
    x<-na.replace(as.matrix(t(dt1[dt1[,CYear]<=term.yr,fish.data.names])))
    names1<-paste(dt1[dt1[,CYear]<=term.yr,CYear])
    dimnames(x)[[2]]<-names1
    #match the existing names to ones we have on record above
    dimnames(x)[[1]]<-fish.names[which(fish.data.names%in%dimnames(x)[[1]])]
    #figure out the scaling for the fishery plot
    #tot<-rowSums(dt1[,fish.data.names[!is.null(fish.data.names)]]) 
    if(dim(dt1)[2]>2) {
      tot<-rowSums(na.replace(dt1[,fish.data.names[!is.null(fish.data.names)]])) 
    } else tot<-(na.replace(dt1[,fish.data.names[!is.null(fish.data.names)]])) 
    
    ylim1<-c(0,max(pretty(1.1*as.numeric(na.omit(tot)))))
    
    #col1<-grey.colors(dim(x)[1])
    col1<-rainbow(dim(x)[1])
    #col1<-terrain.colors(dim(x)[1])
    #col1<-topo.colors(dim(x)[1])
    par(mar=c(4,5,4,2)+0.1,cex.axis=2,cex.lab=2.5,cex.main=2)
    
    barplot(x
            ,ylim=ylim1
            ,border="black"
            ,ylab="Total fishery removals (mt)"
            ,xlab="Year"
            ,col=col1
    )
    
    #Determine if 2 rows are needed for the plot.
    if(length(dimnames(x)[[1]])<=4) {ncol<-length(dimnames(x)[[1]])}
    if(length(dimnames(x)[[1]])%in%c(5,6)) {ncol<-3}
    if(length(dimnames(x)[[1]])%in%c(7,8)) {ncol<-4}  
    
    p1<-par()
    leg1<-shorten.catch.names(dimnames(x)[[1]])
    legend(x="top"   #0.05*(p1$usr[2]-p1$usr[1])+p1$usr[1]
           #,y=1.05*(p1$usr[4]-p1$usr[3])+p1$usr[3]
           ,legend=leg1
           ,col=col1
           ,fill=col1
           ,cex=1.5
           ,bty="n"
           ,ncol=ncol
           ,horiz=F
    )
    
    dev.off()
    print("___________Catch plot completed____________")
    #%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    #Next are the survey indices - plotting biomass by year 
    filename<-paste(dir.figures,"SurveyPlot1",sep="")
    png(filename=paste(filename,"png",sep="."),width=800,height=1000, type="cairo")
    #par(mar=c(4,8,2,2)+0.1,cex.axis=2,cex.lab=2.5,cex.main=2) #bottom, left, top, right #moved into plot function
    #The layout will depend on the number of plots required - determine that first 
    nsurv<-length(apply(rbind(Survey1,Survey2,Survey3,Survey4,Survey5,Survey6,Survey7,Survey8)
                        ,MARGIN=1,FUN=is.null)) #Count up the existing surveys 
    nrow<-nsurv;ncol<-1;
    if(nsurv==4) {ncol<-2;nrow<-2;}
    if(nsurv==5 | nsurv==6) {ncol<-2;nrow<-3;}
    if(nsurv==7 | nsurv==8) {ncol<-2;nrow<-4;}  
    l.out<-matrix(c(1:nsurv),nrow,ncol, byrow=T) #This will be a multi plot 3 stacked in this case
    nf <- layout(l.out)
    #layout.show()
    #Set the xlim range (should be the same for all of these)
    xlim1<-c(min(pretty(dt3[,SurvYear])),max(pretty(dt3[,SurvYear])))
    survs<-c(Survey1,Survey2,Survey3,Survey4,Survey5,Survey6,Survey7,Survey8)
    surv.names<-c(Survey1.name,Survey2.name,Survey3.name,Survey4.name,Survey5.name
                  ,Survey6.name,Survey7.name,Survey8.name)
    surv.CV<-c(Survey1.CV,Survey2.CV,Survey3.CV,Survey4.CV,Survey5.CV
                  ,Survey6.CV,Survey7.CV,Survey8.CV)
    for (i in 1:nsurv) {
      Ass_Model_Result_Plot(years=dt3[,SurvYear]
                            ,ts=dt3[,survs[i]]
                            #,cv=abs(0.2+rnorm(n=length(na.omit(dt3$NEFSC_Spring)),sd=0.05)) #fake confidence intervals!!
                            ,cv=check.names(dt3,surv.CV[i])
                            ,ci.method=ci.method 
                            ,target=NULL  
                            ,threshold=NULL
                            ,bounds=bounds
                            ,ts.name=" "
                            ,x.name=" "
                            ,main=surv.names[i]
                            ,xlim1=xlim1
      )
    }
    mtext(text=paste("Index ",SurveyUnits,sep=""),side=2,outer=T,line=-2.25,cex=2.5)
    mtext(text="Year",side=1,outer=T,line=-0.85,cex=2.5)
    
    dev.off()
    #get a text variable describing the ci
    if(ci.method=="lognormal") ci.descr<-paste(bounds,"\\\\% lognormal",sep="")
    if(ci.method=="gamma") ci.descr<-paste(bounds,"\\\\% gamma",sep="")
      
    print("___________Index plot completed____________")
    #%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    # pull out the model results for plotting - SSB is first
    filename<-paste(dir.figures,"SSB_plot1",sep="")
    png(filename=paste(filename,"png",sep="."),width=800,height=1000, type="cairo")
    #par(mar=c(4,5,4,2)+0.1,cex.axis=1.5,cex.lab=2,cex.main=2)
    
    #test
    #years=dt2[,ModYear];ts=dt2[,ModSSB];cv=check.names(dt2,ModSSB.CV);ci.method=ci.method;ts.old=check.names(dt2,SSB.old);main=NULL;
    #target=SSBtarget;threshold=SSBthreshold;bounds=bounds;ts.name="SSB";x.name="Year";retro.adj=B.retro.adj;ylim1=NULL;xlim1=NULL;
    
    Ass_Model_Result_Plot(years=dt2[,ModYear]
                          ,ts=dt2[,ModSSB]
                          #  ,cv=abs(0.2+rnorm(n=dim(dt2)[1],sd=0.05)) #fake confidence intervals!!
                          ,cv=check.names(dt2,ModSSB.CV)
                          ,ci.method=ci.method 
                          ,ts.old=check.names(dt2,SSB.old)
                          ,target=SSBtarget 
                          ,threshold=SSBthreshold
                          ,bounds=bounds
                          ,ts.name="Biomass"
                          ,x.name="Year"
                          ,retro.adj=if(Rho.adj & !is.null(B.retro.adj)) B.retro.adj
                          ,VPA.CI=ModSSB.CI.VPA
    )
    dev.off()
    print("___________SSB plot completed____________")
    #_____________________________________________________________________________________________
    #F plot
    filename<-paste(dir.figures,"F_plot1",sep="")
    png(filename=paste(filename,"png",sep="."),width=800,height=1000, type="cairo")
    #par(mar=c(4,5,4,2)+0.1,cex.axis=1.5,cex.lab=2,cex.main=2)
    
    Ass_Model_Result_Plot(years=dt2[,ModYear]
                          ,ts=dt2[,FF]
                          #  ,cv=abs(0.2+rnorm(n=dim(dt2)[1],sd=0.05)) #fake confidence intervals!!
                          ,cv=check.names(dt2,FF.CV)
                          ,ci.method=ci.method
                          ,ts.old=check.names(dt2,F.old)
                          ,target=Ftarget 
                          ,threshold=Fthreshold
                          ,bounds=bounds
                          ,ts.name="Exploitation rate"
                          ,x.name="Year"
                          ,retro.adj=if(Rho.adj & !is.null(F.retro.adj)) F.retro.adj
                          ,VPA.CI=FF.CI.VPA
    )
    dev.off()
    print("___________F plot completed____________")
    #_____________________________________________________________________________________________
    #Recruitment plot
    filename<-paste(dir.figures,"Recruit_plot1",sep="")
    png(filename=paste(filename,"png",sep="."),width=800,height=1000, type="cairo")
    #par(mar=c(4,5,4,2)+0.1,cex.axis=1.5,cex.lab=2,cex.main=2)
    
    Ass_Model_Result_Plot(years=dt2[,ModYear]
                          ,ts=dt2[,Recruits]
                          #  ,cv=abs(0.3+rnorm(n=dim(dt2)[1],sd=0.05)) #fake confidence intervals!!
                          ,cv=check.names(dt2,Recruits.CV)
                          ,ci.method=ci.method
                          ,ts.old=check.names(dt2,Recruits.old)
                          ,target=NULL #these are made up too
                          ,threshold=NULL
                          ,bounds=bounds
                          ,ts.name="Recruits"
                          ,x.name="Year"
                          ,VPA.CI=Recruits.CI.VPA
    )
    dev.off()
    print("___________Recruit plot completed____________")
    #%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    #test text section
    
    #%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    #write the latex file with dynamically defined variables
    
    call1<-paste( "\\def\\term_yr{",term.yr,"}" 
      ," \\def\\MyPathTab{",substr(dir.tables,1,(nchar(dir.tables)-1)),"}"
      ," \\def\\MyPathFig{",substr(dir.figures,1,(nchar(dir.figures)-1)),"}"
      ," \\def\\figFishCap{",figFish.cap,"}"
      ," \\def\\figSSBCap{",figSSB.cap,"}"
      ," \\def\\figFCap{",figF.cap,"}"  
      ," \\def\\figRecrCap{",figRecr.cap,"}"
      ," \\def\\figSurvCap{",figSurv.cap,"}"
      ," \\def\\PreAmb{",Preamble,"}"
      ," \\def\\SoS{",StateOfStock,"}"
      ," \\def\\Proj{",Project,"}"
      ," \\def\\SpecCmt{",SpecialComments,"}"
      ," \\def\\Refr{",References,"}"
      ," \\def\\Draft{",doc_status,"}"
      ," \\def\\SPPname{",SppName,"}"
      ," \\def\\SPPnameT{",SppNameTitle,"}" 
      ," \\def\\RptYr{",report.yr,"}" 
      ," \\def\\Stretch{",Stretch,"}"
      ," \\def\\ReportType{",ReportType,"}"
      ,sep="")
    #sink(paste(dir.latex,"BigCall.tex",sep=""));cat(call1);sink();  
    convert_call(bgcall=call1,dir1=dir.latex,spp="Big")
    #Now compile the latex
    call2<-paste("cd '",dir.latex, "';"," ls -l;"," pdflatex -halt-on-error MakeUpdate2.tex;",sep="")
    system(call2);system(call2); #run twice to make sure that the labeling dependencies are set!
    #Copy up one directory with the time stamp.
    system(paste("cd ",dir.latex,"../; cp ",dir.latex,"MakeUpdate2.pdf ./",pdf.name,sep=""))
    
    #%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    #This section will pull together the pieces needed to make the larger document
    if(Draft==F){
  
      #now we can reassign all the variables above with the prefix infront 
      assign(paste(pref,"term.yr",sep=""), term.yr, envir = .GlobalEnv) 
      assign(paste(pref,"figFish.cap",sep=""), figFish.cap, envir = .GlobalEnv)
      assign(paste(pref,"figSSB.cap",sep=""), figSSB.cap, envir = .GlobalEnv)
      assign(paste(pref,"figF.cap",sep=""), figF.cap, envir = .GlobalEnv)  
      assign(paste(pref,"figRecr.cap",sep=""), figRecr.cap, envir = .GlobalEnv)  
      assign(paste(pref,"figSurv.cap",sep=""), figSurv.cap, envir = .GlobalEnv)  
      assign(paste(pref,"Preamble",sep=""), Preamble, envir = .GlobalEnv)  
      assign(paste(pref,"StateOfStock",sep=""), StateOfStock, envir = .GlobalEnv)  
      assign(paste(pref,"Project",sep=""), Project, envir = .GlobalEnv)  
      assign(paste(pref,"SpecialComments",sep=""), SpecialComments, envir = .GlobalEnv)  
      assign(paste(pref,"References",sep=""), References, envir = .GlobalEnv)    
      assign(paste(pref,"doc_status",sep=""), doc_status, envir = .GlobalEnv)    
      assign(paste(pref,"SppName",sep=""), SppName, envir = .GlobalEnv)    
      assign(paste(pref,"SppNameTitle",sep=""), SppNameTitle, envir = .GlobalEnv)    
      assign(paste(pref,"report.yr",sep=""), report.yr, envir = .GlobalEnv)    
      assign(paste(pref,"References",sep=""), References, envir = .GlobalEnv) 
      assign(paste(pref,"Author",sep=""), auth, envir = .GlobalEnv)
      #Need to save the paths to the tables and figs
      assign(paste(pref,"dir.tables",sep=""), dir.tables, envir = .GlobalEnv)  
      assign(paste(pref,"dir.figures",sep=""), dir.figures, envir = .GlobalEnv)   
      #all these values are now stock specific - next save the path to the reviewer comments - these
      #should be pdf'd ahead of time. 
      assign(paste(pref,"Reviewer_Comments",sep=""), inp[inp$Stock==SppName,"Path_Reviewer_Cmmnts"], envir = .GlobalEnv)      
    }
    
}

#%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
#This is used to generate the big report - it evaluates the species specific versions of these variables and pastes
#Them into one big string which can be passed to the latex doc....
#test
#paste(pref,"MyPathFig{",substr(eval(parse(text=paste(pref,"dir.figures",sep="")))
#                  ,1,(nchar(eval(parse(text=paste(pref,"dir.figures",sep=""))))-1)),"}",sep="")
SPP_LatexCall<-function(pref){
  Texpref<-gsub("_", "", pref, fixed = TRUE)
  call1<-paste(
      " \\\\def\\\\",Texpref,"MyPathTab{",substr(eval(parse(text=paste(pref,"dir.tables",sep="")))
                  ,1,(nchar(eval(parse(text=paste(pref,"dir.tables",sep=""))))-1)),"}"
      ," \\\\def\\\\",Texpref,"MyPathFig{",substr(eval(parse(text=paste(pref,"dir.figures",sep="")))
                  ,1,(nchar(eval(parse(text=paste(pref,"dir.figures",sep=""))))-1)),"}"
      ," \\\\def\\\\",Texpref,"figFishCap{",eval(parse(text=paste(pref,"figFish.cap",sep=""))),"}"
      ," \\\\def\\\\",Texpref,"figSSBCap{",eval(parse(text=paste(pref,"figSSB.cap",sep=""))),"}"
      ," \\\\def\\\\",Texpref,"figFCap{",eval(parse(text=paste(pref,"figF.cap",sep=""))),"}"  
      ," \\\\def\\\\",Texpref,"figRecrCap{",eval(parse(text=paste(pref,"figRecr.cap",sep=""))),"}"
      ," \\\\def\\\\",Texpref,"figSurvCap{",eval(parse(text=paste(pref,"figSurv.cap",sep=""))),"}"
      
      ," \\\\def\\\\",Texpref,"FMSYvalue{",eval(parse(text=paste0(pref,"FMSY"))),"}"
      ," \\\\def\\\\",Texpref,"SSBMSYvalue{",eval(parse(text=paste0(pref,"SSBMSY"))),"}"      
      ," \\\\def\\\\",Texpref,"MSYvalue{",eval(parse(text=paste0(pref,"MSY"))),"}"      
      
      ," \\\\def\\\\",Texpref,"PreAmb{",eval(parse(text=paste(pref,"Preamble",sep=""))),"}"
      ," \\\\def\\\\",Texpref,"SoS{",eval(parse(text=paste(pref,"StateOfStock",sep=""))),"}"
      ," \\\\def\\\\",Texpref,"Proj{",eval(parse(text=paste(pref,"Project",sep=""))),"}"
      ," \\\\def\\\\",Texpref,"SpecCmt{",eval(parse(text=paste(pref,"SpecialComments",sep=""))),"}"
      ," \\\\def\\\\",Texpref,"Refr{",eval(parse(text=paste(pref,"References",sep=""))),"}"
      ," \\\\def\\\\",Texpref,"Draft{",eval(parse(text=paste(pref,"doc_status",sep=""))),"}"
      ," \\\\def\\\\",Texpref,"SPPname{",eval(parse(text=paste(pref,"SppName",sep=""))),"}"
      ," \\\\def\\\\",Texpref,"SPPnameT{",eval(parse(text=paste(pref,"SppNameTitle",sep=""))) ,"}" 
      ," \\\\def\\\\",Texpref,"RptYr{",eval(parse(text=paste(pref,"report.yr",sep=""))) ,"}" 
      ," \\\\def\\\\",Texpref,"Author{",eval(parse(text=paste(pref,"Author",sep=""))) ,"}"     
      ," \\\\def\\\\",Texpref,"ReviewerComments{",eval(parse(text=paste(pref,"Reviewer_Comments",sep=""))) ,"}"       
      ,sep="")
    #Need to gsub the references to make them species specific as well - otherwise you get multiply defined labels
    call1 <- gsub("F\\_plot1", paste(Texpref,"F\\_plot1",sep=""), call1, fixed = TRUE)
    call1 <- gsub("SSB\\_plot1", paste(Texpref,"SSB\\_plot1",sep=""), call1, fixed = TRUE)
    call1 <- gsub("Recruit\\_plot1", paste(Texpref,"Recruit\\_plot1",sep=""), call1, fixed = TRUE)
    call1 <- gsub("Surv\\_plot1", paste(Texpref,"Surv\\_plot1",sep=""), call1, fixed = TRUE)
    call1 <- gsub("Fish\\_plot1", paste(Texpref,"Fish\\_plot1",sep=""), call1, fixed = TRUE)
    call1 <- gsub("Recr\\_plot1", paste(Texpref,"Recr\\_plot1",sep=""), call1, fixed = TRUE) 
    #I don't think these are used, but justin case...
    call1 <- gsub("SurveyPlot1", paste(Texpref,"SurveyPlot1",sep=""), call1, fixed = TRUE) 
    call1 <- gsub("FisheryPlot1", paste(Texpref,"FisheryPlot1",sep=""), call1, fixed = TRUE) 
    call1 <- gsub("Recruitplot1", paste(Texpref,"Recruitplot1",sep=""), call1, fixed = TRUE)
    #Tables refs
    call1 <- gsub("Proj\\_Table", paste(Texpref,"Proj\\_Table",sep=""), call1, fixed = TRUE)   
    call1 <- gsub("BRP\\_Table", paste(Texpref,"BRP\\_Table",sep=""), call1, fixed = TRUE)   
    call1 <- gsub("Catch\\_Status\\_Table", paste(Texpref,"Catch\\_Status\\_Table",sep=""), call1, fixed = TRUE)   
  return(call1)
}
#%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
PullTextValues<-function(){
  #This function just uses the data inputs to generate some variables useful for text strings in the report
  #Load the objects in memory here
  load("TextVals.RData")
  if(!"Rho.adj"%in%objects()) Rho.adj<-F
  if(!"SSBMSYpt.est"%in%objects()) SSBMSYpt.est<-NULL
  if(!"FMSYpt.est"%in%objects()) FMSYpt.est<-NULL
  
  if( is.null(Rho.adj) | Rho.adj==F) { #if retro adj. is uses for status then...
    term.SSB<-prettyNum(dt2[dt2[,ModYear]==term.yr,ModSSB],big.mark=",",scientific=F)   #terminal year biomass
    if(!is.null(SSBMSYpt.est)) {perc.SSBMSY<-round((dt2[dt2[,ModYear]==term.yr,ModSSB]/SSBMSYpt.est)*100) 
          } else    perc.SSBMSY<-NULL        #calculate % SSBMSY
    term.F<-dt2[dt2[,ModYear]==term.yr,FF]                                              #terminal year F
    if(!is.null(FMSYpt.est)) {perc.FMSY<-round((dt2[dt2[,ModYear]==term.yr,FF]/FMSYpt.est)*100)   
            } else    perc.FMSY<-NULL #% FMSY    
  } else { #otherwise...
    term.SSB<-prettyNum(B.retro.adj,big.mark=",",scientific=F)   #terminal year biomass using retro adj.
    if(!is.null(SSBMSYpt.est)) { perc.SSBMSY<-round((B.retro.adj/SSBMSYpt.est)*100)  
      } else   perc.SSBMSY<-NULL    #calculate % SSBMSY using retro adj.
    term.F<-prettyNum(F.retro.adj,big.mark=",",scientific=F)   #terminal year biomass using retro adj.
    if(!is.null(FMSYpt.est)) {perc.FMSY<-round((F.retro.adj/FMSYpt.est)*100)           
      } else    perc.FMSY<-NULL #calculate % SSBMSY using retro adj. 
  }
  if(is.numeric(SSBMSYpt.est)) val.SSBMSY<-prettyNum(SSBMSYpt.est,big.mark=",",scientific=F)                       #SSBMSY 
  if(!is.numeric(SSBMSYpt.est)) val.SSBMSY<-SSBMSYpt.est
  first.mod.yr<-min(dt2[is.finite(dt2[,ModSSB]),ModYear])                             #first model year
  #assign these globally so they can be used in the rest of the r script
  assign("term.SSB",term.SSB, envir = .GlobalEnv)
  assign("perc.SSBMSY",perc.SSBMSY, envir = .GlobalEnv)
  assign("term.F",term.F, envir = .GlobalEnv)
  assign("perc.FMSY",perc.FMSY, envir = .GlobalEnv)
  assign("val.SSBMSY",val.SSBMSY, envir = .GlobalEnv)
  assign("first.mod.yr",first.mod.yr, envir = .GlobalEnv)
}
#%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

PullCI<-function(){
 #This is a way to get the CI for text reporting - and making a big table later 
  load("CIVals.RData")
  obj<-objects()
  if(!"ModSSB"%in%obj) ModSSB<-NULL
  if(!"ModSSB.CV"%in%obj) ModSSB.CV<-NULL  
  if(!"FF"%in%obj) FF<-NULL
  if(!"FF.CV"%in%obj) FF.CV<-NULL  
  if(!"SSBthreshold"%in%obj) SSBthreshold<-NULL
  if(!"SSBtarget"%in%obj) SSBtarget<-NULL
  if(!"Fthreshold"%in%obj) Fthreshold<-NULL
  if(!"Ftarget"%in%obj) Ftarget<-NULL
  if(!"F.retro.adj"%in%obj) F.retro.adj<-NULL
  if(!"B.retro.adj"%in%obj) B.retro.adj<-NULL
  if(!"ModSSB.CI.VPA"%in%obj) ModSSB.CI.VPA<-NULL
  if(!"FF.CI.VPA"%in%obj) FF.CI.VPA<-NULL
  if(!"Recruits.CI.VPA"%in%obj) Recruits.CI.VPA<-NULL
  if(!"ModSSB.CV"%in%obj) ModSSB.CV<-NULL
  if(!"FF.CV"%in%obj) FF.CV<-NULL
  if(!"SSB.old"%in%obj) SSB.old<-NULL
  if(!"F.old"%in%obj) F.old<-NULL
  if(!"ModSSB.name"%in%obj) ModSSB.name<-NULL
  if(!"FF.name"%in%obj) FF.name<-NULL
  if(!"FMSY.name"%in%obj) FMSY.name<-NULL
  if(!"SSBMSY.name"%in%obj) SSBMSY.name<-NULL
  if(!"MSY.name"%in%obj) MSY.name<-NULL
  if(!"F.Status.name"%in%obj) F.Status.name<-NULL
  if(!"B.Status.name"%in%obj) B.Status.name<-NULL
  if(!"ModSSB"%in%obj) ModSSB<-NULL
  #I'm using the plot function to pull the CI's - which is huge pain because of all the different methods available
  tmp<-Ass_Model_Result_Plot(years=dt2[,ModYear]
                        ,ts=dt2[,ModSSB]
                        #  ,cv=abs(0.2+rnorm(n=dim(dt2)[1],sd=0.05)) #fake confidence intervals!!
                        ,cv=check.names(dt2,ModSSB.CV)
                        ,ci.method=ci.method 
                        ,ts.old=check.names(dt2,SSB.old)
                        ,target=SSBtarget 
                        ,threshold=SSBthreshold
                        ,bounds=bounds
                        ,ts.name="Biomass"
                        ,x.name="Year"
                        ,retro.adj=B.retro.adj
                        ,VPA.CI=ModSSB.CI.VPA
                        ,just.ci=T
                        ,plot=F
  )
  CLL<-tmp[1];CLU<-tmp[2];
  #Now assign these globally
  assign("BCLL",round(CLL), envir = .GlobalEnv)
  assign("BCLU",round(CLU), envir = .GlobalEnv)
 
  tmp<-Ass_Model_Result_Plot(years=dt2[,ModYear]
                        ,ts=dt2[,FF]
                        #  ,cv=abs(0.2+rnorm(n=dim(dt2)[1],sd=0.05)) #fake confidence intervals!!
                        ,cv=check.names(dt2,FF.CV)
                        ,ci.method=ci.method
                        ,ts.old=check.names(dt2,F.old)
                        ,target=Ftarget 
                        ,threshold=Fthreshold
                        ,bounds=bounds
                        ,ts.name="Exploitation rate"
                        ,x.name="Year"
                        ,retro.adj=F.retro.adj
                        ,VPA.CI=FF.CI.VPA
                        ,just.ci=T
                        ,plot=F
  )
  CLL<-tmp[1];CLU<-tmp[2];
  #Now assign these globally
  assign("FCLL",round(CLL,3), envir = .GlobalEnv)
  assign("FCLU",round(CLU,3), envir = .GlobalEnv)
}
#%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
#%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
Filter<-function(x) {x<-suppressWarnings(apply(x,2,FUN=function(x) return(ifelse(x=="NULL",NA,as.numeric(x))))) #remove character nulls
  return(x[,colSums(is.na(x))<nrow(x)])} #drop columns that are all NA
#%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
getTimeFlag<-function(){tm<-paste(Sys.time());tm<-gsub("-","_",tm);tm<-gsub(":","",tm);tm<-gsub(" ","_",tm);return(tm)}
#%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
get.data<-function(dir1,fnames=c("catch_data.csv","model_results.csv","survey_results.csv")){
  #%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  # Globally define data and paths.  dir1 is the working directory
  assign("fnames", fnames, envir = .GlobalEnv)
  # Set directories relative to the working directory
  #%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
  dir.data=paste(dir1,"data/",sep="")
  assign("dir.data", dir.data, envir = .GlobalEnv)
  dir.tables=paste(dir1,"tables/",sep="")
  assign("dir.tables", dir.tables, envir = .GlobalEnv)  
  dir.figures=paste(dir1,"figures/",sep="")
  assign("dir.figures", dir.figures, envir = .GlobalEnv)  
  dir.latex=paste(dir1,"latex/",sep="")
  assign("dir.latex", dir.latex, envir = .GlobalEnv)   
 #%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  # Read data from the net
  #________________________________________________________________________________
  options(stringsAsFactors = FALSE)
  #filename1="catch_data.csv"
  filename1<-fnames[1]
  dt1<-read.csv(paste(dir.data,filename1,sep=""))
  dt1<-Filter(dt1)
  #str(dt1)
  assign("dt1", dt1, envir = .GlobalEnv) 
  #Now we need the model output
  #filename1="model_results.csv"
  filename1<-fnames[2]
  dt2<-read.csv(paste(dir.data,filename1,sep=""))
  dt2<-Filter(dt2)
  #str(dt2)
  assign("dt2", dt2, envir = .GlobalEnv) 
  #filename1="survey_results.csv" #Pull in the survey indices as well
  filename1<-fnames[3]
  dt3=read.csv(paste(dir.data,filename1,sep=""))
  dt3<-Filter(dt3)
  assign("dt3", dt3, envir = .GlobalEnv)   
  #str(dt3)  

  #define some common latex terms
  assign("sosHead.tx"," \\\\textbf{State of Stock: }{}", envir = .GlobalEnv)
  assign("fig1.2.ref"," (Figures \\\\ref{SSB_plot1}-\\\\ref{F_plot1}){}", envir = .GlobalEnv)
  assign("fig1.ref"," Figure \\\\ref{SSB_plot1}{}", envir = .GlobalEnv)
  assign("fig2.ref"," Figure \\\\ref{F_plot1}{}", envir = .GlobalEnv)
  assign("fig3.ref"," Figure \\\\ref{Recr_plot1}{}", envir = .GlobalEnv)  
  assign("fig4.ref"," Figure \\\\ref{Fish_plot1}{}", envir = .GlobalEnv)
  assign("fig5.ref"," Figure \\\\ref{Surv_plot1}{}", envir = .GlobalEnv)
  assign("tab1.ref"," Table \\\\ref{Catch_Status_Table}{}", envir = .GlobalEnv)  
  assign("tab2.ref"," Table \\\\ref{BRP_Table}{}", envir = .GlobalEnv)
  assign("tab3.ref"," Table \\\\ref{Proj_Table}{}", envir = .GlobalEnv) 
  assign("Miller.ref","(Miller et al., 2017)", envir = .GlobalEnv)
  assign("SSBMSY.tx"," $SSB_{MSY}${}", envir = .GlobalEnv)
  assign("FMSY.tx", " $F_{MSY}${}", envir = .GlobalEnv)
  assign("FMSYproxy.tx", " $F_{MSY}${} \\\\textit{proxy}{}", envir = .GlobalEnv)
  assign("EMSY.tx", " $E_{MSY}${}", envir = .GlobalEnv)
  assign("EMSYproxy.tx", " $E_{MSY}${} \\\\textit{proxy}{}", envir = .GlobalEnv) 
  assign("RMSY.tx", " $R_{MSY}${}", envir = .GlobalEnv)
  assign("RMSYproxy.tx", " $R_{MSY}${} \\\\textit{proxy}{}", envir = .GlobalEnv)   
  assign("F30.tx", " $F_{30\\%}${}", envir = .GlobalEnv)
  assign("F35.tx", " $F_{35\\%}${}", envir = .GlobalEnv) 
  assign("F40.tx", " $F_{40\\%}${}", envir = .GlobalEnv) 
  assign("F45.tx", " $F_{45\\%}${}", envir = .GlobalEnv) 
  assign("F50.tx", " $F_{50\\%}${}", envir = .GlobalEnv)
  assign("E30.tx", " $E_{30\\%}${}", envir = .GlobalEnv)
  assign("E35.tx", " $E_{35\\%}${}", envir = .GlobalEnv) 
  assign("E40.tx", " $E_{40\\%}${}", envir = .GlobalEnv) 
  assign("E45.tx", " $E_{45\\%}${}", envir = .GlobalEnv) 
  assign("E50.tx", " $E_{50\\%}${}", envir = .GlobalEnv)  
  assign("FFull.tx", " $F_{Full}${}", envir = .GlobalEnv) 
  assign("Favg5to7.tx", " $\\bar{F}_{5-7}${}", envir = .GlobalEnv)
  assign("EFull.tx", " $E_{Full}${}", envir = .GlobalEnv) #fully selected exploitation rate
  assign("Ftarg.tx", " $F_{Target}${}", envir = .GlobalEnv) 
  assign("Fthresh.tx", " $F_{Threshold}${}", envir = .GlobalEnv)
  assign("Frebuild.tx", " $F_{Rebuild}${}", envir = .GlobalEnv)
  assign("F0.1.tx", " $F_{0.1}${}", envir = .GlobalEnv)
  assign("Fbar.tx", " $\\bar{F}${}", envir = .GlobalEnv)  
  assign("Etarg.tx", " $E_{Target}${}", envir = .GlobalEnv) 
  assign("Ethresh.tx", " $E_{Threshold}${}", envir = .GlobalEnv)
  assign("Erebuild.tx", " $E_{Rebuild}${}", envir = .GlobalEnv)
  assign("E0.1.tx", " $E_{0.1}${}", envir = .GlobalEnv)
  assign("Ebar.tx", " $\\bar{E}${}", envir = .GlobalEnv)    
  assign("SSBbar.tx", " $\\bar{SSB}${}", envir = .GlobalEnv)  
  assign("SSBMSY.tx", " $SSB_{MSY}${}", envir = .GlobalEnv)
  assign("SSBMSYproxy.tx", " $SSB_{MSY}${} \\\\textit{proxy}{}", envir = .GlobalEnv)  
  assign("SSBtarg.tx", " $SSB_{Target}${}", envir = .GlobalEnv) 
  assign("SSBthresh.tx", " $SSB_{Threshold}${}", envir = .GlobalEnv)
  assign("BMSY.tx", " $B_{MSY}${}", envir = .GlobalEnv)
  assign("BMSYproxy.tx", " $B_{MSY}${} \\\\textit{proxy}{}", envir = .GlobalEnv)  
  assign("Btarg.tx", " $B_{Target}${}", envir = .GlobalEnv) 
  assign("Bthresh.tx", " $B_{Threshold}${}", envir = .GlobalEnv)
  assign("F.Status.tx", " \\\\textit{Overfishing}{}", envir = .GlobalEnv)  
  assign("B.Status.tx", " \\\\textit{Overfished}{}", envir = .GlobalEnv)  
  assign("half.tx", " $\\\\dfrac{1}{2}${}", envir = .GlobalEnv)   
  assign("Fratio.tx", " $\\\\frac{F}{F_{Threshold}}${}", envir = .GlobalEnv)  
  assign("Bratio.tx", " $\\\\frac{B}{B_{Threshold}}${}", envir = .GlobalEnv)  
  assign("SSBratio.tx", " $\\\\frac{SSB}{SSB_{Threshold}}${}", envir = .GlobalEnv)  
  assign("ProjHead.tx"," \\\\textbf{Projections: }{}", envir = .GlobalEnv)  
  assign("SpecComHead.tx"," \\\\textbf{Special Comments: } \\\\begin{itemize}{}", envir = .GlobalEnv)  
  assign("item.tx"," \\\\item{}", envir = .GlobalEnv)
  assign("beginitem.tx"," \\\\begin{itemize}{}", envir = .GlobalEnv)    
  assign("enditem.tx"," \\\\end{itemize}{}", envir = .GlobalEnv)  
  assign("RefHead.tx"," \\\\textbf{References: }{}", envir = .GlobalEnv)
  assign("lbreak.tx",  " \\\\linebreak{}", envir = .GlobalEnv)
  assign("indent.tx",  " \\\\hspace*{0.5cm}", envir = .GlobalEnv)
  assign("rho.tx",  " \\\\textrho{}", envir = .GlobalEnv)
  assign("alpha.tx",  " \\\\textalpha{}", envir = .GlobalEnv)
  assign("beta.tx",  " \\\\textbeta{}", envir = .GlobalEnv)  
  assign("gamma.tx",  " \\\\textgamma{}", envir = .GlobalEnv)
  assign("delta.tx",  " \\\\textdelta{}", envir = .GlobalEnv)
  assign("epsilon.tx",  " \\\\textepsilon{}", envir = .GlobalEnv)
  assign("mu.tx",  " \\\\textmu{}", envir = .GlobalEnv)
  assign("lambda.tx",  " \\\\textlambda{}", envir = .GlobalEnv)
  assign("sigma.tx",  " \\\\textsigma{}", envir = .GlobalEnv) 
  assign("lt.tx",  " \\\\textless{}", envir = .GlobalEnv) 
  assign("gt.tx",  " \\\\textgreater{}", envir = .GlobalEnv)  
  assign("le.tx",  " $\\\\leq${}", envir = .GlobalEnv) 
  assign("ge.tx",  " $\\\\geq${}", envir = .GlobalEnv)
  assign("rhoSSB.tx",  " $SSB_{\\\\rho}${}", envir = .GlobalEnv) 
  assign("rhoB.tx",  " $B_{\\\\rho}${}", envir = .GlobalEnv)  
  assign("rhoF.tx",  " $F_{\\\\rho}${}", envir = .GlobalEnv)
  assign("PortalLink.tx", "\\\\href{http://www.nefsc.noaa.gov/saw/sasi/sasi_report_options.php}{SASINF}{}" ,envir = .GlobalEnv)
  assign("RhoDecisionTab.ref"," Table \\\\ref{RhoDecision_tab}{}", envir = .GlobalEnv)
  #upload directory - not used
  #assign("dir.upload",  "/home/dhennen/EIEIO/BigReport/test_upload/", envir = .GlobalEnv)
}
#%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%#
# A little function to make an F average tex variable based on user supplied ages
MakeFavg=function(age1,age2){
  assign("Favg.tx", paste0(" $\\bar{F}_{",age1,"-",age2,"}${}"), envir = .GlobalEnv)
}
#%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%#
col2hex<-function(col){
  #convert a color from names "col" to a hexadecimal representation
  return(rgb(t(col2rgb(col))/255))
}
#%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
color.column <- function(xt, column, col='gray80') {
  # color.column - color the columns of a table for LaTeX output.
  #xt is an xtable object, column is the column name you want to color, col is a color
  # Make sure the colorspace library is loaded to convert rgb to hex.
  clr.string <- (col2hex(col))
  clr.string <- substring(clr.string, 2) # Remove the hash prefix.
   
  indx <- which(colnames(xt) == column)
  # Grab the digits and display values set by xtable
  digt <- attr(xt, 'digits')[indx+1]
  disply <- attr(xt, 'display')[indx+1]
  
  formatted.vals <- formatC(paste(xt[, column]), digits=digt, format=disply)
   
  formatted.column <- paste('\\cellcolor[HTML]{', clr.string, '}', formatted.vals, sep='')
  xt[, column] <- formatted.column
  xt
}
#%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
na.replace<-function(x,rep1=0){
#This function will replace NA's in
#vector x with rep1 (0 is the default)
  for(i in 1:length(x)){
    if(is.finite(as.numeric(x[i]))==F) {
      x[i]<-rep1
    }
  }
  return(x)
}
#%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
last <- function(x) { tail(x, n = 1) }
#%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
#Both of these confidence intervals are set to 95% - change 'em if you want to!
asm.ci<-function(x,cv.x,bounds=95){
  #generate approximate 95% confidence intervals based on log normal variable x
  #and it's cv. cv.x
  s<-sqrt(log(1+cv.x^2))
  s<-ifelse(is.finite(s),s,0)
  p<-(1-(bounds/100))/2
  Z<-qnorm(p)
  lci<-x*exp(Z*(s))
  uci<-x*exp(-Z*(s))
  return(data.frame("lci"=lci,"uci"=uci)) 
}
gamma.ci<-function(ts,cv,bounds=95){
  #ts is your data and cv its cv
  #lp and up are the lower and upper probabilities for your gamma CI's
  cv2<-(1/cv)^2
  scale=ts/cv2
  shape=ts/scale
  lp<-(1-(bounds/100))/2
  up<-1-lp
  LB=qgamma(p=lp,shape=shape,scale=scale)
  UB=qgamma(p=up,shape=shape,scale=scale)
  return(data.frame("lci"=LB,"uci"=UB))
}
normal.ci<-function(x,cv.x,bounds=95){
  #generate approximate (bounds)% confidence intervals based on normal variable x
  #and it's cv. cv.x
  s<-cv.x*x
  s<-ifelse(is.finite(s),s,0)
  error <- qnorm((1-(bounds/100))/2)*s
  lci<-x+error
  uci<-x-error
  return(data.frame("lci"=lci,"uci"=uci)) 
}
#%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
#Convert a named color to a transparent equivalent
transparent<-function(col,deg){
  #col is the color, deg is the amount of transparency desired from 1 (almost invisible) 
  #to 100 (opaque).  
  deg<-(deg/100)*255
  return(rgb(red=col2rgb(col)[1,1],green=col2rgb(col)[2,1],blue=col2rgb(col)[3,1],alpha=deg
      ,maxColorValue=255))  
}
#%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
check.names<-function(x,n1){if(is.null(n1)) return(NULL);if(n1 %in% names(x) | n1 %in% unlist(dimnames(x))) {return(x[,n1])
  } else return(NULL)
}
#%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
cv.check<-function(x,n1){if(is.null(n1)) return(NULL);if(n1 %in% names(x) | n1 %in% unlist(dimnames(x))) {return(x[,n1])
} else return(NULL)
} #legacy function!
#%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
#____________________________________________________________________________________________________________
Ass_Model_Result_Plot<-function( # Function to draw a model results plot. 
  years=NULL #years of your time series of model results
  ,ts=NULL # ts is the time series of point estimates (e.g. SSB)
  ,cv=NULL #cv for the point estimates  
  ,ci.method="lognormal" #confidence interval method - can be either "lognormal" or "gamma"
  ,ts.old=NULL #the ts from the last assessment (same variable) for comparison 
  ,target=NULL # value (in ts units) of the target line
  ,threshold=NULL #value (in ts units) of the theshold line
  ,bounds=95 #what percentile should your confidence bounds be?
  ,main=NULL
  ,x.name=NULL #name for x axis if null, you'll get "Year"
  ,ts.name=NULL #name of your ts variable (e.g. "SSB")
  ,xlim1=NULL #can set a fixed xlim here (should be a vector of length 2)
  ,ylim1=NULL #can set a fixed ylim here (should be a vector of length 2) 
  ,retro.adj=NULL #an adjustment to the terminal data point based on a retrospective pattern
  ,VPA.CI=NULL #use special CI from VPA assessment
  ,just.ci=F
  ,plot=T
  ){ 
#____________________________________________________________________________________________________________
  if(dim(data.frame(ts))[2]==0) return(paste("No ",ts.name," sent to plot function",sep="")) else{
    years<-years[!is.na(ts)]
    cv<-cv[!is.na(ts)];  #cv<-ifelse(cv=="NULL",NA,as.numeric(cv));
    ts.old<-ts.old[!is.na(ts)]   
    ts<-ts[!is.na(ts)] #kill the NA
    
    #get the ci
    if(!is.null(cv) & suppressWarnings(sum(!is.na(cv)))>1){
      if(ci.method=="lognormal") {ci<-asm.ci(x=ts,cv.x=cv,bounds=bounds)
        }else if(ci.method=="gamma") {ci<-gamma.ci(ts,cv,bounds)
          }else if(ci.method=="normal") {ci<-normal.ci(ts,cv,bounds)                          
            }else {return("ERROR - unrecognized ci.method")}  
      ylim2<-range(pretty(c(0,max(c(ci$uci,threshold,target,suppressWarnings(max(ts.old[!is.na(ts.old)])) )))))
    } 
    if(is.null(cv)) {ylim2<-range(pretty(c(0,max(c(ts,threshold,target,suppressWarnings(max(ts.old[!is.na(ts.old)])))))))}
    if(suppressWarnings(sum(!is.na(cv)))==1) { #VPA case
        if(ci.method=="lognormal") {ci<-asm.ci(x=ts[!is.na(cv)],cv.x=cv[!is.na(cv)],bounds=bounds)
          }else if(ci.method=="gamma") {ci<-gamma.ci(ts[!is.na(cv)],cv[!is.na(cv)],bounds)
            }else if(ci.method=="normal") {ci<-normal.ci(ts[!is.na(cv)],cv[!is.na(cv)],bounds)
              }else {return("ERROR - unrecognized ci.method")}
       ylim2<-range(pretty(c(0,max(c(max(ts),ci$uci,threshold,target,suppressWarnings(max(ts.old[!is.na(ts.old)])) ))))) 
    }
    
    #There is still one more way to specify CI for VPA
    if(!is.null(cv) & suppressWarnings(sum(!is.na(cv)))==1) { #VPA case
        if(ci.method=="lognormal") {ci<-asm.ci(x=ts[!is.na(cv)],cv.x=cv[!is.na(cv)],bounds=bounds)
          }else if(ci.method=="gamma") {ci<-gamma.ci(ts[!is.na(cv)],cv[!is.na(cv)],bounds)
            }else if(ci.method=="normal") {ci<-normal.ci(ts[!is.na(cv)],cv[!is.na(cv)],bounds)
              }else {return("ERROR - unrecognized ci.method")}
       ylim2<-range(pretty(c(0,max(c(max(ts),ci$uci,threshold,target,suppressWarnings(max(ts.old[!is.na(ts.old)])) ))))) 
    }
    
    if(!is.null(VPA.CI)) { #Another way to specify VPA CI
      ci<-data.frame("lci"=VPA.CI[1],"uci"=VPA.CI[2])
      ylim2<-range(pretty(c(0,max(c(max(ts),ci$uci,threshold,target,suppressWarnings(max(ts.old[!is.na(ts.old)])) )))))
    }
    
    if(is.null(ylim1)) ylim1<-ylim2
    
    if(is.null(xlim1)) xlim1<-c(min(pretty(years)),max(pretty(years)))  
    x.lab1<-x.name
    if(is.null(x.name)) xlab1<-"Year"
    main<-main
    if("ci"%in%objects()) {CLL<-last(ci$lci);CLU<-last(ci$uci); #this is used in text and tables
    } else{CLL<-NULL;CLU<-NULL} #will return null values in this case
    if(plot){
      par(mar=c(4,5,4,2)+0.1,cex.axis=2,cex.lab=2.5,cex.main=2) #bottom, left, top, right
      plot(ts~years
          ,ylab=ts.name
          ,xlab=x.lab1
          ,main=main
          ,type="l"
          ,lty=1
          ,lwd=3
          ,xlim=xlim1
          ,ylim=ylim1
          ,frame=F
        )  
      if(is.null(VPA.CI)) if(!is.null(cv) & suppressWarnings(sum(!is.na(cv)))>1){
        x1<-c(years,rev(years))
        y1<-c(ci$uci,rev(ci$lci))
        polygon(x=x1
          ,y=y1
          ,col=transparent("gray",75)
          ,border = NA
        )
      }  
      #In VPA there is only one year of confidence intervals!
      if(suppressWarnings(sum(!is.na(cv)))==1){
        x1<-years[suppressWarnings(!is.na(cv))]
        y1<-ci$lci;y2<-ci$uci; 
        arrows(x1, y1, x1, y2, length=0.15, angle=90, code=3,lwd=2)      
      }    
      if(!is.null(VPA.CI)) {
        x1<-as.numeric(term.yr)
        y1<-ci$lci;y2<-ci$uci; 
        arrows(x1, y1, x1, y2, length=0.15, angle=90, code=3,lwd=2)
      }   
      lines(ts~years #redrawing the line to make it clear
        ,col="black"
        ,lwd=3
        ,lty=1
      )
      abline(h=threshold #threshold will be dashed
        ,lwd=2
        ,lty=2
      )
      abline(h=target #target will be a dotted line
        ,lwd=2
        ,lty=3
      ) 
      if(!is.null(ts.old)) {lines(ts.old[!is.na(ts.old)]~years[!is.na(ts.old)] #redrawing the line to make it clear
          ,col="black"
          ,lwd=3
          ,lty=2
        )
      }
      if(!is.null(retro.adj)){
        points(x=last(years[!is.na(ts)]),y=retro.adj,pch=20,col="red",cex=2)
        lines(x=c(rep(last(years[!is.na(ts)]),2)),y=c(retro.adj,last(ts)),lty=1,lwd=2,col="red")
      }
    }
    if(just.ci) return(c(CLL,CLU))
  }  
}
#%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
#This is based on the xtable code - should be useful for text cleaning before porting to LaTex!
#Escapes disallowed characters.  
sanitize <- function(str) { 
  result <- str
  #these just need to be escaped
  result <- gsub("$", "\\$", result, fixed = TRUE)
  result <- gsub(">", "\\$\\>\\$", result, fixed = TRUE)
  result <- gsub("<", "\\$\\<\\$", result, fixed = TRUE)
  result <- gsub("|", "\\$|\\$", result, fixed = TRUE)
  result <- gsub("%", "\\%", result, fixed = TRUE)
  result <- gsub("\\%", "\\\\%", result, fixed = TRUE)  #need 4 escapes for %!
  result <- gsub("&", "\\&", result, fixed = TRUE)
  result <- gsub("-", "\\-", result, fixed = TRUE)
  result <- gsub("_", "\\_", result, fixed = TRUE)
  result <- gsub("[", "\\[", result, fixed = TRUE)
  result <- gsub("]", "\\]", result, fixed = TRUE)  
  result <- gsub(";", "\\;", result, fixed = TRUE)
  result <- gsub("*", "\\*", result, fixed = TRUE)  
  result <- gsub("#", "\\#", result, fixed = TRUE)
  result <- gsub("(", "\\(", result, fixed = TRUE)
  result <- gsub(")", "\\)", result, fixed = TRUE)   
  result <- gsub("~", "\\~{}", result, fixed = TRUE)
  result <- gsub("/", "\\/", result, fixed = TRUE)
  result <- gsub("'", "\\'", result, fixed = TRUE)  
  #close up leading and trailing spaces in parentheses and leading spaces to semicolons
  result <- gsub("\\( ", "\\(", result, fixed = TRUE)  
  result <- gsub(" \\)", "\\)", result, fixed = TRUE)
  result <- gsub("\\) ", "\\)  ", result, fixed = TRUE) #This removes the space after a parentheses,
  #but it prevents crazy line break behavior which I can't figure out!
  result <- gsub(" \\;", "\\;", result, fixed = TRUE)  
  #replace XXth, etc with Latex compatible superscripting 
  result <- gsub("([0-9])(th)", "\\1$^{th}$", result,perl=T)  
  result <- gsub("([0-9])(rd)", "\\1$^{rd}$", result,perl=T)  
  result <- gsub("([0-9])(nd)", "\\1$^{nd}$", result,perl=T)  
  result <- gsub("([0-9])(st)", "\\1$^{st}$", result,perl=T)  
  #The latex variables need {} after them to make spacing appear normal
  #result <- gsub(".tx", ".tx{}", result, fixed = TRUE)
  #result <- gsub(".ref", ".ref{}", result, fixed = TRUE)
  #result <- gsub(".tx{}{}", ".tx{}", result, fixed = TRUE) #error trapping double replacement
  #result <- gsub(".ref{}{}", ".ref{}", result, fixed = TRUE) 
  
  #these are problematic because they are meaningful in common LaTex math scripting 
  #result <- gsub("^", "\\verb|^|", result, fixed = TRUE)
  #result <- gsub("_", "\\_", result, fixed = TRUE)  
  #result <- gsub("{", "\\{", result, fixed = TRUE)
  #result <- gsub("}", "\\}", result, fixed = TRUE)
  #result <- gsub("\\\\", "SANITIZE.BACKSLASH", result)
  #result <- gsub("SANITIZE.BACKSLASH", "$\\backslash$",
  #   result, fixed = TRUE)
  return(result)
}
#%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%#
#%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
#Same as above with a differences accounting for the different way certain items
#are treated in xtable
sanitize.cap <- function(str) { 
  result <- str
  #these just need to be escaped
  result <- gsub("% ", "\\% ", result, fixed = TRUE)
  
  result <- gsub(" \\\\text", " \\text", result, fixed = TRUE)
  #replace XXth, etc with Latex compatible superscripting 
  result <- gsub("([0-9])(th)", "\\1$^{th}$", result,perl=T)  
  result <- gsub("([0-9])(rd)", "\\1$^{rd}$", result,perl=T)  
  result <- gsub("([0-9])(nd)", "\\1$^{nd}$", result,perl=T)  
  result <- gsub("([0-9])(st)", "\\1$^{st}$", result,perl=T)  
  
  return(result)
}
#%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
#Same as above with a differences accounting for the different way certain items
#are treated in xtable
sanitize.Tab.cap <- function(str) { 
  result <- str
  #these just need to be escaped
  result <- gsub("% ", "\\% ", result, fixed = TRUE)
  result <- gsub("\\\\dfrac", "\\dfrac", result, fixed = TRUE)
  result <- gsub("\\\\leq", "\\leq", result, fixed = TRUE)
  result <- gsub("\\\\geq", "\\geq", result, fixed = TRUE)
  result <- gsub(" \\\\text", " \\text", result, fixed = TRUE)
  #replace XXth, etc with Latex compatible superscripting 
  result <- gsub("([0-9])(th)", "\\1$^{th}$", result,perl=T)  
  result <- gsub("([0-9])(rd)", "\\1$^{rd}$", result,perl=T)  
  result <- gsub("([0-9])(nd)", "\\1$^{nd}$", result,perl=T)  
  result <- gsub("([0-9])(st)", "\\1$^{st}$", result,perl=T)  
  
  return(result)
}
#%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
#Same as above with a differences accounting for the different way certain items
#are treated in xtable
sanitize.row <- function(str) { 
  result <- str
  #sanitize if not in eq. mode
  if(is.na(pmatch(" $",result))) result<-sanitize(result)
  return(result)
}
#%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%#
sanitize.Row.Names=function(tabx){
  #Check for "\\\\" in row names and substitute "\\"
  rownames(tabx)=gsub("\\\\","\\",rownames(tabx),fixed=T)
  rownames(tabx)=gsub("\\(","(",rownames(tabx),fixed=T)  
  rownames(tabx)=gsub("\\)",")",rownames(tabx),fixed=T)
  return(rownames(tabx))
}
#%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%#
shorten.catch.names<-function(txt){
  txt <- gsub("[A-Za-z]andings", "land.", txt)
  txt <- gsub("[A-Za-z]iscards", "disc.", txt)
  txt <- gsub("[A-Za-z]ommercial", "Com.", txt)
  txt <- gsub("[A-Za-z]ecreational", "Rec.", txt)  
  return(txt)
}
#%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%#
capitalize.each<-function(x){
  return(gsub("\\b(\\w)", "\\U\\1", x, perl=TRUE))
}
capitalize.first <- function(x) {
  paste(toupper(substring(x, 1,1)), substring(x, 2),
        sep="", collapse=" ")
}
#%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%#
alter.cell <- function(xt, nrow, ncol, change=NULL, col=NULL) {
  # alter.cell - alter the text of a cell of a table for LaTeX output.
  # xt is an xtable object, row and col are the row and column number you want to alter
  # change is the change you want to make: "ital", "bold" or "boldital" (both) are options so far.
  # col is a color e.g. "blue"
  # NOTE: Transparent color doesn't work  
  clr.string <- (col2hex(col))
  clr.string <- substring(clr.string, 2) # Remove the hash prefix.
  if(is.numeric(ncol)) { indx.c<-ncol
  } else if(is.finite(which(colnames(xt) == ncol))) {indx.c <- which(colnames(xt) == ncol)
  } else(return("ERROR unknown column reference in alter.cell"))
  if(is.numeric(nrow)) {indx.r<-nrow
  } else if(is.finite(which(rownames(xt) == nrow))) {indx.r <- which(rownames(xt) == nrow)
  } else(return("ERROR unknown row reference in alter.cell"))  
  # Grab the digits and display values set by xtable
  digt <- attr(xt, 'digits')[indx.c+1]
  disply <- attr(xt, 'display')[indx.c+1]
  
  formatted.vals <- formatC(paste(xt[nrow, ncol]), digits=digt, format=disply)
  if(!is.null(change)){ 
    if(change=="bold") fmt.string <- paste('\\textbf{', formatted.vals, '}', sep='')
    if(change=="ital") fmt.string <- paste('\\textit{', formatted.vals, '}', sep='')  
    if(change=="boldital" | change=="italbold") fmt.string <- paste('\\textit{\\textbf{', formatted.vals, '}}', sep='')  
  } else {fmt.string <- formatted.vals}
  formatted.cell <- paste('\\cellcolor[HTML]{',clr.string, '}',fmt.string, sep='')
  
  attr(xt[,ncol],"levels")[length(levels(xt[,ncol]))+1]<-formatted.cell #need to do this to allow a new value to a cell!
  xt[nrow, ncol] <- formatted.cell
  return(xt)
}
#%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
MakeLetter <- function(a="A", where="topleft", cex=2)
  legend(where, pt.cex=0, bty="n", title=a, cex=cex, legend=NA)
#%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
#check for best placement of legend
check.placement<-function(x){if(which(x==max(x))<(length(x)/2)) return("topright") else return("topleft")}
#%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
#check if a named object exists in dataframe
check.exists<-function(name1,obj){if((name1)%in%obj) return(name1) else return(NULL)}
#%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
#Simple functions to add yes and no to BRP table based on user input
Bst.chk<-function(st){
  if(st=="overfished") {return("Yes")} else if(st=="not overfished") {return("No")} else return("Unknown")    
}
Fst.chk<-function(st){
  if(st=="overfishing is occurring") {return("Yes")} else if(st=="overfishing is not occurring") {return("No")} else return("Unknown")    
}
#%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
convert_call<-function(bgcall,dir1,spp){
  #Convert the big call to something that can be read by LaTex
  bg1 <- gsub("\\\\%", "\\%", bgcall, fixed = TRUE) 
  bg1 <- gsub("\\%", "\\percent{}", bg1, fixed = TRUE)  
  bg1 <- gsub("\\_", "_", bg1, fixed = TRUE)
  bg1 <- gsub("\\$", "$", bg1, fixed = TRUE)
  bg1 <- gsub("\\>", ">", bg1, fixed = TRUE)
  bg1 <- gsub("\\<", "<", bg1, fixed = TRUE)
  bg1 <- gsub("\\|", "|", bg1, fixed = TRUE)
  bg1 <- gsub("\\&", "&", bg1, fixed = TRUE)
  bg1 <- gsub("\\-", "-", bg1, fixed = TRUE)
  bg1 <- gsub("\\[", "[", bg1, fixed = TRUE)
  bg1 <- gsub("\\]", "]", bg1, fixed = TRUE)  
  bg1 <- gsub("\\;", ";", bg1, fixed = TRUE)
  bg1 <- gsub("\\*", "*", bg1, fixed = TRUE)  
  bg1 <- gsub("\\#", "#", bg1, fixed = TRUE)
  bg1 <- gsub("\\(", "(", bg1, fixed = TRUE)
  bg1 <- gsub("\\)", ")", bg1, fixed = TRUE)   
  bg1 <- gsub("\\~", "~{}", bg1, fixed = TRUE)
  bg1 <- gsub("\\/", "/", bg1, fixed = TRUE)
  bg1 <- gsub("\\'", "'", bg1, fixed = TRUE)   
  
  bg1 <- gsub("\\\\", "\\", bg1, fixed = TRUE)
  
  sink(paste(dir1,spp,"Call.tex",sep=""));cat(bg1);sink();    
}
#%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
get.cv.from.ci=function(x,lci=NULL,uci=NULL,bounds=90){
  #Provide point estimate (x) and lower and upper confidence bounds (lci,uci) as well as the % bounding (bounds)
  #used to make lci and uci. Returns an approximate lognormal cv.
  if(is.null(lci) & is.null(uci)) stop("ERROR please provide a confidence interval!")
  p<-(1-(bounds/100))/2
  Z<-qnorm(p)
  if(!is.null(lci) & is.null(uci)) {new.cvl=sqrt(exp((log(lci/x)/Z)^2)-1);return("cv"=new.cvl)}
  if(!is.null(uci) & is.null(lci)) {new.cvu=sqrt(exp((log(lci/x)/-Z)^2)-1);return("cv"=new.cvu)}
  if(!is.null(lci) & !is.null(uci)) {
    #could be some asymmetry to deal with - take a mean
    new.cvl=sqrt(exp((log(lci/x)/Z)^2)-1);new.cvu=sqrt(exp((log(lci/x)/-Z)^2)-1)
    return("cv"=rowSums(data.frame(new.cvl,new.cvu))/2)
  } 
}
#%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


