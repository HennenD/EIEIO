#%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
#                 Change these to match your directories/species
dir.source.Cmaps="/net/home12/ctholke/GF_update/commercial/HALIBUT_ATLANTIC/" #where do you get the maps?
dir.source.Smaps="/net/home12/ctholke/GF_update/survey/HALIBUT_ATLANTIC/"
dir.upload<-"/net/home2/dhennen/Halibut/Uploads/" #where do you want the newly made pdfs to go?
onePDF=F #do you want one big pdf (T) or many single pdfs (F)
#%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
# Now just hit source and you'll find .pdfs of all Chris' maps in dir.upload - ready for inclusion into SASINF




# ******************************************************************************
#         No need to change anything below here !                              %
#%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
cmd1<-paste("cd ",dir.upload,"; mkdir -p Rcode; mkdir -p data; mkdir -p figures;"   
            ," mkdir -p latex; mkdir -p tables;"                                  
            ,sep=""                                                                                        
)                                                                               
system(cmd1)
#%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
#Same as above with a differences accounting for the different way certain items
#are treated in xtable
sanitize.cap <- function(str) { 
  result <- str
  #these just need to be escaped
  result <- gsub("% ", "\\% ", result, fixed = TRUE)
  result <- gsub("\\\\", "\\", result, fixed = TRUE)
  
  #replace XXth, etc with Latex compatible superscripting 
  result <- gsub("([0-9])(th)", "\\1$^{th}$", result,perl=T)  
  result <- gsub("([0-9])(rd)", "\\1$^{rd}$", result,perl=T)  
  result <- gsub("([0-9])(nd)", "\\1$^{nd}$", result,perl=T)  
  result <- gsub("([0-9])(st)", "\\1$^{st}$", result,perl=T)  
  
  return(result)
}
#%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
#%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
renderPlot.tex<-function(filename,texname,dir.upload){
 #Make a standalone latex file and compile it, naming it texname and putting it in upload 
 texname2<-paste(dir.upload,"latex/",filename,sep="")
 write.table("\\documentclass[]{report}",file=texname2,quote=F,sep="",row.names=F,col.names=F)
 write.table("\\usepackage[pdftex]{graphicx}",file=texname2,append=T,quote=F,sep="",row.names=F,col.names=F)
 write.table("\\usepackage{multicol}",file=texname2,append=T,quote=F,sep="",row.names=F,col.names=F)
 write.table("\\usepackage{setspace}",file=texname2,append=T,quote=F,sep="",row.names=F,col.names=F)  
 write.table("\\usepackage{longtable}",file=texname2,append=T,quote=F,sep="",row.names=F,col.names=F)  
 write.table("\\usepackage{pdflscape}",file=texname2,append=T,quote=F,sep="",row.names=F,col.names=F)  
 write.table("\\usepackage[width=\\textwidth]{caption}",file=texname2,append=T,quote=F,sep="",row.names=F,col.names=F)  
 write.table("\\usepackage{tabularx}",file=texname2,append=T,quote=F,sep="",row.names=F,col.names=F)    
 write.table("\\usepackage{amsmath}",file=texname2,append=T,quote=F,sep="",row.names=F,col.names=F)  
 write.table("\\usepackage{rotating}",file=texname2,append=T,quote=F,sep="",row.names=F,col.names=F)  
 write.table("\\usepackage[table]{xcolor}",file=texname2,append=T,quote=F,sep="",row.names=F,col.names=F)
 write.table("\\usepackage[showframe=false]{geometry}",file=texname2,append=T,quote=F,sep="",row.names=F,col.names=F)
 write.table("\\usepackage{float}",file=texname2,append=T,quote=F,sep="",row.names=F,col.names=F)
 write.table("\\begin{document}",file=texname2,append=T,quote=F,sep="",row.names=F,col.names=F)    
 write.table("\\pagenumbering{gobble}",file=texname2,append=T,quote=F,sep="",row.names=F,col.names=F)
 write.table("\\newcommand*{\\graphwidth}{5in}",file=texname2,append=T,quote=F,sep="",row.names=F,col.names=F) 
 write.table(paste("\\input{",texname,"}",sep=""),file=texname2,append=T,quote=F,sep="",row.names=F,col.names=F)  
 write.table("\\end{document}",file=texname2,append=T,quote=F,sep="",row.names=F,col.names=F) 
 #now compile and clean up...  
 call1<-paste(
   "cd '",dir.upload,"figures/","';"
   ," ls -l;"
   ," pdflatex -halt-on-error ",texname2,";","mv *.log *.aux ../latex"
   ,sep="")
 system(call1);
} 
#%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
#Get a list of the files in the source directory
MakeChrisTmaps=function(sourceMaps,onePDF=F,com=NULL){
  files=list.files(sourceMaps)
  png.files=files[grep(".png",files,fixed=T)]
  txt.files=files[grep(".txt",files,fixed=T)]
  app=onePDF
  Letters=c(LETTERS,letters)
  for(i in 1:length(png.files)){
    cap1<-paste(scan(paste0(sourceMaps,txt.files[i]),what="character"),collapse=" ")
    cap1=sanitize.cap(cap1)
    #make a simple tex document for this
    if(!onePDF) file1<-paste(dir.upload,"figures/",gsub(".txt",".tex",txt.files[i],fixed=T),sep="")
    filename=paste0(sourceMaps,png.files[i]) 
    if(onePDF & i==1) {#this grep uses tricks to make a reasonable name for the big pdf file
          if(length(grep("/commercial/",sourceMaps,fixed=T))>0 | com==T) {stpt=gregexpr(pattern ='_C_',txt.files[i])[[1]][1]+2}
          if(length(grep("/survey/",sourceMaps,fixed=T))>0  | com==F) stpt=gregexpr(pattern ='_S_',txt.files[i])[[1]][1]+2
          if(length(stpt)==0) stop("ERROR incorrect map source directory specification!")
          file1=paste0(dir.upload,"figures/",substr(txt.files[i],1,stpt),"ALLplots.tex")      
    }
    write.table(" ",file=file1,col.names=F,row.names=F,quote=F,append = app) #blank line - only needed for multi-fig pdf
    write.table("\\begin{figure}",file=file1,col.names=F,row.names=F,quote=F,append = app)    
    write.table(paste0("\\setcounter{figure}{",i-1,"}"),file=file1,col.names=F,row.names=F,quote=F,append = T)  #set figure number
    write.table("\\centering",file=file1,append=T,col.names=F,row.names=F,quote=F)
    write.table(paste("\\includegraphics[width=.95\\textwidth]{",filename,"}",sep="")
                ,file=file1,append=T,col.names=F,row.names=F,quote=F)
    write.table("\\captionsetup{singlelinecheck=off,font={small}}",file=file1,append=T,col.names=F,row.names=F,quote=F)
    write.table(paste("\\caption[.]{",cap1,"}",sep=""),file=file1,append=T,col.names=F,row.names=F,quote=F)
    write.table(paste0("\\label{Map",Letters[i],"}"),file=file1,append=T,col.names=F,row.names=F,quote=F)
    write.table("\\end{figure}",file=file1,append=T,col.names=F,row.names=F,quote=F)
    write.table("\\clearpage  ",file=file1,append=T,col.names=F,row.names=F,quote=F)
    
    #upload files as well
    if(!onePDF | i==length(png.files)) {
      if(onePDF) {
        texname<-paste0(substr(txt.files[i],1,stpt),"ALL.tex")
      } else { texname<-gsub(".txt",".tex",txt.files[i],fixed=T) }#don't need to change the name much because Chris used the naming convention
      renderPlot.tex(texname=file1,filename=texname,dir.upload)   #compile and run your file
    }  
  }
}
#%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
MakeChrisTmaps(sourceMaps=dir.source.Cmaps,onePDF,com=T)
MakeChrisTmaps(sourceMaps=dir.source.Smaps,onePDF,com=F)
#%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%









