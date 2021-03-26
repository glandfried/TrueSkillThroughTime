oldpar <- par(no.readonly = TRUE)
oldwd <- getwd()
this.dir <- dirname(parent.frame(2)$ofile)
nombre.R <-  sys.frame(1)$ofile
require(tools)
nombre <- print(file_path_sans_ext(nombre.R))
pdf(paste0(nombre,".pdf"), width = 8, height = 5  )
setwd(this.dir)
###############################

basic = read.csv("data/atp_optimization.csv", stringsAsFactors=FALSE)

rows = basic[,1]
cols = seq(0.3,1.2,0.1)

basic = data.matrix(basic[,-1])
rows 

min(basic)
which.max(basic[,dim(basic)[2]])

persp(basic,theta=20,phi=20)
image(rows,cols,basic)
contour(rows,cols,basic, add=T)

#######################################
# end 
dev.off()
system(paste("pdfcrop -m '0 0 0 0'",paste0(nombre,".pdf") ,paste0(nombre,".pdf")))
setwd(oldwd)
par(oldpar, new=F)
#########################################
