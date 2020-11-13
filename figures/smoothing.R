oldpar <- par(no.readonly = TRUE)
oldwd <- getwd()
this.dir <- dirname(parent.frame(2)$ofile)
nombre.R <-  sys.frame(1)$ofile
require(tools)
nombre <- print(file_path_sans_ext(nombre.R))
pdf(paste0(nombre,".pdf"), width = 8, height = 5  )
setwd(this.dir)
###############################

par(mar=c(2.5,0.5,0.5,0.5))

data = read.csv("data/smoothing.csv", stringsAsFactors=FALSE)
sigma0 <- 3.0
beta <- 0.5
ds <- 0.1
s <- seq(-sigma0*3 ,sigma0 *3,ds)
n <- 6#length(data$wp_a_1_mu)

iguales <- function(x,y,tol=1e-5){
  return(sum( data$lh_a_1_mu - (data$wp_b_1_mu + data$d_div_1_mu) > 1e-5) == 0)
}
v2 <- function(sigma, beta=0.5){
  return(sigma^2 + 2*beta^2)
} 
mu_x <- function(mu, sigma){
  s2 <- sigma^2
  return((mu[1]*s2[2] + mu[2]*s2[1])/sum(s2))
}
sigma_x <- function(sigma){
  s2 <- sigma^2
  return(sqrt(s2[1]*s2[2]/(s2[1]+s[2])) )
}

# L_a_1
iguales( data$lh_a_1_mu , (data$wp_b_1_mu + data$d_div_1_mu) )
iguales( data$lh_a_1_sigma , sqrt(v2(data$wp_b_1_sigma) + data$d_div_1_sigma) )

# W_a_2
iguales( data$wp_a_2_mu[1] , mu_x( mu=c(data$lh_a_1_mu[1],0),sigma = c(data$lh_a_1_mu[1],sigma0)) )
iguales( data$wp_a_2_sigma[1] , sigma_x( c(data$lh_a_1_mu[1],sigma0)) )

data$wp_a_2_mu < data$wp_b_1_mu + data$d_div_1_mu

# A1
# Post
plot(s,dnorm(s, data$p_a_1_mu[n], data$p_a_1_sigma[n]),type="l"
     ,ylim=c(0,max(dnorm(s, data$p_a_2_mu[n], data$p_a_2_sigma[n]))),axes = F, ann = F, lwd=3)
axis(side=1, labels=NA,cex.axis=0.6,tck=0.015, line=0)
axis(lwd=0,side=1, at=0,cex.axis=6,line=2,tck=0.015)
for (i in seq(1,n-1)){
  lines(s,dnorm(s, data$p_a_1_mu[i], data$p_a_1_sigma[i]), lwd=3,col=rgb(0,0,0,((i/n)+0.5)/1.5 )) 
}
abline(v=0, lty=3)
# within
plot(s,dnorm(s, data$wp_a_1_mu[n], data$wp_a_1_sigma[n]),type="l"
     ,ylim=c(0,max(dnorm(s, data$p_a_2_mu[n], data$p_a_2_sigma[n]))),axes = F, ann = F, lwd=3)
axis(side=1, labels=NA,cex.axis=0.6,tck=0.015, line=0)
axis(lwd=0,side=1, at=0,cex.axis=6,line=2,tck=0.015)
for (i in seq(1,n-1)){
  lines(s,dnorm(s, data$wp_a_1_mu[i], data$wp_a_1_sigma[i]), lwd=3,col=rgb(0,0,0,((i/n)+0.5)/1.5 )) 
}
abline(v=0, lty=3)
# Likelihood approx
plot(s,dnorm(s, data$lh_a_1_mu[n], data$lh_a_1_sigma[n]),type="l"
     ,ylim=c(0,max(dnorm(s, data$p_a_2_mu[n], data$p_a_2_sigma[n])))
     ,axes = F, ann = F, lwd=3)
