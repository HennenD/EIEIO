#Some R scripts to help with the remaming.  Stick a bunch of files you want to add
#the naming convention to in a directory.  It helps to separate them by destination/type
#ie all the figures should go in one directory and all the tables in another. Then
#use the function that is specific to that file type
# **** WARNING *******
# It won't rename things if they are already named correctly, but it will tack on stuff 
# if you don't have the naming convention exactly right!!
# eg. 2015_HAL_UNIT_FIG_Profile.pdf will remain untouched - but
#     2015_HAL_UNIT_Profile.pdf will become 2015_HAL_UNIT_FIG_2015_HAL_UNIT_Profile.pdf
#%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
renameFigures<-function(dir.upload,prefix){
  filenames<-list.files(dir.upload)
  pref<-paste(prefix,"FIG_",sep="")
  newfiles<-filenames
  point<-grep(pref,filenames)
  if(length(point)>0) newfiles[-point]<-paste(pref,filenames[-point],sep="") else {
    newfiles<-paste(pref,filenames,sep="")
  }
  file.rename(from=paste(dir.upload,filenames,sep=""), to=paste(dir.upload,newfiles,sep=""))
}
#%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
renameTables<-function(dir.upload,prefix){
  filenames<-list.files(dir.upload)
  pref<-paste(prefix,"TAB_",sep="")
  newfiles<-filenames
  point<-grep(pref,filenames)
  if(length(point)>0) newfiles[-point]<-paste(pref,filenames[-point],sep="") else {
    newfiles<-paste(pref,filenames,sep="")
  }
  file.rename(from=paste(dir.upload,filenames,sep=""), to=paste(dir.upload,newfiles,sep=""))
}
#%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
renameModel<-function(dir.upload,prefix){
  filenames<-list.files(dir.upload)
  pref<-paste(prefix,"MOD_",sep="")
  newfiles<-filenames
  point<-grep(pref,filenames)
  if(length(point)>0) newfiles[-point]<-paste(pref,filenames[-point],sep="") else {
    newfiles<-paste(pref,filenames,sep="")
  }
  file.rename(from=paste(dir.upload,filenames,sep=""), to=paste(dir.upload,newfiles,sep=""))
}
#%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
#  ******  Example  ****** #
Spp<-"Atlantic halibut"
dir.test<-"/MyDirectory/Assessment/upload/"  #Put a bunch of FIGURE files you want to rename in a directory
# If you use windows the slashes go the other way, or get doubled or something....
assYr<-2015
hdr<-paste(assYr,"_HAL_UNIT_",sep="") #2015_HAL_UNIT_
renameFigures(dir.upload=dir.upload,prefix=hdr)
renameTables(dir.upload=dir.upload,prefix=hdr)
#################################################################################
#Remove bad naming convention stuff Let's say you mess up and put a not quite right
#naming convention prefix on a bunch of files. Don't worry - this will pull it off 
#again - as long as you know what the bad name is exactly!
RemoveBadName<-function(dir.upload,pref){
  filenames<-list.files(dir.upload)
  newfiles<-filenames
  newfiles[grep(pref,filenames)]<-substr(filenames[grep(pref,filenames)],nchar(pref),nchar(filenames))
  file.rename(from=paste(dir.upload,filenames,sep=""), to=paste(dir.upload,newfiles,sep=""))
}
#################################################################################
#  ******  Example  ****** #
#Here is an example with an incomplete naming convention stuck on...
RemoveBadName(dir.upload="/MyDirectory/Assessment/upload/tables/",pref="2015_HAL_UNIT_")

