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


djokovic = rgb(0.5,0.2,0.2,1.0)
nadal = rgb(0,0.8,0,1.0)
federer = rgb(0,0,0.8,1.0)
sampras = rgb(0.8,0.8,0,1.0)
aggasi = rgb(0.3,0.3,0.3,1.0)
edberg= rgb(0,0.8,0.8,1.0)
lendl = rgb(0.8,0,0.8,1.0)
mcenroe = rgb(0.2,0.5,0.2,1.0)
borg = rgb(0.8,0,0,1.0)
connors = rgb(0.2,0.2,0.5,1.0)

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

filtro =!is.na(data$connors_time) & data$connors_time < 31250 
plot(as.Date(data$connors_time, origin=origin)[filtro],data$connors_mu[filtro], col=connors,lwd=2, type="l", ylim=c(y_min,y_max), xlim=c(x_min, x_max), axes = F,ann = F )
polygon(c(as.Date(data$connors_time, origin=origin)[filtro],rev(as.Date(data$connors_time, origin=origin)[filtro])), c(data$connors_mu[filtro]+data$connors_sigma[filtro],rev(data$connors_mu[filtro]-data$connors_sigma[filtro])),  col=rgb(0.2,0.2,0.5,0.2), border=F )

filtro = data$borg_time < 30300 & !is.na(data$borg_time)
lines(as.Date(data$borg_time, origin=origin)[filtro],data$borg_mu[filtro], col=borg, lwd=2)
polygon(c(as.Date(data$borg_time, origin=origin)[filtro],rev(as.Date(data$borg_time, origin=origin)[filtro])), c(data$borg_mu[filtro]+data$borg_sigma[filtro],rev(data$borg_mu[filtro]-data$borg_sigma[filtro])), col=rgb(0.5,0.2,0.2,0.2), border=F )

filtro = data$mcenroe_time<33000 & filtro
lines(as.Date(data$mcenroe_time, origin=origin)[filtro],data$mcenroe_mu[filtro], col=mcenroe,lwd=2)
polygon(c(as.Date(data$mcenroe_time, origin=origin)[filtro],rev(as.Date(data$mcenroe_time, origin=origin)[filtro])), c(data$mcenroe_mu[filtro]+data$mcenroe_sigma[filtro],rev(data$mcenroe_mu[filtro]-data$mcenroe_sigma[filtro])), col=rgb(0.2,0.5,0.2,0.2), border=F )


filtro = !is.na(data$lendl_time) & data$lendl_time < 33750 
lines(as.Date(data$lendl_time, origin=origin)[filtro],data$lendl_mu[filtro], col=rgb(0.8,0,0.8,1), lwd=2)
polygon(c(as.Date(data$lendl_time, origin=origin)[filtro],rev(as.Date(data$lendl_time, origin=origin)[filtro])), c(data$lendl_mu[filtro]+data$lendl_sigma[filtro],rev(data$lendl_mu[filtro]-data$lendl_sigma[filtro])), col=rgb(0.8,0,0.8,0.2), border=F )
# 

filtro =!is.na(data$edberg_time) & data$edberg_time < 34750
lines(as.Date(data$edberg_time, origin=origin)[filtro],data$edberg_mu[filtro], col=rgb(0,0.7,0.7,1.0),lwd=2)
polygon(c(as.Date(data$edberg_time, origin=origin)[filtro],rev(as.Date(data$edberg_time, origin=origin)[filtro])), c(data$edberg_mu[filtro]+data$edberg_sigma[filtro],rev(data$edberg_mu[filtro]-data$edberg_sigma[filtro])),  col=rgb(0,0.7,0.7,0.2), border=F )


filtro=!is.na(data$aggasi_mu-data$aggasi_sigma)
lines(as.Date(data$aggasi_time, origin=origin),data$aggasi_mu, col=aggasi,lwd=2) 
polygon(c(as.Date(data$aggasi_time, origin=origin)[filtro],rev(as.Date(data$aggasi_time, origin=origin)[filtro])), c(data$aggasi_mu[filtro]+data$aggasi_sigma[filtro],rev(data$aggasi_mu[filtro]-data$aggasi_sigma[filtro])), col=rgb(0.3,0.3,0.3,0.2), border=F )
filtro = !is.na(data$mcenroe_time)