axis(side=1, labels=NA,cex.axis=0.6,tck=0.015, line=0)
axis(lwd=0,side=1, at=0,cex.axis=6,line=2,tck=0.015)
for (i in seq(1,n-1)){
  lines(s,dnorm(s, data$lh_a_1_mu[i], data$lh_a_1_sigma[i]), lwd=3,col=rgb(0,0,0,((i/n)+0.5)/1.5 )) 
}
abline(v=0, lty=3)
# A2
# Post
plot(s,dnorm(s, data$p_a_2_mu[n], data$p_a_2_sigma[n]),type="l"
     ,ylim=c(0,max(dnorm(s, data$p_a_2_mu[n], data$p_a_2_sigma[n]))),axes = F, ann = F, lwd=3)
axis(side=1, labels=NA,cex.axis=0.6,tck=0.015, line=0)
axis(lwd=0,side=1, at=0,cex.axis=6,line=2,tck=0.015)
for (i in seq(1,n-1)){
  lines(s,dnorm(s, data$p_a_2_mu[i], data$p_a_2_sigma[i]), lwd=3,col=rgb(0,0,0,((i/n)+0.5)/1.5 )) 
}
abline(v=0,lty=3)
# within
plot(s,dnorm(s, data$wp_a_2_mu[n], data$wp_a_2_sigma[n]),type="l"
     ,ylim=c(0,max(dnorm(s, data$p_a_2_mu[n], data$p_a_2_sigma[n]))),axes = F, ann = F, lwd=3)
axis(side=1, labels=NA,cex.axis=0.6,tck=0.015, line=0)
axis(lwd=0,side=1, at=0,cex.axis=6,line=2,tck=0.015)
for (i in seq(1,n-1)){
  lines(s,dnorm(s, data$wp_a_2_mu[i], data$wp_a_2_sigma[i]), lwd=3,col=rgb(0,0,0,((i/n)+0.5)/1.5 )) 
}
abline(v=0, lty=3)
# Likelihood approx
plot(s,dnorm(s, data$lh_a_2_mu[n], data$lh_a_2_sigma[n]),type="l"
     ,ylim=c(0,max(dnorm(s, data$p_a_2_mu[n], data$p_a_2_sigma[n])))
     ,axes = F, ann = F, lwd=3)
axis(side=1, labels=NA,cex.axis=0.6,tck=0.015, line=0)
axis(lwd=0,side=1, at=0,cex.axis=6,line=2,tck=0.015)
for (i in seq(1,n-1)){
  lines(s,dnorm(s, data$lh_a_2_mu[i], data$lh_a_2_sigma[i]), lwd=3,col=rgb(0,0,0,((i/n)+0.5)/1.5 )) 
}
abline(v=0, lty=3)
# B1
# Post
plot(s,dnorm(s, data$p_b_1_mu[n], data$p_b_1_sigma[n]),type="l"
     ,ylim=c(0,max(dnorm(s, data$p_a_2_mu[n], data$p_a_2_sigma[n]))),axes = F, ann = F, lwd=3)
axis(side=1, labels=NA,cex.axis=0.6,tck=0.015, line=0)
axis(lwd=0,side=1, at=0,cex.axis=6,line=2,tck=0.015)
for (i in seq(1,n-1)){
  lines(s,dnorm(s, data$p_b_1_mu[i], data$p_b_1_sigma[i]), lwd=3,col=rgb(0,0,0,((i/n)+0.5)/1.5 )) 
}
abline(v=0, lty=3)
# within
plot(s,dnorm(s, data$wp_b_1_mu[n], data$wp_b_1_sigma[n]),type="l"
     ,ylim=c(0,max(dnorm(s, data$p_a_2_mu[n], data$p_a_2_sigma[n]))),axes = F, ann = F, lwd=3)
