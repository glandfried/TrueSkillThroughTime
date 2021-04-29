oldpar <- par(no.readonly = TRUE)
oldwd <- getwd()
this.dir <- dirname(parent.frame(2)$ofile)
nombre.R <-  sys.frame(1)$ofile
require(tools)
nombre <- print(file_path_sans_ext(nombre.R))
pdf(paste0(nombre,".pdf"), width = 8, height = 5  )
setwd(this.dir)
###############################

data = read.csv("data/prior_predictions.csv", stringsAsFactors=FALSE)

plot(data$loocv_hat - data$p_d_m, type="l",lwd=3, axes = F,ann = F , ylim=c(-10, 0.3), col=rgb(0.2,0.2,0.66,0.8))
lines(data$p_d_m_hat - data$p_d_m,lwd=3, col=rgb(0.2,0.66,0.2,0.8)) 
lines(data$p_d_m_trueskill - data$p_d_m,lwd=3, col=rgb(0.66,0.2,0.2,0.8)) 

axis(side=2, labels=NA,cex.axis=0.6,tck=0.015)
axis(side=1, labels=NA,cex.axis=0.6,tck=0.015)
axis(lwd=0,side=1, las=0,cex.axis=1.5,line=-0.45)
axis(lwd=0,side=2,cex.axis=1.5,line=-0.45)

mtext(text = "log prior prediction",side =2 ,line=2,cex=1.75)
mtext(text = "Events" ,side =1 ,line=2,cex=1.75)

legend(15, -7.5, pch=19,legend = c(expression(widehat(LOOCV)),expression(widehat("P(D|M)")),"TrueSkill"),bty = "n",cex = 1.25, title = "Difference between exact solution and:", ncol=3, col=c(rgb(0.2,0.2,0.66,0.8),rgb(0.2,0.66,0.2,0.8),col=rgb(0.66,0.2,0.2,0.8)))


#######################################
# end 
dev.off()
system(paste("pdfcrop -m '0 0 0 0'",paste0(nombre,".pdf") ,paste0(nombre,".pdf")))
setwd(oldwd)
par(oldpar, new=F)
#########################################
