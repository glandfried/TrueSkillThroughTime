oldpar <- par(no.readonly = TRUE)
oldwd <- getwd()
this.dir <- dirname(parent.frame(2)$ofile)
nombre.R <-  sys.frame(1)$ofile
require(tools)
nombre <- print(file_path_sans_ext(nombre.R))
pdf(paste0(nombre,".pdf"), width = 8, height = 5  )
setwd(this.dir)
###############################

basic = read.csv("data/atp_optimization_zoom.csv", stringsAsFactors=FALSE)

colnames(basic)

rows = basic[,1]
cols = seq(1.0,5.0,0.25)
cols = seq(1.0,2.0,0.05)
basic = data.matrix(basic[,-1])

model_evidence <- function(log_ev){
    n = dim(log_ev)[1] * dim(log_ev)[2]
    lp = log(1/n)
    propotional_log_posterior = log_ev + lp #  log p(D|M) + log P(M)  el posterior proporcional
    c  = max(log_ev + lp) # Constante
    propotional_log_posterior = propotional_log_posterior  - c #
    model_posterior = exp(propotional_log_posterior)/sum(exp(propotional_log_posterior))
    return(model_posterior )
}


pmat <- persp(model_evidence(basic) ,theta=230,phi=20, xlab="Gamma", ylab="Sigma", zlab="Model probability",cex.lab=1.5)

# tick.start <- trans3d(rows, 1,0, 0.0, pmat)
# tick.end   <- trans3d(rows, 1,0-0.2, 0.0, pmat)
# segments(tick.start$x, tick.start$y, tick.end$x, tick.end$y)


image(rows,cols,model_evidence(basic))
contour(rows,cols,model_evidence(basic), add=T)

#######################################
# end 
dev.off()
system(paste("pdfcrop -m '0 0 0 0'",paste0(nombre,".pdf") ,paste0(nombre,".pdf")))
setwd(oldwd)
par(oldpar, new=F)
#########################################
