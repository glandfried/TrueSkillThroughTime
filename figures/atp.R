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

y_max = max(data[,"djokovic_mu"]+data[,"djokovic_sigma"],na.rm=TRUE) + 0.1
y_min = 0

origin= as.Date("1900-01-01", format = "%Y-%m-%d")
x_max = as.Date("2020-06-01", format = "%Y-%m-%d")
x_min = as.Date("1968-06-01", format = "%Y-%m-%d")

plot(as.Date(data[,"federer_time"], origin=origin), data$federer_mu , type="l", ylim=c(y_min,y_max), xlim=c(x_min, x_max), axes = F,ann = F , col=rgb(0,0,1,0.75), lwd=2)
polygon(c(as.Date(data[,"federer_time"], origin=origin),rev(as.Date(data[,"federer_time"], origin=origin))), c(data$federer_mu+data$federer_sigma,rev(data$federer_mu-data$federer_sigma)), col=rgb(0,0,1,0.3), border=F )
lines(as.Date(data[,"nadal_time"], origin=origin),data$nadal_mu, col=rgb(0,1,0,0.75), lwd=2)
filtro=!is.na(data$nadal_mu-data$nadal_sigma)
polygon(c(as.Date(data[,"nadal_time"], origin=origin)[filtro],rev(as.Date(data[,"nadal_time"], origin=origin)[filtro])), c(data$nadal_mu[filtro]+data$nadal_sigma[filtro],rev(data$nadal_mu[filtro]-data$nadal_sigma[filtro])), col=rgb(0,1,0,0.3), border=F )
lines(as.Date(data[,"djokovic_time"], origin=origin),data$djokovic_mu, col=rgb(1,0,0,0.75), lwd=2)
filtro=!is.na(data$djokovic_mu-data$djokovic_sigma)
polygon(c(as.Date(data[,"djokovic_time"], origin=origin)[filtro],rev(as.Date(data[,"djokovic_time"], origin=origin)[filtro])), c(data$djokovic_mu[filtro]+data$djokovic_sigma[filtro],rev(data$djokovic_mu[filtro]-data$djokovic_sigma[filtro])), col=rgb(1,0,0,0.3), border=F )
lines(as.Date(data[,"sampras_time"], origin=origin),data$sampras_mu, col=rgb(0.8,0.8,0,0.75), lwd=2) 
filtro=!is.na(data$sampras_mu-data$sampras_sigma)
polygon(c(as.Date(data[,"sampras_time"], origin=origin)[filtro],rev(as.Date(data[,"sampras_time"], origin=origin)[filtro])), c(data$sampras_mu[filtro]+data$sampras_sigma[filtro],rev(data$sampras_mu[filtro]-data$sampras_sigma[filtro])), col=rgb(0.8,0.8,0,0.3), border=F )
lines(as.Date(data$aggasi_time, origin=origin),data$aggasi_mu, col=rgb(0.8,0,0.8,0.75),lwd=2) 
filtro=!is.na(data$aggasi_mu-data$aggasi_sigma)
polygon(c(as.Date(data$aggasi_time, origin=origin)[filtro],rev(as.Date(data$aggasi_time, origin=origin)[filtro])), c(data$aggasi_mu[filtro]+data$aggasi_sigma[filtro],rev(data$aggasi_mu[filtro]-data$aggasi_sigma[filtro])), col=rgb(0.8,0,0.8,0.3), border=F )
filtro = !is.na(data$mcenroe_time)
filtro = data$mcenroe_time<34380 & filtro
lines(as.Date(data$mcenroe_time, origin=origin)[filtro],data$mcenroe_mu[filtro], col=rgb(0,0.7,0.7,0.75),lwd=2)
polygon(c(as.Date(data$mcenroe_time, origin=origin)[filtro],rev(as.Date(data$mcenroe_time, origin=origin)[filtro])), c(data$mcenroe_mu[filtro]+data$mcenroe_sigma[filtro],rev(data$mcenroe_mu[filtro]-data$mcenroe_sigma[filtro])), col=rgb(0,0.7,0.7,0.3), border=F )
filtro =data$vilas_time < 31000 & !is.na(data$vilas_time)
lines(as.Date(data$vilas_time, origin=origin)[filtro],data$vilas_mu[filtro], col=rgb(0.2,0.5,0.2,0.75),lwd=2)
polygon(c(as.Date(data$vilas_time, origin=origin)[filtro],rev(as.Date(data$vilas_time, origin=origin)[filtro])), c(data$vilas_mu[filtro]+data$vilas_sigma[filtro],rev(data$vilas_mu[filtro]-data$vilas_sigma[filtro])),  col=rgb(0.2,0.5,0.2,0.3), border=F )
filtro = data$borg_time < 31000 & !is.na(data$borg_time)
lines(as.Date(data$borg_time, origin=origin)[filtro],data$borg_mu[filtro], col=rgb(0.5,0.2,0.2,0.75), lwd=2)
polygon(c(as.Date(data$borg_time, origin=origin)[filtro],rev(as.Date(data$borg_time, origin=origin)[filtro])), c(data$borg_mu[filtro]+data$borg_sigma[filtro],rev(data$borg_mu[filtro]-data$borg_sigma[filtro])), col=rgb(0.5,0.2,0.2,0.3), border=F )


at = as.numeric(as.Date(c("1970-01-01","1980-01-01","1990-01-01","2000-01-01","2010-01-01","2020-01-01"), format = "%Y-%m-%d"))

axis(side=2, labels=NA, at = c(0,1,3,5,7),cex.axis=0.6,tck=0.015)
axis(side=1, labels=NA, at = at, cex.axis=0.6,tck=0.015)
axis(lwd=0,side=1, at = at, labels = c(1970, 1980, 1990, 2000, 2010, 2020), las=0,cex.axis=1.25,line=-0.45)
axis(lwd=0,side=2,at = c(1,3,5,7), labels= c(1,3,5,7),  cex.axis=1.75,line=-0.45)

mtext(text ="Skill" ,side =2 ,line=2,cex=1.75)
mtext(text ="Time" ,side =1 ,line=2,cex=1.75)

legend(27500,1.8, pch=19, col=rev(c(rgb(1,0,0,0.75), rgb(0,1,0,0.75), rgb(0,0,1,0.75), rgb(0.8,0.8,0,0.75), rgb(0.8,0,0.8,0.75), rgb(0,0.8,0.8,0.75), rgb(0.5,0.2,0.2,0.75), rgb(0.2,0.5,0.2,0.75))), legend = rev(c("Djokovic", "Nadal", "Federer","Sampras", "Aggasi", "McEnroe", "Borg", "Vilas")), bty = "n",cex = 1.25, ncol=4)



#######################################
# end 
dev.off()
system(paste("pdfcrop -m '0 0 0 0'",paste0(nombre,".pdf") ,paste0(nombre,".pdf")))
setwd(oldwd)
par(oldpar, new=F)
#########################################