filtro=!is.na(data$sampras_mu-data$sampras_sigma)
polygon(c(as.Date(data[,"sampras_time"], origin=origin)[filtro],rev(as.Date(data[,"sampras_time"], origin=origin)[filtro])), c(data$sampras_mu[filtro]+data$sampras_sigma[filtro],rev(data$sampras_mu[filtro]-data$sampras_sigma[filtro])), col=rgb(0.8,0.8,0,0.2), border=F )
lines(as.Date(data[,"sampras_time"], origin=origin),data$sampras_mu, col=sampras, lwd=2) 


lines(as.Date(data[,"federer_time"], origin=origin), data$federer_mu , col=federer, lwd=2)
filtro =!is.na(data$federer_time)
polygon(c(as.Date(data[,"federer_time"][filtro], origin=origin),rev(as.Date(data[,"federer_time"][filtro], origin=origin))), c(data$federer_mu[filtro]+data$federer_sigma[filtro],rev(data$federer_mu[filtro]-data$federer_sigma[filtro])), col=rgb(0,0,0.8,0.2), border=F )


lines(as.Date(data[,"nadal_time"], origin=origin),data$nadal_mu, col=nadal, lwd=2)
filtro=!is.na(data$nadal_mu-data$nadal_sigma)
polygon(c(as.Date(data[,"nadal_time"], origin=origin)[filtro],rev(as.Date(data[,"nadal_time"], origin=origin)[filtro])), c(data$nadal_mu[filtro]+data$nadal_sigma[filtro],rev(data$nadal_mu[filtro]-data$nadal_sigma[filtro])), col=rgb(0,0.8,0,0.2), border=F )

filtro=!is.na(data$djokovic_mu-data$djokovic_sigma)
lines(as.Date(data[,"djokovic_time"], origin=origin),data$djokovic_mu, col=rgb(0.5,0.2,0.2,1), lwd=2)
polygon(c(as.Date(data[,"djokovic_time"], origin=origin)[filtro],rev(as.Date(data[,"djokovic_time"], origin=origin)[filtro])), c(data$djokovic_mu[filtro]+data$djokovic_sigma[filtro],rev(data$djokovic_mu[filtro]-data$djokovic_sigma[filtro])), col=rgb(0.5,0.2,0.2,0.2), border=F )



abline(h=6,lty=2)




at = as.numeric(as.Date(c("1970-01-01","1980-01-01","1990-01-01","2000-01-01","2010-01-01","2020-01-01"), format = "%Y-%m-%d"))

axis(side=2, labels=NA, at = c(0,1,3,5,7),cex.axis=0.6,tck=0.015)
axis(side=1, labels=NA, at = at, cex.axis=0.6,tck=0.015)
axis(lwd=0,side=1, at = at, labels = c(1970, 1980, 1990, 2000, 2010, 2020), las=0,cex.axis=1.25,line=-0.45)
axis(lwd=0,side=2,at = c(1,3,5,7), labels= c(1,3,5,7),  cex.axis=1.75,line=-0.45)

mtext(text ="Skill" ,side =2 ,line=2,cex=1.75)
mtext(text ="Time" ,side =1 ,line=2,cex=1.75)

legend(as.numeric(as.Date("1970-01-01", origin=origin, format = "%Y-%m-%d")),2.1, pch=19, col=rev(c(djokovic, nadal, federer, sampras, aggasi, edberg,lendl,mcenroe,borg,connors)), legend = rev(c("Djokovic", "Nadal", "Federer","Sampras", "Aggasi", "Edberg", "Lendl", "McEnroe", "Borg", "Connors")), bty = "n",cex = 1.25, ncol=5)



segmento <- function(x0,x1,y0,y1,col){
    polygon(c(x0,x1,x1,x0),c(y0,y0,y1,y1),col=col, border=F )
}

