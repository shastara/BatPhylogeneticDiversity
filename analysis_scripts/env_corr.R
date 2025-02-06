library(Hmisc)

#import data
data <- read.csv("bat_env_geo-NoNA.csv")
#remove first column
dataNoRegion <- data[,2:242]

#calculate correlation matrix
corrTable <- rcorr(as.matrix(dataNoRegion))

#load function at the bottom of the script
#flattening correlation matrix
flatMat <- flattenCorrMatrix(corrTable$r, corrTable$P)

#write flattened table to file
write.csv(flatMat, file = "bat_env_corr.csv", quote=F, row.names=F, col.names=!file.exists("bat_env_corr2.csv"), append=T, sep=",")

# ++++++++++++++++++++++++++++
# flattenCorrMatrix
# ++++++++++++++++++++++++++++
# cormat : matrix of the correlation coefficients
# pmat : matrix of the correlation p-values
flattenCorrMatrix <- function(cormat, pmat) {
  ut <- upper.tri(cormat)
  data.frame(
    row = rownames(cormat)[row(cormat)[ut]],
    column = rownames(cormat)[col(cormat)[ut]],
    cor  =(cormat)[ut],
    p = pmat[ut]
  )
}
