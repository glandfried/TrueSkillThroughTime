oldpar <- par(no.readonly = TRUE)
oldwd <- getwd()
this.dir <- dirname(parent.frame(2)$ofile)
nombre.R <-  sys.frame(1)$ofile
require(tools)
nombre <- print(file_path_sans_ext(nombre.R))
pdf(paste0(nombre,".pdf"), width = 8, height = 5  )
setwd(this.dir)
###############################

data = read.csv("data/atp_learning_curves.csv", stringsAsFactors=FALSE)



y_max = max(data[data<1000],na.rm=TRUE)
y_min = min(data[data<1000],na.rm=TRUE)

x_max = max(data[data>1000],na.rm=TRUE) + 90
x_min = min(data[data>1000],na.rm=TRUE)


#2020-01-20 == 43848
#2020 == 43828
year = c()
at = c()
i = 43828; y = 2020
while (i > x_min){
    if (y%%4 == 0){
        at = c(i,at)
        year = c(y,year)
        i = i - 366
    }else{
        i = i - 365
    }
    y = y - 1
}


plot(data$federer_time, data$federer_mu , col="cornflowerblue", type="l", ylim=c(y_min,y_max), xlim=c(x_min, x_max), axes = F,ann = F )
points(data$federer_time, data$federer_mu , col="cornflowerblue", pch=19, cex=0.5)
lines(data$nadal_time,data$nadal_mu, col="chocolate")
points(data$nadal_time,data$nadal_mu, col="chocolate", pch=19, cex=0.5)
lines(data$djokovic_time,data$djokovic_mu, col="brown2")
points(data$djokovic_time,data$djokovic_mu, col="brown2", pch=19, cex=0.5)
lines(data$sampras_time,data$sampras_mu, col="darkorchid3")
points(data$sampras_time,data$sampras_mu, col="darkorchid3", pch=19, cex=0.5)
lines(data$aggasi_time,data$aggasi_mu, col="darkgreen")
points(data$aggasi_time,data$aggasi_mu, col="darkgreen", pch=19, cex=0.5)
lines(data$vilas_time,data$vilas_mu, col="deeppink3")
points(data$vilas_time,data$vilas_mu, col="deeppink3", pch=19, cex=0.5)
lines(data$borg_time,data$borg_mu, col="coral4")
points(data$borg_time,data$borg_mu, col="coral4", pch=19, cex=0.5)
lines(data$mcenroe_time,data$mcenroe_mu, col="darkgoldenrod2")
points(data$mcenroe_time,data$mcenroe_mu, col="darkgoldenrod2", pch=19, cex=0.5)


axis(side=2, labels=NA,cex.axis=0.6,tck=0.015)
axis(side=1, labels=NA, at= at, cex.axis=0.6,tck=0.015)
axis(lwd=0,side=1, at = at, labels= year, las=0,cex.axis=1.25,line=-0.45)
axis(lwd=0,side=2,cex.axis=1.75,line=-0.45)

mtext(text ="Skill" ,side =2 ,line=2,cex=1.75)
mtext(text ="Time" ,side =1 ,line=2,cex=1.75)

legend(35000,2.35, pch=19, col=c("cornflowerblue","chocolate","brown2", "darkorchid3", "darkgreen", "deeppink3", "coral4", "darkgoldenrod2" ), legend = c("Federer","Nadal", "Djokovic", "Sampras", "Aggasi", "Vilas", "Borg", "McEnroe"), bty = "n",cex = 1.25, ncol=2)



#######################################
# end 
dev.off()
system(paste("pdfcrop -m '0 0 0 0'",paste0(nombre,".pdf") ,paste0(nombre,".pdf")))
setwd(oldwd)
par(oldpar, new=F)
#########################################
