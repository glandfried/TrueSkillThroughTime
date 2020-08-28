oldpar <- par(no.readonly = TRUE)
oldwd <- getwd()
this.dir <- dirname(parent.frame(2)$ofile)
nombre.R <-  sys.frame(1)$ofile
require(tools)
nombre <- print(file_path_sans_ext(nombre.R))
pdf(paste0(nombre,".pdf"), width = 8, height = 5  )
setwd(this.dir)
###############################

par(mar=c(3.75,3.75,0.25,0.25))

data = read.csv("data/same_strength_two_groups.csv", stringsAsFactors=FALSE)

means <-  as.matrix(data[,c("mu_a_ttt","mu_b_ttt","mu_c_ttt","mu_ai_ttt","mu_bi_ttt","mu_ci_ttt")])
sds <-  as.matrix(data[,c("sigma_a_ttt","sigma_b_ttt","sigma_c_ttt","sigma_ai_ttt","sigma_bi_ttt","sigma_ci_ttt")])
means <- means - mean(means)


plot(means[,"mu_a_ttt"], type="l", axes = F, ann = F, ylim = c( min(means), max(means)  ), lwd=2 )
points(means[,"mu_a_ttt"],pch=19,cex=0.75)
lines(means[,"mu_b_ttt"]); points(means[,"mu_b_ttt"],pch=19,cex=0.5)
lines(means[,"mu_c_ttt"]); points(means[,"mu_c_ttt"],pch=19,cex=0.5)
lines(means[,"mu_ai_ttt"],lwd=2); points(means[,"mu_ai_ttt"],pch=19,cex=0.75)
lines(means[,"mu_bi_ttt"]);points(means[,"mu_bi_ttt"],pch=19,cex=0.5)
lines(means[,"mu_ci_ttt"]);points(means[,"mu_ci_ttt"],pch=19,cex=0.5)
axis(side=2, labels=NA,at=c(-0.5/2,0.5/2),cex.axis=0.6,tck=0.05, line=0.5,lwd=2)
axis(lwd=0,side=2, at=0, labels="75% with uncertainty",cex.axis=1.85,line=-0.1)

segments(x0=1.3, y0=-0.3375/2, y1=0.3375/2,lwd=4)
segments(x0=1.32, x1=1.28, y0=-0.3375/2,lwd=4)
segments(x0=1.32, x1=1.28, y0= 0.3375/2,lwd=4)
text(2.6,0,"Scale: 75% probability of winning",cex=2.25)

means_ts <-  as.matrix(data[,c("mu_a_ts","mu_b_ts","mu_c_ts","mu_ai_ts","mu_bi_ts","mu_ci_ts")])
means_ts <- means_ts - mean(means_ts)
plot(means_ts[,"mu_a_ts"], type="l", axes = F, ann = F, ylim = c( min(means_ts), max(means_ts)  ), lwd=2 )
points(means_ts[,"mu_a_ts"],pch=19,cex=0.75)
lines(means_ts[,"mu_b_ts"]); points(means_ts[,"mu_b_ts"],pch=19,cex=0.5)
lines(means_ts[,"mu_c_ts"]); points(means_ts[,"mu_c_ts"],pch=19,cex=0.5)
axis(side=2, labels=NA,at=seq(-1.75,2.25,0.5),cex.axis=0.6,tck=0.05, line=0.5,lwd=2, col="white")
axis(lwd=0,side=2, at=0.25, labels="75% without uncertainty",cex.axis=1.85,line=-0.1, col.axis="white")

segments(x0=1.4, y0=-0.3375/2 + 2, y1=0.3375/2 + 2,lwd=4)
segments(x0=1.42, x1=1.38, y0=-0.3375/2 + 2,lwd=4)
segments(x0=1.42, x1=1.38, y0= 0.3375/2 + 2,lwd=4)
text(2.73,2,"Scale: 75% probability of winning",cex=2.25)




#######################################
# end 
dev.off()
system(paste("pdfcrop -m '0 0 0 0'",paste0(nombre,".pdf") ,paste0(nombre,".pdf")))
setwd(oldwd)
par(oldpar, new=F)
#########################################
