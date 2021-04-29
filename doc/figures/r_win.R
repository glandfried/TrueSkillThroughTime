###########################################
# Header
oldpar <- par(no.readonly = TRUE)
oldwd <- getwd()
this.dir <- dirname(parent.frame(2)$ofile)
nombre.R <-  sys.frame(1)$ofile
require(tools)
nombre <- print(file_path_sans_ext(nombre.R))
pdf(paste0(nombre,".pdf"), width = 8, height = 5  )
setwd(this.dir)
#setwd("~/gaming/materias/inferencia_bayesiana/trabajoFinal/imagenes")
#####################################
par(mar=c(3.75,3.75,0.25,0.25))


beta <- 2000/7
s_1 <- 2000
s_2 <- 1750
tb <-  s_1+s_2

ta <- s_1 + s_2 + 250
D <- ( -1200+ta):(1200+ta)
dnormal <- dnorm(D,ta,beta)
plot(D,dnormal, type="l",lwd=1, xlab=expression(P[1]-P[2]),axes = F,ann = F)

axis(side=2, labels=NA,cex.axis=0.6,tck=0.015)
axis(side=1, labels=NA,cex.axis=0.6,tck=0.015)
axis(lwd=0,side=1, at=0,las=0,cex.axis=1.33,line=-0.6)
axis(lwd=1,side=1, at=ta,labels=expression("("~mu[i]-mu[j]~")") ,las=0,cex.axis=1.33,line=0)
axis(lwd=1,side=1, at=tb,labels=0 ,las=0,cex.axis=1.33,line=-0.3)


mtext(text ="Density" ,side =2 ,line=1,cex=1.75)
mtext(text ="Difference" ,side =1 ,line=2.5,cex=1.75)
abline(v=ta,lty=3)

base <- rep(0,length(D))
xx <- c(D[D>=tb],rev(D[D>=tb]))
yy <- c(base[D>=tb],rev(dnormal[D>=tb]) )
polygon(xx,yy,col=rgb(0,0,0,0.35))

mid <- length(D)%/%2
h <- dnormal[mid]/4
text(D[mid],h, expression(d>0), col = 1, cex=1.75)



plot(D,dnormal, type="l",lwd=1, xlab=expression(P[1]-P[2]),axes = F,ann = F)

axis(side=2, labels=NA,cex.axis=0.6,tck=0.015)
axis(side=1, labels=NA,cex.axis=0.6,tck=0.015)
axis(lwd=0,side=1, at=0,las=0,cex.axis=1.33,line=-0.6)
axis(lwd=1,side=1, at=ta,labels=expression("("~mu[i]-mu[j]~")") ,las=0,cex.axis=1.33,line=0)
axis(lwd=1,side=1, at=tb,labels=0 ,las=0,cex.axis=1.33,line=-0.3)


mtext(text ="Densidad" ,side =2 ,line=1,cex=1.75)
mtext(text ="Diferencia" ,side =1 ,line=2.5,cex=1.75)
abline(v=ta,lty=3)

base <- rep(0,length(D))
xx <- c(D[D>=tb],rev(D[D>=tb]))
yy <- c(base[D>=tb],rev(dnormal[D>=tb]) )
polygon(xx,yy,col=rgb(0,0,0,0.35))

mid <- length(D)%/%2
h <- dnormal[mid]/4
text(D[mid],h, expression(d>0), col = 1, cex=1.75)


#######################################
# end 
dev.off()
system(paste("pdfcrop -m '0 0 0 0'",paste0(nombre,".pdf") ,paste0(nombre,".pdf")))
setwd(oldwd)
par(oldpar, new=F)
#########################################