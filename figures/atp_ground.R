oldpar <- par(no.readonly = TRUE)
oldwd <- getwd()
this.dir <- dirname(parent.frame(2)$ofile)
nombre.R <-  sys.frame(1)$ofile
require(tools)
nombre <- print(file_path_sans_ext(nombre.R))
pdf(paste0(nombre,".pdf"), width = 8, height = 5  )
setwd(this.dir)
###############################

data = read.csv("data/atp_ground_learning_curves.csv", stringsAsFactors=FALSE)

colnames(data)

y_max = 6
y_min = -1

origin= as.Date("1900-01-01", format = "%Y-%m-%d")
x_max = as.Date("2020-06-01", format = "%Y-%m-%d")
x_min = as.Date("2001-06-01", format = "%Y-%m-%d")

graficar <- function(player,ground,col){
    lines(as.Date(data[,paste0(player,"_time_",ground)], origin=origin),data[,paste0(player,"_mu_",ground)], col=rgb(col[1],col[2],col[3]), lwd=2)
    filtro=!is.na(data[,paste0(player,"_time_",ground)])
    polygon(c(as.Date(data[,paste0(player,"_time_",ground)], origin=origin)[filtro],rev(as.Date(data[,paste0(player,"_time_",ground)], origin=origin)[filtro])), c(data[,paste0(player,"_mu_",ground)][filtro]+data[,paste0(player,"_sigma_",ground)][filtro],rev(data[,paste0(player,"_mu_",ground)][filtro]-data[,paste0(player,"_sigma_",ground)][filtro])), col=rgb(col[1],col[2],col[3],0.3), border=F )
}


plot(-1000,-1000, ylim=c(y_min,y_max), xlim=c(x_min, x_max), axes = F,ann = F , col=rgb(0,0,1,0.75), lwd=2)
graficar("nadal","clay",c(0.8,0,0))
graficar("nadal","grass",c(0,0.8,0))
graficar("nadal","hard",c(0,0,0.8))

at = as.numeric(as.Date(c("2004-01-01","2008-01-01","2012-01-01","2016-01-01","2020-01-01"), format = "%Y-%m-%d"))

axis(side=2, labels=NA,at=seq(-1,5),cex.axis=0.6,tck=0.015)
axis(side=1, labels=NA, at = at, cex.axis=0.6,tck=0.015)
axis(lwd=0,side=1, at = at, c("2004", "2008", "2012", "2016", "2020"), las=0,cex.axis=1.25,line=-0.45)
axis(lwd=0,side=2, at= seq(-1,5), labels=NA,cex.axis=1.75,line=-0.45)

segments(x0= as.numeric(as.Date("2001-09-01", format = "%Y-%m-%d")),x1= as.numeric(as.Date("2020-03-01", format = "%Y-%m-%d")), y0=seq(0,4),lty=2, col=rgb(0,0,0,0.15))
mtext(text ="Skill difference      " ,side =2 ,line=0.7,cex=1.75)
mtext(text ="Time" ,side =1 ,line=2,cex=1.75)

legend(as.numeric(as.Date("2002-06-01", format = "%Y-%m-%d")) ,6.2, pch=c(19,19,19,19), col=c(rgb(1,1,1),rgb(0.8,0,0,0.75),rgb(0,0,0.8,0.75),rgb(0,0.8,0,0.75)), legend = c("Nadal:    ", "Clay", "Hard", "Grass"), bty = "n",cex = 1.33, ncol=4)



plot(-1000,-1000, ylim=c(y_min,y_max), xlim=c(x_min, x_max), axes = F,ann = F , col=rgb(0,0,1,0.75), lwd=2)
graficar("federer","clay",c(0.8,0,0))
graficar("federer","grass",c(0,0.8,0))
graficar("federer","hard",c(0,0,0.8))

at = as.numeric(as.Date(c("2004-01-01","2008-01-01","2012-01-01","2016-01-01","2020-01-01"), format = "%Y-%m-%d"))

axis(side=2, labels=NA,at=seq(-1,5),cex.axis=0.6,tck=0.015)
axis(side=1, labels=NA, at = at, cex.axis=0.6,tck=0.015)
axis(lwd=0,side=1, at = at, c("2004", "2008", "2012", "2016", "2020"), las=0,cex.axis=1.25,line=-0.45)
axis(lwd=0,side=2, at= seq(-1,5), labels=NA,cex.axis=1.75,line=-0.45)

segments(x0= as.numeric(as.Date("2001-09-01", format = "%Y-%m-%d")),x1= as.numeric(as.Date("2020-03-01", format = "%Y-%m-%d")), y0=seq(0,4),lty=2, col=rgb(0,0,0,0.15))
mtext(text ="Skill difference      " ,side =2 ,line=0.7,cex=1.75)
mtext(text ="Time" ,side =1 ,line=2,cex=1.75)

legend(as.numeric(as.Date("2002-06-01", format = "%Y-%m-%d")) ,6.2, pch=c(19,19,19,19), col=c(rgb(1,1,1),rgb(0.8,0,0,0.75),rgb(0,0,0.8,0.75),rgb(0,0.8,0,0.75)), legend = c("Federer:    ", "Clay", "Hard", "Grass"), bty = "n",cex = 1.33, ncol=4)



plot(-1000,-1000, ylim=c(y_min,y_max), xlim=c(x_min, x_max), axes = F,ann = F , col=rgb(0,0,1,0.75), lwd=2)
graficar("djokovic","clay",c(0.8,0,0))
graficar("djokovic","grass",c(0,0.8,0))
graficar("djokovic","hard",c(0,0,0.8))

at = as.numeric(as.Date(c("2004-01-01","2008-01-01","2012-01-01","2016-01-01","2020-01-01"), format = "%Y-%m-%d"))

axis(side=2, labels=NA,at=seq(-1,5),cex.axis=0.6,tck=0.015)
axis(side=1, labels=NA, at = at, cex.axis=0.6,tck=0.015)
axis(lwd=0,side=1, at = at, c("2004", "2008", "2012", "2016", "2020"), las=0,cex.axis=1.25,line=-0.45)
axis(lwd=0,side=2, at= seq(-1,5), labels=NA,cex.axis=1.75,line=-0.45)

segments(x0= as.numeric(as.Date("2001-09-01", format = "%Y-%m-%d")),x1= as.numeric(as.Date("2020-03-01", format = "%Y-%m-%d")), y0=seq(0,4),lty=2, col=rgb(0,0,0,0.15))
mtext(text ="Skill difference      " ,side =2 ,line=0.7,cex=1.75)
mtext(text ="Time" ,side =1 ,line=2,cex=1.75)

legend(as.numeric(as.Date("2002-06-01", format = "%Y-%m-%d")) ,6.2, pch=c(19,19,19,19), col=c(rgb(1,1,1),rgb(0.8,0,0,0.75),rgb(0,0,0.8,0.75),rgb(0,0.8,0,0.75)), legend = c("Djokovic:   ", "Clay", "Hard", "Grass"), bty = "n",cex = 1.33, ncol=4)





#######################################
# end 
dev.off()
system(paste("pdfcrop -m '0 0 0 0'",paste0(nombre,".pdf") ,paste0(nombre,".pdf")))
setwd(oldwd)
par(oldpar, new=F)
#########################################