axis(side=1, labels=NA,cex.axis=0.6,tck=0.015, line=0)
axis(lwd=0,side=1, at=0,cex.axis=6,line=2,tck=0.015)
for (i in seq(1,n-1)){
  lines(s,dnorm(s, data$wp_b_1_mu[i], data$wp_b_1_sigma[i]), lwd=3,col=rgb(0,0,0,((i/n)+0.5)/1.5 )) 
}
abline(v=0, lty=3)
# Likelihood approx
plot(s,dnorm(s, data$lh_b_1_mu[n], data$lh_b_1_sigma[n]),type="l"
     ,ylim=c(0,max(dnorm(s, data$p_a_2_mu[n], data$p_a_2_sigma[n])))
     ,axes = F, ann = F, lwd=3)
axis(side=1, labels=NA,cex.axis=0.6,tck=0.015, line=0)
axis(lwd=0,side=1, at=0,cex.axis=6,line=2,tck=0.015)
for (i in seq(1,n-1)){
  lines(s,dnorm(s, data$lh_b_1_mu[i], data$lh_b_1_sigma[i]), lwd=3,col=rgb(0,0,0,((i/n)+0.5)/1.5 )) 
}
abline(v=0, lty=3)
# B2
# Post
plot(s,dnorm(s, data$p_b_2_mu[n], data$p_b_2_sigma[n]),type="l"
     ,ylim=c(0,max(dnorm(s, data$p_a_2_mu[n], data$p_a_2_sigma[n]))),axes = F, ann = F, lwd=3)
axis(side=1, labels=NA,cex.axis=0.6,tck=0.015, line=0)
axis(lwd=0,side=1, at=0,cex.axis=6,line=2,tck=0.015)
for (i in seq(1,n-1)){
  lines(s,dnorm(s, data$p_b_2_mu[i], data$p_b_2_sigma[i]), lwd=3,col=rgb(0,0,0,((i/n)+0.5)/1.5 )) 
}
abline(v=0, lty=3)
# within
plot(s,dnorm(s, data$wp_b_2_mu[n], data$wp_b_2_sigma[n]),type="l"
     ,ylim=c(0,max(dnorm(s, data$p_a_2_mu[n], data$p_a_2_sigma[n]))),axes = F, ann = F, lwd=3)
axis(side=1, labels=NA,cex.axis=0.6,tck=0.015, line=0)
axis(lwd=0,side=1, at=0,cex.axis=6,line=2,tck=0.015)
for (i in seq(1,n-1)){
  lines(s,dnorm(s, data$wp_b_2_mu[i], data$wp_b_2_sigma[i]), lwd=3,col=rgb(0,0,0,((i/n)+0.5)/1.5 )) 
}
abline(v=0, lty=3)
# Likelihood approx
plot(s,dnorm(s, data$lh_b_2_mu[n], data$lh_b_2_sigma[n]),type="l"
     ,ylim=c(0,max(dnorm(s, data$p_a_2_mu[n], data$p_a_2_sigma[n])))
     ,axes = F, ann = F, lwd=3)
axis(side=1, labels=NA,cex.axis=0.6,tck=0.015, line=0)
axis(lwd=0,side=1, at=0,cex.axis=6,line=2,tck=0.015)
for (i in seq(1,n-1)){
  lines(s,dnorm(s, data$lh_b_2_mu[i], data$lh_b_2_sigma[i]), lwd=3,col=rgb(0,0,0,((i/n)+0.5)/1.5 )) 
}
abline(v=0, lty=3)
# Prior
plot(s,dnorm(s, 0, sigma0) , type="l",
     ylim=c(0,max(dnorm(s, data$p_a_2_mu[n], data$p_a_2_sigma[n]))), axes = F, ann = F, lwd=3)
axis(side=1, labels=NA,cex.axis=0.6,tck=0.015, line=0)
axis(lwd=0,side=1, at=0,cex.axis=6,line=2,tck=0.015)

#######################################
# end 
dev.off()
setwd(oldwd)
par(oldpar, new=F)
#########################################
