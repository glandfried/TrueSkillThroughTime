oldpar <- par(no.readonly = TRUE)
oldwd <- getwd()
this.dir <- dirname(parent.frame(2)$ofile)
nombre.R <-  sys.frame(1)$ofile
require(tools)
nombre <- print(file_path_sans_ext(nombre.R))
pdf(paste0(nombre,".pdf"), width = 8, height = 5  )
setwd(this.dir)
###############################

data = read.csv("data/atp_learning_curves_trueskill.csv", stringsAsFactors=FALSE)

colnames(data)

djokovic = rgb(0.5,0.2,0.2,1.0)
djokovic_s = rgb(0.5,0.2,0.2,0.1)
nadal = rgb(0,0.8,0,1.0)
nadal_s = rgb(0,0.8,0,.1)
federer = rgb(0,0,0.8,1.0)
federer_s = rgb(0,0,0.8,.1)
sampras = rgb(0.8,0,0,1.0)
sampras_s = rgb(0.8,0,0,.1)
aggasi = rgb(0.3,0.3,0.3,1.0)
aggasi_s = rgb(0.3,0.3,0.3,.1)
edberg= rgb(0,0.8,0.8,1.0)
edberg_s= rgb(0,0.8,0.8,.1)
lendl = rgb(0.8,0,0.8,1.0)
lendl_s = rgb(0.8,0,0.8,.1)
mcenroe = rgb(0.2,0.5,0.2,1.0)
mcenroe_s = rgb(0.2,0.5,0.2,.1)
borg = rgb(0.8,0.8,0,1.0)
borg_s = rgb(0.8,0.8,0,.1)
connors = rgb(0.2,0.2,0.5,1.0)
connors_s = rgb(0.2,0.2,0.5,.1)

# djokovic = "d643"
# federer = "f324"
# sampras = "s402"
# lendl = "l018"
# connors = "c044"
# nadal = "n409"
# john_mcenroe = "m047"
# bjorn_borg = "b058"
# aggasi = "a092"
# hewitt = "h432"
# edberg = "e004"
# vilas = "v028"

y_max = 7.7# max(data[,"djokovic_mu"]+data[,"djokovic_sigma"],na.rm=TRUE) + 0.1
y_min = 0

origin= as.Date("1900-01-01", format = "%Y-%m-%d")
x_max = as.Date("2020-06-01", format = "%Y-%m-%d")
x_min = as.Date("1968-06-01", format = "%Y-%m-%d")

filtro =!is.na(data$nastase_time) & data$nastase_time < 28750 
plot(as.Date(data$nastase_time, origin=origin)[filtro],data$nastase_mu[filtro], type="l", ylim=c(y_min,y_max), xlim=c(x_min, x_max), axes = F,ann = F, lwd=0.5, col=rgb(0,0,0,0.3))

filtro = !is.na(data$hewitt_time) & data$hewitt_time < 40750 
lines(as.Date(data$hewitt_time, origin=origin)[filtro],data$hewitt_mu[filtro],lwd=0.5, col=rgb(0,0,0,0.3))

filtro = !is.na(data$murray_time) & data$murray_time < 60750 
lines(as.Date(data$murray_time, origin=origin)[filtro],data$murray_mu[filtro],lwd=0.5, col=rgb(0,0,0,0.3))

# filtro = !is.na(data$kuerten_time) & data$kuerten_time < 60750 
# lines(as.Date(data$kuerten_time, origin=origin)[filtro],data$kuerten_mu[filtro],lwd=0.5, col=rgb(0,0,0,0.3))

# filtro = !is.na(data$roddick_time) & data$roddick_time < 60750 
# lines(as.Date(data$roddick_time, origin=origin)[filtro],data$roddick_mu[filtro],lwd=0.5, col=rgb(0,0,0,0.3))


