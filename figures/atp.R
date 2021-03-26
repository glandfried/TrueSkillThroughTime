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


plot(data$federer_time, data$federer_mu , type="l", ylim=c(y_min,y_max), xlim=c(x_min, x_max), axes = F,ann = F , col=rgb(0,0,1,0.75), lwd=2)
polygon(c(data$federer_time,rev(data$federer_time)), c(data$federer_mu+data$federer_sigma,rev(data$federer_mu-data$federer_sigma)), col=rgb(0,0,1,0.3), border=F )
lines(data$nadal_time,data$nadal_mu, col=rgb(0,1,0,0.75), lwd=2)
filtro=!is.na(data$nadal_mu-data$nadal_sigma)
polygon(c(data$nadal_time[filtro],rev(data$nadal_time[filtro])), c(data$nadal_mu[filtro]+data$nadal_sigma[filtro],rev(data$nadal_mu[filtro]-data$nadal_sigma[filtro])), col=rgb(0,1,0,0.3), border=F )
lines(data$djokovic_time,data$djokovic_mu, col=rgb(1,0,0,0.75), lwd=2)
filtro=!is.na(data$djokovic_mu-data$djokovic_sigma)
polygon(c(data$djokovic_time[filtro],rev(data$djokovic_time[filtro])), c(data$djokovic_mu[filtro]+data$djokovic_sigma[filtro],rev(data$djokovic_mu[filtro]-data$djokovic_sigma[filtro])), col=rgb(1,0,0,0.3), border=F )
lines(data$sampras_time,data$sampras_mu, col=rgb(0.8,0.8,0,0.75), lwd=2) 
filtro=!is.na(data$sampras_mu-data$sampras_sigma)
polygon(c(data$sampras_time[filtro],rev(data$sampras_time[filtro])), c(data$sampras_mu[filtro]+data$sampras_sigma[filtro],rev(data$sampras_mu[filtro]-data$sampras_sigma[filtro])), col=rgb(0.8,0.8,0,0.3), border=F )
lines(data$aggasi_time,data$aggasi_mu, col=rgb(0.8,0,0.8,0.75),lwd=2) 
filtro=!is.na(data$aggasi_mu-data$aggasi_sigma)
polygon(c(data$aggasi_time[filtro],rev(data$aggasi_time[filtro])), c(data$aggasi_mu[filtro]+data$aggasi_sigma[filtro],rev(data$aggasi_mu[filtro]-data$aggasi_sigma[filtro])), col=rgb(0.8,0,0.8,0.3), border=F )
filtro = !is.na(data$mcenroe_time)
filtro = data$mcenroe_time<34380 & filtro
lines(data$mcenroe_time[filtro],data$mcenroe_mu[filtro], col=rgb(0,0.7,0.7,0.75),lwd=2)
polygon(c(data$mcenroe_time[filtro],rev(data$mcenroe_time[filtro])), c(data$mcenroe_mu[filtro]+data$mcenroe_sigma[filtro],rev(data$mcenroe_mu[filtro]-data$mcenroe_sigma[filtro])), col=rgb(0,0.7,0.7,0.3), border=F )
filtro =data$vilas_time < 31000 & !is.na(data$vilas_time)
lines(data$vilas_time[filtro],data$vilas_mu[filtro], col=rgb(0.2,0.5,0.2,0.75),lwd=2)
polygon(c(data$vilas_time[filtro],rev(data$vilas_time[filtro])), c(data$vilas_mu[filtro]+data$vilas_sigma[filtro],rev(data$vilas_mu[filtro]-data$vilas_sigma[filtro])),  col=rgb(0.2,0.5,0.2,0.3), border=F )
filtro = data$borg_time < 31000 & !is.na(data$borg_time)
lines(data$borg_time[filtro],data$borg_mu[filtro], col=rgb(0.5,0.2,0.2,0.75), lwd=2)
polygon(c(data$borg_time[filtro],rev(data$borg_time[filtro])), c(data$borg_mu[filtro]+data$borg_sigma[filtro],rev(data$borg_mu[filtro]-data$borg_sigma[filtro])), col=rgb(0.5,0.2,0.2,0.3), border=F )


axis(side=2, labels=NA,cex.axis=0.6,tck=0.015)
axis(side=1, labels=NA, at= at, cex.axis=0.6,tck=0.015)
axis(lwd=0,side=1, at = at, labels= year, las=0,cex.axis=1.25,line=-0.45)
axis(lwd=0,side=2,cex.axis=1.75,line=-0.45)

mtext(text ="Skill" ,side =2 ,line=2,cex=1.75)
mtext(text ="Time" ,side =1 ,line=2,cex=1.75)

legend(35000,2.35, pch=19, col=c(rgb(0,0,1,0.75), rgb(0,1,0,0.75), rgb(1,0,0,0.75), rgb(0.8,0.8,0,0.75), rgb(0.8,0,0.8,0.75), rgb(0,0.8,0.8,0.75), rgb(0.5,0.2,0.2,0.75), rgb(0.2,0.5,0.2,0.75)), legend = c("Federer","Nadal", "Djokovic", "Sampras", "Aggasi", "McEnroe", "Borg", "Vilas"), bty = "n",cex = 1.25, ncol=2)



#######################################
# end 
dev.off()
system(paste("pdfcrop -m '0 0 0 0'",paste0(nombre,".pdf") ,paste0(nombre,".pdf")))
setwd(oldwd)
par(oldpar, new=F)
#########################################
