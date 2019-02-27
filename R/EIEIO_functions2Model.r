FinishAutoAssess2Model<-function(){
  #Load the objects in memory here
  load("AutoAss.RData")
  #%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
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
  if(!"Total"%in%obj) Total<-NULL
  if(!"ModSSB"%in%obj) ModSSB<-NULL
  if(!"FF"%in%obj) FF<-NULL
  if(!"Recruits"%in%obj) Recruits<-NULL 
  if(!"ModSSB2"%in%obj) ModSSB2<-NULL
  if(!"FF2"%in%obj) FF2<-NULL
  if(!"Recruits2"%in%obj) Recruits2<-NULL 
  if(!"OFL1"%in%obj ) OFL1<-NULL
  if(!"OFL1.name"%in%obj) OFL1.name<-NULL #can't have these names if the data doesn't exist!  
  if(!"OFL2"%in%obj ) OFL2<-NULL
  if(!"OFL1.name"%in%obj) OFL2.name<-NULL #can't have these names if the data doesn't exist!
  if(is.null(Recruits1)) BRP.Recruits.name<-NULL
  if(!"SSBthreshold"%in%obj) SSBthreshold<-NULL
  if(!"SSBtarget"%in%obj) SSBtarget<-NULL
  if(!"Fthreshold"%in%obj) Fthreshold<-NULL
  if(!"Ftarget"%in%obj) Ftarget<-NULL
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
  if(!"F.retro.adj1"%in%obj) F.retro.adj1<-NULL
  if(!"B.retro.adj1"%in%obj) B.retro.adj1<-NULL
  if(!"F.retro.adj2"%in%obj) F.retro.adj2<-NULL
  if(!"B.retro.adj2"%in%obj) B.retro.adj2<-NULL
  if(!"report.yr"%in%obj) report.yr<-NULL 
  if(!"ExcludeFromTab1"%in%obj) ExcludeFromTab1<-NULL
  if(!"pdf.name"%in%obj) pdf.name<-paste(gsub(" ", "_",SppName, fixed = TRUE),"_Update_",getTimeFlag(),".pdf",sep="")  
  if(!"ModSSB.CI.VPA1"%in%obj) ModSSB.CI.VPA1<-NULL
  if(!"FF.CI.VPA1"%in%obj) FF.CI.VPA1<-NULL
  if(!"Recruits.CI.VPA1"%in%obj) Recruits.CI.VPA1<-NULL
  if(!"ModSSB.CV1"%in%obj) ModSSB.CV1<-NULL
  if(!"FF.CV1"%in%obj) FF.CV1<-NULL
  if(!"Recruits.CV1"%in%obj) Recruits.CV1<-NULL  
  if(!"ModSSB.CI.VPA2"%in%obj) ModSSB.CI.VPA2<-NULL
  if(!"FF.CI.VPA2"%in%obj) FF.CI.VPA2<-NULL
  if(!"Recruits.CI.VPA2"%in%obj) Recruits.CI.VPA2<-NULL
  if(!"ModSSB.CV2"%in%obj) ModSSB.CV2<-NULL
  if(!"FF.CV2"%in%obj) FF.CV2<-NULL
  if(!"Recruits.CV2"%in%obj) Recruits.CV2<-NULL
  if(!"upload"%in%obj) upload<-F
  if(!"PYear"%in%obj) PYear<-NULL
  if(!"PCatch1"%in%obj) PCatch1<-NULL
  if(!"PCatch2"%in%obj) PCatch2<-NULL  
  if(!"PSSB1"%in%obj) PSSB1<-NULL
  if(!"PSSB2"%in%obj) PSSB2<-NULL  
  if(!"PF1"%in%obj) PF1<-NULL
  if(!"PF2"%in%obj) PF2<-NULL
  if(!"PCatch3"%in%obj) PCatch3<-NULL
  if(!"PSSB3"%in%obj) PSSB3<-NULL
  if(!"PF3"%in%obj) PF3<-NULL
  if(!"POFL1"%in%obj) POFL1<-NULL
  if(!"POFL2"%in%obj) POFL2<-NULL   
  if(!"SSB.old1"%in%obj) SSB.old1<-NULL   
  if(!"SSB.old2"%in%obj) SSB.old2<-NULL
  if(!"F.old1"%in%obj) F.old1<-NULL
  if(!"F.old2"%in%obj) F.old2<-NULL
  if(!"ModSSB.name"%in%obj) ModSSB.name<-NULL
  if(!"FF.name"%in%obj) FF.name<-NULL
  if(!"Recruits.name"%in%obj) Recruits.name<-NULL
  if(!"FMSY.name"%in%obj) FMSY.name<-NULL
  if(!"SSBMSY.name"%in%obj) SSBMSY.name<-NULL
  if(!"MSY.name"%in%obj) MSY.name<-NULL
  if(!"BRP.Recruits.name"%in%obj) BRP.Recruits.name<-NULL
  if(!"F.Status.name"%in%obj) F.Status.name<-NULL
  if(!"B.Status.name"%in%obj) B.Status.name<-NULL
  if(!"ModSSB1"%in%obj) ModSSB1<-NULL
  if(!"ModSSB2"%in%obj) ModSSB2<-NULL
  if(!"P3.name"%in%obj) P3.name<-NULL  
  if(!"P2.name"%in%obj) P2.name<-NULL
  if(!"Recr"%in%obj) Recr<-NULL    
  if(!"Rho.old"%in%obj) Rho.old<-NULL  
  if(!"Rho.now"%in%obj) Rho.now<-NULL  
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
  CatchStatusTab.cap<-sanitize.cap(CatchStatusTab.cap)
  BRPTab.cap<-sanitize.cap(BRPTab.cap)
  ProjTab.cap<-sanitize.cap(ProjTab.cap)
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
  if(Draft==F) {file1<-"~/EIEIO/StockLookUpTable.csv"
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
  SSB1<-as.vector(dt2[dt2[,ModYear]>=(term.yr-step.back) & dt2[,ModYear]<=term.yr,ModSSB1])
  names(SSB1)<-as.character(seq((term.yr-step.back),term.yr))
  #Now get the Full F 
  Ffull1<-as.vector(dt2[dt2[,ModYear]>=(term.yr-step.back) & dt2[,ModYear]<=term.yr,FF1])
  names(Ffull1)<-as.character(seq((term.yr-step.back),term.yr))
  #Now recruits
  recr1<-as.vector(dt2[dt2[,ModYear]>=(term.yr-step.back) & dt2[,ModYear]<=term.yr,Recruits1])
  names(recr1)<-as.character(seq((term.yr-step.back),term.yr))
  
  #Start with the SSB from model_results 
  SSB2<-as.vector(dt2[dt2[,ModYear]>=(term.yr-step.back) & dt2[,ModYear]<=term.yr,ModSSB2])
  names(SSB2)<-as.character(seq((term.yr-step.back),term.yr))
  #Now get the Full F 
  Ffull2<-as.vector(dt2[dt2[,ModYear]>=(term.yr-step.back) & dt2[,ModYear]<=term.yr,FF2])
  names(Ffull2)<-as.character(seq((term.yr-step.back),term.yr))
  #Now recruits
  recr2<-as.vector(dt2[dt2[,ModYear]>=(term.yr-step.back) & dt2[,ModYear]<=term.yr,Recruits2])
  names(recr2)<-as.character(seq((term.yr-step.back),term.yr))
  
  #Now create some blank rows just to add visual cues to the table
  blank<-rep(NA,length(SSB1))
  
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
  if(!is.null(SSB1)) {tab1<-rbind(tab1,SSB1);rownames(tab1)[dim(tab1)[1]]<-ModSSB.name}
  if(!is.null(Ffull1)) {tab1<-rbind(tab1,Ffull1);rownames(tab1)[dim(tab1)[1]]<-FF.name}
  if(!is.null(recr1)) {tab1<-rbind(tab1,recr1);rownames(tab1)[dim(tab1)[1]]<-Recruits.name}
  nrez1<-dim(tab1)[1] #track the number of total inputs to here
  #now from second model
  if(!is.null(SSB2)) {tab1<-rbind(tab1,SSB2);rownames(tab1)[dim(tab1)[1]]<-ModSSB.name}
  if(!is.null(Ffull2)) {tab1<-rbind(tab1,Ffull2);rownames(tab1)[dim(tab1)[1]]<-FF.name}
  if(!is.null(recr2)) {tab1<-rbind(tab1,recr2);rownames(tab1)[dim(tab1)[1]]<-Recruits.name}
  nrez2<-dim(tab1)[1] #track the number of total inputs to here
  
  #xtable does not allow duplicate row names so we need to make the names a column and then not use row names
  tab1<-cbind(rownames(tab1),tab1)
  
  #Produce an xtable
  disp<-c("s", rep("f",dim(tab1)[2]))
  
  #need to alter the digits argument a bit here
  ncols<-dim(tab1)[2]+1
  nrows<-nrez2
  #check units on recruitment before deciding on the digits!
  rnd<-ifelse(min(c(median(recr1),median(recr2)))<100,2,0)
  mdat <- matrix(c(rep(0,ncols*(nfish+1)),rep(2,ncols), rep(rnd,ncols),rep(0,ncols),rep(2,ncols), rep(rnd,ncols))
                   ,nrow = dim(tab1)[1], ncol=ncols, byrow=TRUE)
  digits<-mdat
  pathname=dir.tables
  filename="Catch_Status_Table.csv"
  tab.env="tabular"  
  align=c(rep("l",2),rep("@{\\hspace{.2cm}}r",(dim(tab1)[2]-1)))
  #align=NULL
  hline<-c(-1,(dim(tab1)[1]))
  
  colwidth<-(dim(tab1)[2])
  addtorow <- list()
  addtorow$pos <- list()
  addtorow$pos[[1]] <- 0
  addtorow$command[[1]] <- paste("\\hline \\multicolumn{",colwidth,"}{c}{\\textit{Data}} \\\\ "
      ,sep="")
  addtorow$pos[[2]] <- nfish #number of catch lines
  addtorow$command[[2]] <- paste("\\multicolumn{",colwidth,"}{c}{\\textit{Model Results (",Mod1.name,")}} \\\\ "
      ,sep="")
  addtorow$pos[[3]] <- nrez1 #number of catch lines+model results from model 1
  addtorow$command[[3]] <- paste("\\multicolumn{",colwidth,"}{c}{\\textit{Model Results (",Mod2.name,")}} \\\\ "
                                 ,sep="")
  
  colnames(tab1)[1]<-" " #trying to get a blank variable name here
  #Suppress warning here about duplicated row names - that is what we are trying to do!
  
  lab1<-substr(filename,1,(nchar(filename)-4))
  if(Draft==F) {lab1<-paste(gsub("_", "", pref, fixed = TRUE),lab1,sep="")}   
  
  xtab1<-suppressWarnings(xtable(x=tab1,caption=CatchStatusTab.cap,display=disp,align=align,digits=digits
          ,label=lab1))
  
  print(xtable(xtab1),sanitize.text.function=function(x){x})
  
  print.xtable(x=xtab1
      ,file=paste(pathname,substr(filename,1,(nchar(filename)-3)),"tex",sep="") 
      ,caption.placement="top"
      ,tabular.environment=tab.env
      ,floating=T    
      ,table.placement="H" 
      ,floating.environment="table"
      ,include.rownames=F
      ,hline.after=hline
      ,sanitize.text.function=function(x){x}
      ,add.to.row=addtorow
  )
  print("___________Table 1 completed____________")  
  #%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  # We need to make the Table of reference points next
  tab2<-c()
  rnd<-ifelse(median(dt2[,Recruits1])<100,2,0) #check the units on recruitment before rounding
  c(NA,NA,prettyNum(round(dt2[which(dt2[,1]==last.assessment),Recruits1],rnd),big.mark=",",scientific=F)
  ,prettyNum(round(median(dt2[,Recruits2]),rnd),big.mark=",",scientific=F))
  rec.vec<-c()
  if(is.null(Recruits.old1)) rec.vec[1]<-"" else {
  rec.vec[1]<-prettyNum(round(median(dt2[!is.na(dt2[,Recruits.old1]),Recruits.old1]),rnd),big.mark=",",scientific=F)}
  if(is.null(Recruits.old2)) rec.vec[2]<-"" else {
  rec.vec[2]<-prettyNum(round(median(dt2[!is.na(dt2[,Recruits.old2]),Recruits.old2]),rnd),big.mark=",",scientific=F)}
  if(is.null(Recruits1)) rec.vec[3]<-"" else {
  rec.vec[3]<-prettyNum(round(median(dt2[!is.na(dt2[,Recruits1]),Recruits1]),rnd),big.mark=",",scientific=F)}
  if(is.null(Recruits.old2)) rec.vec[4]<-"" else {
  rec.vec[4]<-prettyNum(round(median(dt2[!is.na(dt2[,Recruits2]),Recruits2]),rnd),big.mark=",",scientific=F)}
  
  if(sum(!is.na(rec.vec))==0) rec.vec<-NULL
  
    #Added functionality for Brian who needs a different type of recruitment calculation
  if(!is.null(Recr)) rec.vec<-Recr
  
  #Add status row  
  #first check on the existence of reference points
  if(!"Fstatus_old"%in%obj | is.null(Fstatus_old)) Fstatus_old<-""
  if(!"Fstatus"%in%obj | is.null(Fstatus)) Fstatus<-""
  if(!"Fstatus_old2"%in%obj | is.null(Fstatus_old2)) Fstatus_old2<-""
  if(!"Fstatus2"%in%obj | is.null(Fstatus2)) Fstatus2<-""  
  FStatus<-c(Fst.chk(Fstatus_old),Fst.chk(Fstatus_old2),Fst.chk(Fstatus),Fst.chk(Fstatus2))
  if(!"Bstatus_old"%in%obj | is.null(Bstatus_old)) Bstatus_old<-""
  if(!"Bstatus"%in%obj | is.null(Bstatus) ) Bstatus<-""
  if(!"Bstatus_old2"%in%obj | is.null(Bstatus_old2)) Bstatus_old2<-""
  if(!"Bstatus2"%in%obj | is.null(Bstatus2) ) Bstatus2<-""  
  BStatus<-c(Bst.chk(Bstatus_old),Bst.chk(Bstatus_old2),Bst.chk(Bstatus),Bst.chk(Bstatus2))
  #tab2<-rbind(FMSY,SSBMSY,MSY,OFL,rec.vec,FStatus,BStatus)
  #dimnames(tab2)[[1]]<-sanitize.cap(c(FMSY.name,SSBMSY.name,MSY.name,OFL.name,BRP.Recruits.name
  #        ,F.Status.name,B.Status.name))
  #without the OFL
  tab2<-rbind(FMSY,SSBMSY,MSY,rec.vec,FStatus,BStatus)
  dimnames(tab2)[[1]]<-sanitize.cap(c(FMSY.name,SSBMSY.name,MSY.name,BRP.Recruits.name
          ,F.Status.name,B.Status.name))
  
  colnames(tab2)<-c(paste(last.assessment,c(Mod1.name,Mod2.name)),Mod1.name,Mod2.name)
  
  
  disp<-c("s", rep("s",dim(tab2)[2]))
  pathname=dir.tables
  filename="BRP_Table.csv"
  #tab.env="longtable"
  #tab.env="{tabularx}{\\textwidth}"
  tab.env="tabularx"
  align=c("l",rep("X",dim(tab2)[2])) #tabularx alignment
  #align=c("l",rep("@{\\hspace{.2cm}}r",(dim(tab2)[2])))  #longtable alignment for 4 cols
  #align=c(rep("l",2),rep("@{\\hspace{.2cm}}r",(dim(tab1)[2]-1))) #longtable alignment for 3 cols
  hline<-c(-1,0,(dim(tab2)[1]))
  
  lab1<-substr(filename,1,(nchar(filename)-4))
  if(Draft==F) {lab1<-paste(gsub("_", "", pref, fixed = TRUE),lab1,sep="")}   
  
  xtab2<-suppressWarnings(xtable(x=tab2,caption=BRPTab.cap,display=disp,align=align
          ,label=lab1))
  
  #need to highlight a column...
  xtab2 <- color.column(xt=xtab2, column=paste(last.assessment,Mod1.name), col="gray80")
  xtab2 <- color.column(xt=xtab2, column=paste(last.assessment,Mod2.name), col="gray80")
  
  #Here is an example of how to alter just one cell:
  #xtab2 <- alter.cell(xt=xtab2,ncol=2,nrow=2,change="bold",col="lightblue") #
  
  #print(xtable(xtab2),tabular.environment=tab.env, width="\\textwidth"
  #      ,sanitize.text.function=function(x){x})
  
  #Contortions to make the caption be on top and the table fit the text!
  write("\\begin{table}[H]",paste(pathname,substr(filename,1,(nchar(filename)-3)),"tex",sep="") )  
  write(paste("\\caption{",BRPTab.cap,"}",sep=""),paste(pathname,substr(filename,1,(nchar(filename)-3))
        ,"tex",sep=""),append=T)
  
  print.xtable(x=xtab2
      ,file=paste(pathname,substr(filename,1,(nchar(filename)-3)),"tex",sep="") 
      ,caption.placement="top"
      ,tabular.environment=tab.env
      ,latex.environment="table"         
      ,floating=F 
      ,size="\\small" 
      #,scalebox=0.75         
      ,width="\\textwidth"
      #,table.placement="H"              
      ,include.rownames=T
      ,hline.after=hline
      ,sanitize.text.function=function(x){x}
      ,append=T
      #,add.to.row=addtorow
  )
  write("\\end{table}",paste(pathname,substr(filename,1,(nchar(filename)-3)),"tex",sep=""),append=T) 
  print("___________Table 2 completed____________")  
  #%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  #Projection Table
  if(!is.null(PCatch3)) {
    tab3<-data.frame(PYear,PCatch1,PSSB1,PF1,PCatch2,PSSB2,PF2,PCatch3,PSSB3,PF3)      #,OFL1,OFL2
    rep1<-3
  } else  {tab3<-data.frame(PYear,PCatch1,PSSB1,PF1,PCatch2,PSSB2,PF2); rep1<-2;} 

  colnames(tab3)<-c("Year",rep(c(paste("Catch",CatchUnits),paste("SSB",SSBUnits),FF.name),rep1)) #,OFL.name
  
  #Add a blank row and relabel the columns 
    blankLine=rep(NA,dim(tab3)[2])
    tab3=rbind(tab3,blankLine,blankLine) #make an extra 2 rows
    tab3[4:dim(tab3)[1],]=tab3[2:(dim(tab3)[1]-2),] #shift everything down by 2 rows
    tab3[2,]=blankLine
    newColNm=colnames(tab3)
    tab3[3,]=newColNm  
  
  
  #just use literal values here
  #disp<-c("s", rep("s",dim(tab3)[2]))
  disp<-c("s","d", rep("s",dim(tab3)[2]-1))
  pathname=dir.tables
  filename="Proj_Table.csv"
  tab.env="tabular"
  if(!is.null(PCatch3)) { 
    align=c("l",rep("@{\\hspace{.2cm}}c",(dim(tab3)[2])))
  } else align=c("l",rep("c",(dim(tab3)[2])))
  hline<-c(-1,2,(dim(tab3)[1]))
  
  #need to alter the digits argument a bit here
  nrows<-dim(tab3)[1]
  #rnd<-ifelse(min(c(PF1,PF2))<0.001,3,2)
  #digits<- c(0,0,0,0,rnd,0,0,rnd)
  
  addtorow <- list()
  addtorow$pos <- list()
  addtorow$pos[[1]] <- 0;addtorow$pos[[2]] <- 3
  if(is.null(P3.name)){
    addtorow$command[[1]] <- paste("\\hline & \\multicolumn{3}{c}{\\textit{"
      ,Mod1.name,"}} & \\multicolumn{3}{c}{\\textit{",Mod2.name,"}} \\\\ ",sep="")
     addtorow$command[[2]]=addtorow$command[[1]]
  } else{
  addtorow$command[[1]] <- paste("\\hline & \\multicolumn{3}{c}{\\textit{"
      ,Mod1.name,"}} & \\multicolumn{3}{c}{\\textit{",P2.name
      ,"}} & \\multicolumn{3}{c}{\\textit{",P3.name,"}} \\\\ ",sep="") 
     addtorow$command[[2]]=addtorow$command[[1]]   
  }
  
  lab1<-substr(filename,1,(nchar(filename)-4))
  if(Draft==F) {lab1<-paste(gsub("_", "", pref, fixed = TRUE),lab1,sep="")}   
  
  xtab3<-c()
  xtab3<-xtable(x=tab3,caption=ProjTab.cap,display=disp,align=align  #,digits=digits
          ,label=lab1)
  
  print(xtable(xtab3),sanitize.text.function=function(x){x})
  
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
      ,add.to.row=addtorow
  ))
  print("___________Table 3 completed____________")  
  #%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  # First plot will be the stacked bar plot
  #plot.new() #set up a plotting window
  filename<-paste(dir.figures,"FisheryPlot1",sep="")
  png(filename=paste(filename,"png",sep="."),width=900,height=600, type="cairo")
  par(mar=c(4,5,4,2)+0.1,cex.axis=1.5,cex.lab=2,cex.main=2)
  
  #list the fishery data names and preferred table names
  fish.names<-c(Fleet1.name,Fleet2.name,Fleet3.name,Fleet4.name,Fleet5.name
                ,Fleet6.name,Fleet7.name,Fleet8.name) 
  fish.data.names<-c(Fleet1,Fleet2,Fleet3,Fleet4,Fleet5,Fleet6,Fleet7,Fleet8) 
   
  x<-na.replace(as.matrix(t(dt1[dt1[,CYear]<=term.yr,fish.data.names])))
  names1<-paste(dt1[dt1[,CYear]<=term.yr,CYear])
  dimnames(x)[[2]]<-names1
  #match the existing names to ones we have on record above
  dimnames(x)[[1]]<-fish.names[which(fish.data.names%in%dimnames(x)[[1]])]
  
  ylim1<-c(0,max(pretty(1.1*as.numeric(na.omit(dt1[,Total])))))
  
  #col1<-grey.colors(dim(x)[1])
  col1<-rainbow(dim(x)[1])
  #col1<-terrain.colors(dim(x)[1])
  #col1<-topo.colors(dim(x)[1])
  
  barplot(x
    ,ylim=ylim1
    ,border=NA
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
    ,horiz=F
    ,ncol=ncol
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
  par(mar=c(4,5,4,2)+0.1,cex.axis=1.5,cex.lab=2,cex.main=2)
  l.out<-matrix(c(1:2),2,1, byrow=T)
  layout(l.out) #layout a top and bottom arrangement for two models
  
  Ass_Model_Result_Plot(years=dt2[,ModYear]
                        ,ts=dt2[,ModSSB1]
                        #  ,cv=abs(0.2+rnorm(n=dim(dt2)[1],sd=0.05)) #fake confidence intervals!!
                        ,cv=check.names(dt2,ModSSB.CV1)
                        ,ci.method=ci.method 
                        ,ts.old=check.names(dt2,SSB.old1)
                        ,target=SSBtarget1 
                        ,threshold=SSBthreshold1
                        ,bounds=bounds
                        ,ts.name="SSB"
                        ,x.name="Year"
                        ,retro.adj=B.retro.adj1
                        ,VPA.CI=ModSSB.CI.VPA1
  )
  MakeLetter("A",check.placement(dt2[,ModSSB1]))
  
  Ass_Model_Result_Plot(years=dt2[,ModYear]
                        ,ts=dt2[,ModSSB2]
                        #  ,cv=abs(0.2+rnorm(n=dim(dt2)[1],sd=0.05)) #fake confidence intervals!!
                        ,cv=check.names(dt2,ModSSB.CV2)
                        ,ci.method=ci.method 
                        ,ts.old=check.names(dt2,SSB.old2)
                        ,target=SSBtarget2 
                        ,threshold=SSBthreshold2
                        ,bounds=bounds
                        ,ts.name="SSB"
                        ,x.name="Year"
                        ,retro.adj=B.retro.adj2
                        ,VPA.CI=ModSSB.CI.VPA2
  )
  MakeLetter("B",check.placement(dt2[,ModSSB2]))
  
  dev.off()
  print("___________SSB plot completed____________")  
  #_____________________________________________________________________________________________
  #F plot
  filename<-paste(dir.figures,"F_plot1",sep="")
  png(filename=paste(filename,"png",sep="."),width=800,height=1000, type="cairo")
  par(mar=c(4,5,4,2)+0.1,cex.axis=1.5,cex.lab=2,cex.main=2)
  l.out<-matrix(c(1:2),2,1, byrow=T)
  layout(l.out) #layout a top and bottom arrangement for two models
  
  Ass_Model_Result_Plot(years=dt2[,ModYear]
                        ,ts=dt2[,FF1]
                        #  ,cv=abs(0.2+rnorm(n=dim(dt2)[1],sd=0.05)) #fake confidence intervals!!
                        ,cv=check.names(dt2,FF.CV1)
                        ,ci.method=ci.method
                        ,ts.old=check.names(dt2,F.old1)
                        ,target=Ftarget1 
                        ,threshold=Fthreshold1
                        ,bounds=bounds
                        ,ts.name="F"
                        ,x.name="Year"
                        ,retro.adj=F.retro.adj1
                        ,VPA.CI=FF.CI.VPA1
  )
  MakeLetter("A",check.placement(dt2[,FF1]))
  
  
  Ass_Model_Result_Plot(years=dt2[,ModYear]
                        ,ts=dt2[,FF2]
                        #  ,cv=abs(0.2+rnorm(n=dim(dt2)[1],sd=0.05)) #fake confidence intervals!!
                        ,cv=check.names(dt2,FF.CV2)
                        ,ci.method=ci.method
                        ,ts.old=check.names(dt2,F.old2)
                        ,target=Ftarget2 
                        ,threshold=Fthreshold2
                        ,bounds=bounds
                        ,ts.name="F"
                        ,x.name="Year"
                        ,retro.adj=F.retro.adj2
                        ,VPA.CI=FF.CI.VPA2
  )
  MakeLetter("B",check.placement(dt2[,FF2]))
  
  dev.off()
  print("___________F plot completed____________")  
  #_____________________________________________________________________________________________
  #Recruitment plot
  filename<-paste(dir.figures,"Recruit_plot1",sep="")
  png(filename=paste(filename,"png",sep="."),width=800,height=1000, type="cairo")
  par(mar=c(4,5,4,2)+0.1,cex.axis=1.5,cex.lab=2,cex.main=2)
  l.out<-matrix(c(1:2),2,1, byrow=T)
  layout(l.out) #layout a top and bottom arrangement for two models
  
  Ass_Model_Result_Plot(years=dt2[,ModYear]
                        ,ts=dt2[,Recruits1]
                        #  ,cv=abs(0.3+rnorm(n=dim(dt2)[1],sd=0.05)) #fake confidence intervals!!
                        ,cv=check.names(dt2,Recruits.CV1)
                        ,ci.method=ci.method
                        ,ts.old=check.names(dt2,Recruits.old1)
                        ,target=NULL #these are made up too
                        ,threshold=NULL
                        ,bounds=bounds
                        ,ts.name="Recruits"
                        ,x.name="Year"
                        ,VPA.CI=Recruits.CI.VPA1
  )
  MakeLetter("A",check.placement(dt2[,Recruits1]))
  
  
  Ass_Model_Result_Plot(years=dt2[,ModYear]
                        ,ts=dt2[,Recruits2]
                        #  ,cv=abs(0.3+rnorm(n=dim(dt2)[1],sd=0.05)) #fake confidence intervals!!
                        ,cv=check.names(dt2,Recruits.CV2)
                        ,ci.method=ci.method
                        ,ts.old=check.names(dt2,Recruits.old2)
                        ,target=NULL #these are made up too
                        ,threshold=NULL
                        ,bounds=bounds
                        ,ts.name="Recruits"
                        ,x.name="Year"
                        ,VPA.CI=Recruits.CI.VPA2
  )
  MakeLetter("B",check.placement(dt2[,Recruits2]))
  
  dev.off()
  print("___________Recruit plot completed____________")  
  #%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  #Call the latex file with dynamically defined variables
  
  call1<-paste(
    "\\\\def\\\\MyPathTab{",substr(dir.tables,1,(nchar(dir.tables)-1)),"}"
    ,"\\\\def\\\\MyPathFig{",substr(dir.figures,1,(nchar(dir.figures)-1)),"}"
    ,"\\\\def\\\\figFishCap{",figFish.cap,"}"
    ,"\\\\def\\\\figSSBCap{",figSSB.cap,"}"
    ,"\\\\def\\\\figFCap{",figF.cap,"}"  
    ,"\\\\def\\\\figRecrCap{",figRecr.cap,"}"
    ,"\\\\def\\\\figSurvCap{",figSurv.cap,"}"
    ,"\\\\def\\\\PreAmb{",Preamble,"}"
    ,"\\\\def\\\\SoS{",StateOfStock,"}"
    ,"\\\\def\\\\Proj{",Project,"}"
    ,"\\\\def\\\\SpecCmt{",SpecialComments,"}"
    ,"\\\\def\\\\Refr{",References,"}"
    ,"\\\\def\\\\Draft{",doc_status,"}"
    ,"\\\\def\\\\SPPname{",SppName,"}"
    ,"\\\\def\\\\SPPnameT{",SppNameTitle,"}" 
    ,"\\\\def\\\\RptYr{",report.yr,"}" 
    ," \\def\\Stretch{",Stretch,"}"
    ,"\\def\\ReportType{",ReportType,"}"     
    ,sep="")

  convert_call(bgcall=call1,dir1=dir.latex,spp="Big")
  #Now compile the latex
  call2<-paste("cd '",dir.latex, "';"," ls -l;"," pdflatex -halt-on-error MakeUpdate2.tex;",sep="")
  system(call2);system(call2); #run twice to make sure that the labeling dependencies are set!
  #Copy up one directory with the time stamp.
  system(paste("cd ",dir.latex,"../; cp ",dir.latex,"MakeUpdate2.pdf ./",pdf.name,sep=""))
    
  
  #%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  if(Draft==F){
    #We are going to need to get a prefix for all these variables that need to be passed to the larger doc
    #start with a lookup function - can also hold the path to the reviewer comments for each stock and the 
    #correct authorship, etc...
    
    file1<-"~/EIEIO/StockLookUpTable.csv"
    inp<-read.csv(file1)
    pref<-inp[inp$Stock==SppName,"Prefix"]
    auth<-inp[inp$Stock==SppName,"Analyst"]
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

#%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
PullTextValues2Mod<-function(){
  #This function just uses the data inputs to generate some variables useful for text strings in the report
  #Load the objects in memory here
  load("TextVals.RData")
  if(!"Rho.adj1"%in%objects()) Rho.adj1<-F
  if( is.null(Rho.adj1) | Rho.adj1==F) { #if retro adj. is uses for status then...
    term.SSB1<-prettyNum(dt2[dt2[,ModYear]==term.yr,ModSSB1],big.mark=",",scientific=F)   #terminal year biomass
    perc.SSBMSY1<-round((dt2[dt2[,ModYear]==term.yr,ModSSB1]/SSBMSYpt.est1)*100)           #calculate % SSBMSY
    term.F1<-dt2[dt2[,ModYear]==term.yr,FF1]                                              #terminal year F
    perc.FMSY1<-round((dt2[dt2[,ModYear]==term.yr,FF1]/FMSYpt.est1)*100)                   #% FMSY
  } else {
    term.SSB1<-prettyNum(B.retro.adj1,big.mark=",",scientific=F)   #terminal year biomass using retro adj.
    perc.SSBMSY1<-round((B.retro.adj1/SSBMSYpt.est1)*100)           #calculate % SSBMSY using retro adj.
    term.F1<-prettyNum(F.retro.adj1,big.mark=",",scientific=F)   #terminal year biomass using retro adj.
    perc.FMSY1<-round((F.retro.adj1/FMSYpt.est1)*100)           #calculate % SSBMSY using retro adj. 
  }  
  #Values from second model
  if(!"Rho.adj2"%in%objects() | is.null(Rho.adj2) | Rho.adj2==F) { #if retro adj. is uses for status then...
    term.SSB2<-prettyNum(dt2[dt2[,ModYear]==term.yr,ModSSB2],big.mark=",",scientific=F)   #terminal year biomass
    perc.SSBMSY2<-round((dt2[dt2[,ModYear]==term.yr,ModSSB2]/SSBMSYpt.est2)*100)           #calculate % SSBMSY
    term.F2<-dt2[dt2[,ModYear]==term.yr,FF2]                                              #terminal year F
    perc.FMSY2<-round((dt2[dt2[,ModYear]==term.yr,FF2]/FMSYpt.est2)*100)                   #% FMSY
  } else {
    term.SSB2<-prettyNum(B.retro.adj2,big.mark=",",scientific=F)   #terminal year biomass using retro adj.
    perc.SSBMSY2<-round((B.retro.adj2/SSBMSYpt.est2)*100)           #calculate % SSBMSY using retro adj.
    term.F2<-prettyNum(F.retro.adj2,big.mark=",",scientific=F)   #terminal year biomass using retro adj.
    perc.FMSY2<-round((F.retro.adj2/FMSYpt.est1)*100)           #calculate % SSBMSY using retro adj. 
  }  

  val.SSBMSY2<-prettyNum(SSBMSYpt.est2,big.mark=",",scientific=F)                       #SSBMSY   
  val.SSBMSY1<-prettyNum(SSBMSYpt.est1,big.mark=",",scientific=F)                       #SSBMSY 
  first.mod.yr<-min(dt2[is.finite(dt2[,ModSSB1]),ModYear])                             #first model year
  #assign these globally so they can be used in the rest of the r script
  assign("term.SSB1",term.SSB1, envir = .GlobalEnv)
  assign("perc.SSBMSY1",perc.SSBMSY1, envir = .GlobalEnv)
  assign("term.F1",term.F1, envir = .GlobalEnv)
  assign("perc.FMSY1",perc.FMSY1, envir = .GlobalEnv)
  assign("val.SSBMSY1",val.SSBMSY1, envir = .GlobalEnv)

  assign("term.SSB2",term.SSB2, envir = .GlobalEnv)
  assign("perc.SSBMSY2",perc.SSBMSY2, envir = .GlobalEnv)
  assign("term.F2",term.F2, envir = .GlobalEnv)
  assign("perc.FMSY2",perc.FMSY2, envir = .GlobalEnv)
  assign("val.SSBMSY2",val.SSBMSY2, envir = .GlobalEnv)
  
  assign("first.mod.yr",first.mod.yr, envir = .GlobalEnv)
  
} 
#%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

#%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

PullCI_2mod<-function(){
 #This is a way to get the CI for text reporting - and making a big table later 
  load("CIVals.RData")
  obj<-objects()
  if(!"ModSSB1"%in%obj) ModSSB1<-NULL
  if(!"ModSSB.CV1"%in%obj) ModSSB.CV1<-NULL  
  if(!"FF1"%in%obj) FF1<-NULL
  if(!"FF.CV1"%in%obj) FF.CV1<-NULL  
  if(!"SSBthreshold1"%in%obj) SSBthreshold1<-NULL
  if(!"SSBtarget1"%in%obj) SSBtarget1<-NULL
  if(!"Fthreshold1"%in%obj) Fthreshold1<-NULL
  if(!"Ftarget1"%in%obj) Ftarget1<-NULL
  if(!"F.retro.adj1"%in%obj) F.retro.adj1<-NULL
  if(!"B.retro.adj1"%in%obj) B.retro.adj1<-NULL
  if(!"ModSSB.CI.VPA1"%in%obj) ModSSB.CI.VPA1<-NULL
  if(!"FF.CI.VPA1"%in%obj) FF.CI.VPA1<-NULL
  if(!"Recruits.CI.VPA1"%in%obj) Recruits.CI.VPA1<-NULL
  if(!"ModSSB.CV1"%in%obj) ModSSB.CV1<-NULL
  if(!"FF.CV1"%in%obj) FF.CV1<-NULL
  if(!"SSB.old1"%in%obj) SSB.old1<-NULL
  if(!"F.old1"%in%obj) F.old1<-NULL
  if(!"ModSSB.name1"%in%obj) ModSSB.name1<-NULL
  if(!"FF.name1"%in%obj) FF.name1<-NULL
  if(!"FMSY.name1"%in%obj) FMSY.name1<-NULL
  if(!"SSBMSY.name1"%in%obj) SSBMSY.name1<-NULL
  if(!"MSY.name1"%in%obj) MSY.name1<-NULL
  if(!"F.Status.name1"%in%obj) F.Status.name1<-NULL
  if(!"B.Status.name1"%in%obj) B.Status.name1<-NULL
  if(!"ModSSB1"%in%obj) ModSSB1<-NULL
  
  if(!"ModSSB2"%in%obj) ModSSB2<-NULL
  if(!"ModSSB.CV2"%in%obj) ModSSB.CV2<-NULL  
  if(!"FF2"%in%obj) FF2<-NULL
  if(!"FF.CV2"%in%obj) FF.CV2<-NULL  
  if(!"SSBthreshold2"%in%obj) SSBthreshold2<-NULL
  if(!"SSBtarget2"%in%obj) SSBtarget2<-NULL
  if(!"Fthreshold2"%in%obj) Fthreshold2<-NULL
  if(!"Ftarget2"%in%obj) Ftarget2<-NULL
  if(!"F.retro.adj2"%in%obj) F.retro.adj2<-NULL
  if(!"B.retro.adj2"%in%obj) B.retro.adj2<-NULL
  if(!"ModSSB.CI.VPA2"%in%obj) ModSSB.CI.VPA2<-NULL
  if(!"FF.CI.VPA2"%in%obj) FF.CI.VPA2<-NULL
  if(!"Recruits.CI.VPA2"%in%obj) Recruits.CI.VPA2<-NULL
  if(!"ModSSB.CV2"%in%obj) ModSSB.CV2<-NULL
  if(!"FF.CV2"%in%obj) FF.CV2<-NULL
  if(!"SSB.old2"%in%obj) SSB.old2<-NULL
  if(!"F.old2"%in%obj) F.old2<-NULL
  if(!"ModSSB.name2"%in%obj) ModSSB.name2<-NULL
  if(!"FF.name2"%in%obj) FF.name2<-NULL
  if(!"FMSY.name2"%in%obj) FMSY.name2<-NULL
  if(!"SSBMSY.name2"%in%obj) SSBMSY.name2<-NULL
  if(!"MSY.name2"%in%obj) MSY.name2<-NULL
  if(!"F.Status.name2"%in%obj) F.Status.name2<-NULL
  if(!"B.Status.name2"%in%obj) B.Status.name2<-NULL
  if(!"ModSSB2"%in%obj) ModSSB2<-NULL
  #I'm using the plot function to pull the CI's - which is huge pain because of all the different methods available
  tmp<-Ass_Model_Result_Plot(years=dt2[,ModYear]
                        ,ts=dt2[,ModSSB1]
                        #  ,cv=abs(0.2+rnorm(n=dim(dt2)[1],sd=0.05)) #fake confidence intervals!!
                        ,cv=check.names(dt2,ModSSB.CV1)
                        ,ci.method=ci.method 
                        ,ts.old=check.names(dt2,SSB.old1)
                        ,target=SSBtarget1 
                        ,threshold=SSBthreshold1
                        ,bounds=bounds
                        ,ts.name="Biomass"
                        ,x.name="Year"
                        ,retro.adj=B.retro.adj1
                        ,VPA.CI=ModSSB.CI.VPA1
                        ,just.ci=T
                        ,plot=F
  )
  CLL1<-tmp[1];CLU1<-tmp[2];
  #Now assign these globally
 # print(CLL1)
  assign("BCLL1",round(CLL1), envir = .GlobalEnv)
  assign("BCLU1",round(CLU1), envir = .GlobalEnv)
 
  tmp<-Ass_Model_Result_Plot(years=dt2[,ModYear]
                        ,ts=dt2[,FF1]
                        #  ,cv=abs(0.2+rnorm(n=dim(dt2)[1],sd=0.05)) #fake confidence intervals!!
                        ,cv=check.names(dt2,FF.CV1)
                        ,ci.method=ci.method
                        ,ts.old=check.names(dt2,F.old1)
                        ,target=Ftarget1 
                        ,threshold=Fthreshold1
                        ,bounds=bounds
                        ,ts.name="Exploitation rate"
                        ,x.name="Year"
                        ,retro.adj=F.retro.adj1
                        ,VPA.CI=FF.CI.VPA1
                        ,just.ci=T
                        ,plot=F
  )
  CLL1<-tmp[1];CLU1<-tmp[2];
  #Now assign these globally
  assign("FCLL1",round(CLL1,3), envir = .GlobalEnv)
  assign("FCLU1",round(CLU1,3), envir = .GlobalEnv)
  
  tmp<-Ass_Model_Result_Plot(years=dt2[,ModYear]
                        ,ts=dt2[,ModSSB2]
                        #  ,cv=abs(0.2+rnorm(n=dim(dt2)[1],sd=0.05)) #fake confidence intervals!!
                        ,cv=check.names(dt2,ModSSB.CV2)
                        ,ci.method=ci.method 
                        ,ts.old=check.names(dt2,SSB.old2)
                        ,target=SSBtarget2 
                        ,threshold=SSBthreshold2
                        ,bounds=bounds
                        ,ts.name="Biomass"
                        ,x.name="Year"
                        ,retro.adj=B.retro.adj2
                        ,VPA.CI=ModSSB.CI.VPA2
                        ,just.ci=T
                        ,plot=F
  )
  CLL2<-tmp[1];CLU2<-tmp[2];
  #Now assign these globally
  assign("BCLL2",round(CLL2), envir = .GlobalEnv)
  assign("BCLU2",round(CLU2), envir = .GlobalEnv)
 
  tmp<-Ass_Model_Result_Plot(years=dt2[,ModYear]
                        ,ts=dt2[,FF2]
                        #  ,cv=abs(0.2+rnorm(n=dim(dt2)[1],sd=0.05)) #fake confidence intervals!!
                        ,cv=check.names(dt2,FF.CV2)
                        ,ci.method=ci.method
                        ,ts.old=check.names(dt2,F.old2)
                        ,target=Ftarget2 
                        ,threshold=Fthreshold2
                        ,bounds=bounds
                        ,ts.name="Exploitation rate"
                        ,x.name="Year"
                        ,retro.adj=F.retro.adj2
                        ,VPA.CI=FF.CI.VPA2
                        ,just.ci=T
                        ,plot=F
  )
  CLL2<-tmp[1];CLU2<-tmp[2];
  #Now assign these globally
  assign("FCLL2",round(CLL2,3), envir = .GlobalEnv)
  assign("FCLU2",round(CLU2,3), envir = .GlobalEnv)
  
}
#%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%