filtro = !is.na(data$courier_time) & data$courier_time < 35750 
lines(as.Date(data$courier_time, origin=origin)[filtro],data$courier_mu[filtro],lwd=0.5, col=rgb(0,0,0,0.3))

filtro = !is.na(data$wilander_time) & data$wilander_time < 32600 
lines(as.Date(data$wilander_time, origin=origin)[filtro],data$wilander_mu[filtro],lwd=0.5, col=rgb(0,0,0,0.3))


filtro =!is.na(data$connors_time) & data$connors_time < 31250 
lines(as.Date(data$connors_time, origin=origin)[filtro],data$connors_mu[filtro], col=connors,lwd=2)
polygon(c(as.Date(data$connors_time, origin=origin)[filtro],rev(as.Date(data$connors_time, origin=origin)[filtro])), c(data$connors_mu[filtro]+data$connors_sigma[filtro],rev(data$connors_mu[filtro]-data$connors_sigma[filtro])),  col=connors_s, border=F )

filtro = data$borg_time < 30300 & !is.na(data$borg_time)
lines(as.Date(data$borg_time, origin=origin)[filtro],data$borg_mu[filtro], col=borg, lwd=2)
polygon(c(as.Date(data$borg_time, origin=origin)[filtro],rev(as.Date(data$borg_time, origin=origin)[filtro])), c(data$borg_mu[filtro]+data$borg_sigma[filtro],rev(data$borg_mu[filtro]-data$borg_sigma[filtro])), col=borg_s, border=F )

filtro = data$mcenroe_time<33000 & filtro
lines(as.Date(data$mcenroe_time, origin=origin)[filtro],data$mcenroe_mu[filtro], col=mcenroe,lwd=2)
polygon(c(as.Date(data$mcenroe_time, origin=origin)[filtro],rev(as.Date(data$mcenroe_time, origin=origin)[filtro])), c(data$mcenroe_mu[filtro]+data$mcenroe_sigma[filtro],rev(data$mcenroe_mu[filtro]-data$mcenroe_sigma[filtro])), col=mcenroe_s, border=F )

filtro = !is.na(data$lendl_time) & data$lendl_time < 33750 
lines(as.Date(data$lendl_time, origin=origin)[filtro],data$lendl_mu[filtro], col=rgb(0.8,0,0.8,1), lwd=2)
polygon(c(as.Date(data$lendl_time, origin=origin)[filtro],rev(as.Date(data$lendl_time, origin=origin)[filtro])), c(data$lendl_mu[filtro]+data$lendl_sigma[filtro],rev(data$lendl_mu[filtro]-data$lendl_sigma[filtro])), col=lendl_s, border=F )
# 

filtro =!is.na(data$edberg_time) & data$edberg_time < 34750
lines(as.Date(data$edberg_time, origin=origin)[filtro],data$edberg_mu[filtro], col=rgb(0,0.7,0.7,1.0),lwd=2)
polygon(c(as.Date(data$edberg_time, origin=origin)[filtro],rev(as.Date(data$edberg_time, origin=origin)[filtro])), c(data$edberg_mu[filtro]+data$edberg_sigma[filtro],rev(data$edberg_mu[filtro]-data$edberg_sigma[filtro])),  col=edberg_s, border=F )


filtro= data$aggasi_time < 38800 & !is.na(data$aggasi_mu)
lines(as.Date(data$aggasi_time, origin=origin)[filtro],data$aggasi_mu[filtro], col=aggasi,lwd=2) 
polygon(c(as.Date(data$aggasi_time, origin=origin)[filtro],rev(as.Date(data$aggasi_time, origin=origin)[filtro])), c(data$aggasi_mu[filtro]+data$aggasi_sigma[filtro],rev(data$aggasi_mu[filtro]-data$aggasi_sigma[filtro])), col=aggasi_s, border=F )
filtro = !is.na(data$mcenroe_time)

