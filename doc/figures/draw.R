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

par(mar=c(5,3.75,.75,.75))

sigma <- 3
mu <- 2
epsilon <- 1

D <- seq(mu-3*sigma,mu+3*sigma,0.1)
dnormal <- dnorm(D,mu,sigma)
plot(D,dnormal, type="l",lwd=1, xlab=expression(delta),axes = F,ann = F)

axis(side=2, labels=NA,cex.axis=0.6,tck=0.015)
axis(side=1, labels=NA,cex.axis=0.6,tck=0.015)
axis(lwd=0,side=1, at=0,las=0,cex.axis=1.75,line=-0.45)
axis(lwd=1,side=1, at=mu,labels=expression(delta) ,las=0,cex.axis=2,line=-0.3)
axis(lwd=0,side=1, at=-epsilon*1.3,labels=expression(-epsilon) ,las=0,cex.axis=2.33,line=-0.45)

mtext(text ="Density" ,side =2 ,line=1,cex=1.75)
abline(v=0,lty=3)

base <- rep(0,length(D))
xx <- c(D[D>=epsilon],rev(D[D>=epsilon]))
yy <- c(base[D>=epsilon],rev(dnormal[D>=epsilon]) )
polygon(xx,yy,col=rgb(0.2,0.9,0.2,0.4))
base <- rep(0,length(D))

base <- rep(0,length(D))
xx <- c(D[D<=-epsilon],rev(D[D<=-epsilon]))
yy <- c(base[D<=-epsilon],rev(dnormal[D<=-epsilon]) )
polygon(xx,yy,col=rgb(0.9,0.2,0.2,0.4))

text(-epsilon-1.2,0.025,"Lose",cex=1.75)
text(0,0.025,"Draw",cex=1.75)
text(epsilon+1.4,0.025,"Win",cex=1.75)

###### PLOT 2

max_sigma <- 3
max_density <- dnorm(0)

sigma <- 1
mu <- 0
D <- seq(mu-3*max_sigma,mu+3*max_sigma,0.1)
draw_proba <- 0.25
epsilon <- abs(qnorm(0.5-draw_proba/2,mean=mu,sd =sigma))

dnormal <- dnorm(D,mu,sigma)
plot(D,dnormal, type="l",lwd=1, axes = F,ann = F)
axis(side=2, labels=NA,cex.axis=0.6,tck=0.015)
axis(side=1, labels=NA,cex.axis=0.6,tck=0.015)
axis(lwd=0,side=1, at=0,las=0,cex.axis=1.33,line=-0.6)
mtext(text ="Density" ,side =2 ,line=1,cex=1.75)

base <- rep(0,length(D))
xx <- c(D[D>=-epsilon & D<=epsilon],rev(D[D>=-epsilon & D<=epsilon]))
yy <- c(base[D>=-epsilon & D<=epsilon],rev(dnormal[D>=-epsilon & D<=epsilon]) )
polygon(xx,yy,col=rgb(0.2,0.6,0.6,0.33))

sigma <- 3
dnormal <- dnorm(D,mu,sigma)
lines(D,dnormal, type="l",lwd=1)
epsilon <- abs(qnorm(0.5-draw_proba/2,mean=mu,sd =sigma))
base <- rep(0,length(D))
xx <- c(D[D>=-epsilon & D<=epsilon],rev(D[D>=-epsilon & D<=epsilon]))
yy <- c(base[D>=-epsilon & D<=epsilon],rev(dnormal[D>=-epsilon & D<=epsilon]) )
polygon(xx,yy,col=rgb(0.8,0.7,0,0.33))

#######################################
# end 
dev.off()
system(paste("pdfcrop -m '0 0 0 0'",paste0(nombre,".pdf") ,paste0(nombre,".pdf")))
setwd(oldwd)
par(oldpar, new=F)
#########################################