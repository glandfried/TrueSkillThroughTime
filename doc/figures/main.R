args <- commandArgs(trailingOnly = TRUE)

if (length(args)>0){
  files <- args
}else{
  files <- list.files(pattern = "\\.R")
  files <- files[files != "main.R"]
}

for (f in files){
  source(f)
} 
