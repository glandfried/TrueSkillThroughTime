oldpar <- par(no.readonly = TRUE)
oldwd <- getwd()
this.dir <- dirname(parent.frame(2)$ofile)
nombre.R <-  sys.frame(1)$ofile
require(tools)
nombre <- print(file_path_sans_ext(nombre.R))
pdf(paste0(nombre,".pdf"), width = 8, height = 5  )
setwd(this.dir)
###############################


data = read.csv("data/logisitc.csv", stringsAsFactors=FALSE)

graficar <- function(xlab,ylab,legend1, legend2){
    plot(data$true, type="l",lwd=3, axes = F,ann = F )
    lines(data$mu, lty=2)
    polygon(c(seq(1000),rev(seq(1000))),c(data$mu+data$sigma,rev(data$mu-data$sigma)),border=F, col=rgb(0,0,0,0.2))
    polygon(c(seq(1000),rev(seq(1000))),c(data$mu+2*data$sigma,rev(data$mu-2*data$sigma)),border=F, col=rgb(0,0,0,0.2))

    axis(side=2, labels=NA,cex.axis=0.6,tck=0.015)
    axis(side=1, labels=NA,cex.axis=0.6,tck=0.015)
    axis(lwd=0,side=1, las=0,cex.axis=1.75,line=-0.45)
    axis(lwd=0,side=2,cex.axis=1.75,line=-0.45)

    mtext(text =ylab ,side =2 ,line=2,cex=1.75)
    mtext(text =xlab ,side =1 ,line=2,cex=1.75)


    legend(0, 2, lwd=c(3,1.5), lty=c(1,2),
        legend = c(legend1,legend2),bty = "n",cex = 1.5)
}
graficar("Events", "Skill", "True", "Estimated")
graficar("Eventos", "Habilidad", "Verdadera", "Estimada")




#######################################
# end 
dev.off()
system(paste("pdfcrop -m '0 0 0 0'",paste0(nombre,".pdf") ,paste0(nombre,".pdf")))
setwd(oldwd)
par(oldpar, new=F)
#########################################