filtro=!is.na(data$sampras_mu-data$sampras_sigma) 
polygon(c(as.Date(data[,"sampras_time"], origin=origin)[filtro],rev(as.Date(data[,"sampras_time"], origin=origin)[filtro])), c(data$sampras_mu[filtro]+data$sampras_sigma[filtro],rev(data$sampras_mu[filtro]-data$sampras_sigma[filtro])), col= sampras_s, border=F )
lines(as.Date(data[,"sampras_time"], origin=origin),data$sampras_mu, col=sampras, lwd=2) 


lines(as.Date(data[,"federer_time"], origin=origin), data$federer_mu , col=federer, lwd=2)
filtro =!is.na(data$federer_time)
polygon(c(as.Date(data[,"federer_time"][filtro], origin=origin),rev(as.Date(data[,"federer_time"][filtro], origin=origin))), c(data$federer_mu[filtro]+data$federer_sigma[filtro],rev(data$federer_mu[filtro]-data$federer_sigma[filtro])), col=federer_s, border=F )


lines(as.Date(data[,"nadal_time"], origin=origin),data$nadal_mu, col=nadal, lwd=2)
filtro=!is.na(data$nadal_mu-data$nadal_sigma)
polygon(c(as.Date(data[,"nadal_time"], origin=origin)[filtro],rev(as.Date(data[,"nadal_time"], origin=origin)[filtro])), c(data$nadal_mu[filtro]+data$nadal_sigma[filtro],rev(data$nadal_mu[filtro]-data$nadal_sigma[filtro])), col=nadal_s, border=F )

filtro=!is.na(data$djokovic_mu-data$djokovic_sigma)
lines(as.Date(data[,"djokovic_time"], origin=origin),data$djokovic_mu, col=rgb(0.5,0.2,0.2,1), lwd=2)
polygon(c(as.Date(data[,"djokovic_time"], origin=origin)[filtro],rev(as.Date(data[,"djokovic_time"], origin=origin)[filtro])), c(data$djokovic_mu[filtro]+data$djokovic_sigma[filtro],rev(data$djokovic_mu[filtro]-data$djokovic_sigma[filtro])), col=djokovic_s, border=F )


abline(h=6,lty=2)




at = as.numeric(as.Date(c("1970-01-01","1980-01-01","1990-01-01","2000-01-01","2010-01-01","2020-01-01"), format = "%Y-%m-%d"))

axis(side=2, labels=NA, at = c(0,1,3,5,7),cex.axis=0.6,tck=0.015)
axis(side=1, labels=NA, at = at, cex.axis=0.6,tck=0.015)
axis(lwd=0,side=1, at = at, labels = c(1970, 1980, 1990, 2000, 2010, 2020), las=0,cex.axis=1.25,line=-0.45)
axis(lwd=0,side=2,at = c(1,3,5,7), labels= c(1,3,5,7),  cex.axis=1.75,line=-0.45)

mtext(text ="Skill" ,side =2 ,line=2,cex=1.75)
mtext(text ="Time" ,side =1 ,line=2,cex=1.75)

phantom = rgb(0,0,0,0.3)

legend(as.numeric(as.Date("1969-06-01", origin=origin, format = "%Y-%m-%d")),2.1, pch=rep(c(20,19,19),5), col=rev(c(djokovic, nadal, phantom, federer, sampras,phantom, aggasi, edberg,phantom, lendl,mcenroe,phantom, borg,connors, phantom)), legend = rev(c("Djokovic", "Nadal", "Murray", "Federer","Sampras", "Hewitt", "Aggasi", "Edberg", "Courier", "Lendl", "McEnroe", "Wilander" ,"Borg", "Connors", "Nastase")), bty = "n",cex = 1.25, ncol=5)



#######################################
# end 
dev.off()
system(paste("pdfcrop -m '0 0 0 0'",paste0(nombre,".pdf") ,paste0(nombre,".pdf")))
setwd(oldwd)
par(oldpar, new=F)
#########################################