segmento(
x0=as.numeric(as.Date("1974-07-29", format = "%Y-%m-%d")),
x1=as.numeric(as.Date("1977-08-21", format = "%Y-%m-%d")),
y0=7.5,y1=7.6,col=connors)
segmento(
x0=as.numeric(as.Date("1977-08-30", format = "%Y-%m-%d")),
x1=as.numeric(as.Date("1979-04-08", format = "%Y-%m-%d")),
y0=7.5,y1=7.6,col=connors)
segmento(
x0=as.numeric(as.Date("1979-04-09", format = "%Y-%m-%d")),
x1=as.numeric(as.Date("1979-05-20", format = "%Y-%m-%d")),
y0=7.5,y1=7.6,col=borg)
segmento(
x0=as.numeric(as.Date("1979-05-21", format = "%Y-%m-%d")),
x1=as.numeric(as.Date("1979-07-08", format = "%Y-%m-%d")),
y0=7.5,y1=7.6,col=connors)
segmento(
x0=as.numeric(as.Date("1979-07-09", format = "%Y-%m-%d")),
x1=as.numeric(as.Date("1980-03-02", format = "%Y-%m-%d")),
y0=7.5,y1=7.6,col=borg)
segmento(
x0=as.numeric(as.Date("1980-03-24", format = "%Y-%m-%d")),
x1=as.numeric(as.Date("1981-07-05", format = "%Y-%m-%d")),
y0=7.5,y1=7.6,col=borg)
segmento(
x0=as.numeric(as.Date("1981-08-03", format = "%Y-%m-%d")),
x1=as.numeric(as.Date("1982-09-12", format = "%Y-%m-%d")),
y0=7.5,y1=7.6,col=mcenroe)
segmento(
x0=as.numeric(as.Date("1982-11-01", format = "%Y-%m-%d")),
x1=as.numeric(as.Date("1983-01-30", format = "%Y-%m-%d")),
y0=7.5,y1=7.6,col=mcenroe)
segmento(
x0=as.numeric(as.Date("1983-02-28", format = "%Y-%m-%d")),
x1=as.numeric(as.Date("1983-05-15", format = "%Y-%m-%d")),
y0=7.5,y1=7.6,col=lendl)
segmento(
x0=as.numeric(as.Date("1983-07-04", format = "%Y-%m-%d")),
x1=as.numeric(as.Date("1983-10-30", format = "%Y-%m-%d")),
y0=7.5,y1=7.6,col=mcenroe)
segmento(
x0=as.numeric(as.Date("1983-10-31", format = "%Y-%m-%d")),
x1=as.numeric(as.Date("1983-12-11", format = "%Y-%m-%d")),
y0=7.5,y1=7.6,col=lendl)
segmento(
x0=as.numeric(as.Date("1984-01-09", format = "%Y-%m-%d")),
x1=as.numeric(as.Date("1984-03-11", format = "%Y-%m-%d")),
y0=7.5,y1=7.6,col=lendl)
segmento(
x0=as.numeric(as.Date("1984-03-12", format = "%Y-%m-%d")),
x1=as.numeric(as.Date("1984-06-10", format = "%Y-%m-%d")),
y0=7.5,y1=7.6,col=mcenroe)
segmento(
x0=as.numeric(as.Date("1984-08-13", format = "%Y-%m-%d")),
x1=as.numeric(as.Date("1985-08-18", format = "%Y-%m-%d")),
y0=7.5,y1=7.6,col=mcenroe)
segmento(
x0=as.numeric(as.Date("1985-09-09", format = "%Y-%m-%d")),
x1=as.numeric(as.Date("1988-09-11", format = "%Y-%m-%d")),
y0=7.5,y1=7.6,col=lendl)
segmento(
x0=as.numeric(as.Date("1989-01-30", format = "%Y-%m-%d")),
x1=as.numeric(as.Date("1990-08-12", format = "%Y-%m-%d")),
y0=7.5,y1=7.6,col=lendl)
segmento(
x0=as.numeric(as.Date("1990-08-13", format = "%Y-%m-%d")),
x1=as.numeric(as.Date("1991-01-27", format = "%Y-%m-%d")),
y0=7.5,y1=7.6,col=edberg)
segmento(
x0=as.numeric(as.Date("1991-02-18", format = "%Y-%m-%d")),
x1=as.numeric(as.Date("1991-07-07", format = "%Y-%m-%d")),
y0=7.5,y1=7.6,col=edberg)
segmento(
x0=as.numeric(as.Date("1991-09-09", format = "%Y-%m-%d")),
x1=as.numeric(as.Date("1992-02-09", format = "%Y-%m-%d")),
y0=7.5,y1=7.6,col=edberg)
segmento(
x0=as.numeric(as.Date("1992-03-23", format = "%Y-%m-%d")),
x1=as.numeric(as.Date("1992-04-12", format = "%Y-%m-%d")),
y0=7.5,y1=7.6,col=edberg)
segmento(
x0=as.numeric(as.Date("1992-09-14", format = "%Y-%m-%d")),
x1=as.numeric(as.Date("1992-10-04", format = "%Y-%m-%d")),
y0=7.5,y1=7.6,col=edberg)
segmento(
x0=as.numeric(as.Date("1993-04-12", format = "%Y-%m-%d")),
x1=as.numeric(as.Date("1993-08-22", format = "%Y-%m-%d")),
y0=7.5,y1=7.6,col=sampras)
segmento(
x0=as.numeric(as.Date("1993-09-13", format = "%Y-%m-%d")),
x1=as.numeric(as.Date("1995-04-09", format = "%Y-%m-%d")),
y0=7.5,y1=7.6,col=sampras)
segmento(
x0=as.numeric(as.Date("1995-04-10", format = "%Y-%m-%d")),
x1=as.numeric(as.Date("1995-11-05", format = "%Y-%m-%d")),
y0=7.5,y1=7.6,col=aggasi)
segmento(
x0=as.numeric(as.Date("1995-11-06", format = "%Y-%m-%d")),
x1=as.numeric(as.Date("1996-01-28", format = "%Y-%m-%d")),
y0=7.5,y1=7.6,col=sampras)
segmento(
x0=as.numeric(as.Date("1996-01-29", format = "%Y-%m-%d")),
x1=as.numeric(as.Date("1996-02-11", format = "%Y-%m-%d")),
y0=7.5,y1=7.6,col=aggasi)
segmento(
x0=as.numeric(as.Date("1996-02-19", format = "%Y-%m-%d")),
x1=as.numeric(as.Date("1996-03-10", format = "%Y-%m-%d")),
y0=7.5,y1=7.6,col=sampras)
segmento(
x0=as.numeric(as.Date("1996-04-14", format = "%Y-%m-%d")),
x1=as.numeric(as.Date("1998-03-29", format = "%Y-%m-%d")),
y0=7.5,y1=7.6,col=sampras)
segmento(
x0=as.numeric(as.Date("1998-04-27", format = "%Y-%m-%d")),
x1=as.numeric(as.Date("1998-08-09", format = "%Y-%m-%d")),
y0=7.5,y1=7.6,col=sampras)
segmento(
x0=as.numeric(as.Date("1998-08-24", format = "%Y-%m-%d")),
x1=as.numeric(as.Date("1999-03-14", format = "%Y-%m-%d")),
y0=7.5,y1=7.6,col=sampras)
segmento(
x0=as.numeric(as.Date("1999-03-29", format = "%Y-%m-%d")),
x1=as.numeric(as.Date("1999-05-02", format = "%Y-%m-%d")),
y0=7.5,y1=7.6,col=sampras)
segmento(
x0=as.numeric(as.Date("1999-06-14", format = "%Y-%m-%d")),
x1=as.numeric(as.Date("1999-07-04", format = "%Y-%m-%d")),
y0=7.5,y1=7.6,col=sampras)
segmento(
x0=as.numeric(as.Date("1999-07-05", format = "%Y-%m-%d")),
x1=as.numeric(as.Date("1999-07-25", format = "%Y-%m-%d")),
y0=7.5,y1=7.6,col=aggasi)
segmento(
x0=as.numeric(as.Date("1999-08-02", format = "%Y-%m-%d")),
x1=as.numeric(as.Date("1999-09-12", format = "%Y-%m-%d")),
y0=7.5,y1=7.6,col=sampras)
segmento(
x0=as.numeric(as.Date("1999-09-13", format = "%Y-%m-%d")),
x1=as.numeric(as.Date("2000-09-10", format = "%Y-%m-%d")),
y0=7.5,y1=7.6,col=aggasi)
segmento(
x0=as.numeric(as.Date("2000-09-11", format = "%Y-%m-%d")),
x1=as.numeric(as.Date("2000-11-09", format = "%Y-%m-%d")),
y0=7.5,y1=7.6,col=sampras)
segmento(
x0=as.numeric(as.Date("2003-06-16", format = "%Y-%m-%d")),
x1=as.numeric(as.Date("2003-09-07", format = "%Y-%m-%d")),
y0=7.5,y1=7.6,col=aggasi)
segmento(
x0=as.numeric(as.Date("2004-02-02", format = "%Y-%m-%d")),
x1=as.numeric(as.Date("2008-08-17", format = "%Y-%m-%d")),
y0=7.5,y1=7.6,col=federer)
segmento(
x0=as.numeric(as.Date("2008-08-18", format = "%Y-%m-%d")),
x1=as.numeric(as.Date("2009-07-05", format = "%Y-%m-%d")),
y0=7.5,y1=7.6,col=nadal)
segmento(
x0=as.numeric(as.Date("2009-07-06", format = "%Y-%m-%d")),
x1=as.numeric(as.Date("2010-06-06", format = "%Y-%m-%d")),
y0=7.5,y1=7.6,col=federer)
segmento(
x0=as.numeric(as.Date("2010-06-07", format = "%Y-%m-%d")),
x1=as.numeric(as.Date("2011-07-03", format = "%Y-%m-%d")),
y0=7.5,y1=7.6,col=nadal)
segmento(
x0=as.numeric(as.Date("2011-07-04", format = "%Y-%m-%d")),
x1=as.numeric(as.Date("2012-07-08", format = "%Y-%m-%d")),
y0=7.5,y1=7.6,col=djokovic)
segmento(
x0=as.numeric(as.Date("2012-07-09", format = "%Y-%m-%d")),
x1=as.numeric(as.Date("2012-11-04", format = "%Y-%m-%d")),
y0=7.5,y1=7.6,col=federer)
segmento(
x0=as.numeric(as.Date("2012-11-05", format = "%Y-%m-%d")),
x1=as.numeric(as.Date("2013-10-06", format = "%Y-%m-%d")),
y0=7.5,y1=7.6,col=djokovic)
segmento(
x0=as.numeric(as.Date("2013-10-07", format = "%Y-%m-%d")),
x1=as.numeric(as.Date("2014-06-06", format = "%Y-%m-%d")),
y0=7.5,y1=7.6,col=nadal)
segmento(
x0=as.numeric(as.Date("2014-06-07", format = "%Y-%m-%d")),
x1=as.numeric(as.Date("2016-11-06", format = "%Y-%m-%d")),
y0=7.5,y1=7.6,col=djokovic)
segmento(
x0=as.numeric(as.Date("2017-08-21", format = "%Y-%m-%d")),
x1=as.numeric(as.Date("2018-02-18", format = "%Y-%m-%d")),
y0=7.5,y1=7.6,col=nadal)
segmento(
x0=as.numeric(as.Date("2018-02-19", format = "%Y-%m-%d")),
x1=as.numeric(as.Date("2018-04-01", format = "%Y-%m-%d")),
y0=7.5,y1=7.6,col=federer)
segmento(
x0=as.numeric(as.Date("2018-04-02", format = "%Y-%m-%d")),
x1=as.numeric(as.Date("2018-05-13", format = "%Y-%m-%d")),
y0=7.5,y1=7.6,col=nadal)
segmento(
x0=as.numeric(as.Date("2018-05-21", format = "%Y-%m-%d")),
x1=as.numeric(as.Date("2018-06-17", format = "%Y-%m-%d")),
y0=7.5,y1=7.6,col=nadal)
segmento(
x0=as.numeric(as.Date("2018-06-25", format = "%Y-%m-%d")),
x1=as.numeric(as.Date("2018-11-04", format = "%Y-%m-%d")),
y0=7.5,y1=7.6,col=nadal)
segmento(
x0=as.numeric(as.Date("2018-11-05", format = "%Y-%m-%d")),
x1=as.numeric(as.Date("2019-11-03", format = "%Y-%m-%d")),
y0=7.5,y1=7.6,col=djokovic)
segmento(
x0=as.numeric(as.Date("2019-11-04", format = "%Y-%m-%d")),
x1=as.numeric(as.Date("2020-02-02", format = "%Y-%m-%d")),
y0=7.5,y1=7.6,col=nadal)
segmento(
x0=as.numeric(as.Date("2020-02-03", format = "%Y-%m-%d")),
x1=as.numeric(as.Date("2020-03-22", format = "%Y-%m-%d")),
y0=7.5,y1=7.6,col=djokovic)
text(as.numeric(as.Date("1970-04-01", format = "%Y-%m-%d")),7.54,"ATP Ranking #1", cex=0.75)


#######################################
# end 
dev.off()
system(paste("pdfcrop -m '0 0 0 0'",paste0(nombre,".pdf") ,paste0(nombre,".pdf")))
setwd(oldwd)
par(oldpar, new=F)
#########################################
