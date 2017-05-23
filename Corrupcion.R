#######################################################################################
##CORRUPCIÓN
#######################################################################################

library(foreign)

Base1 <- read.dbf('~/Dropbox/ENCIG/Bases/Encig2013_03_sec_6_8.DBF')

#####################
## A - Personas con contacto directo con un servidor público
#####################
Base1P6_3A <- Base1$P6_3A

BaseChar6_3A <- as.character(Base1P6_3A)
BaseNum6_3A <- as.numeric(BaseChar6_3A)
BaseNum6_3A[is.na(BaseNum6_3A)] <- 0

#####sum(BaseNum6_3A * Base1$FAC_P18)

BaseP6_3A <- ifelse(BaseNum6_3A %in% c('1','2','3','4','5','6','7','8','9','10','11','12','13','14','15','16','17','18','19','20','21','22','23','24','25','26','28','30','32','33', '35','40','42','44','45','48','50','55','60','66','80','90','96','99'),1,0)

######################
## B - Personas que tuvieron alguna experiencia de corrupción
######################

Base1P8_7 <- Base1$P8_7
BaseChar8_7 <- as.character(Base1P8_7)
BaseNum8_7 <- as.numeric(BaseChar8_7)
BaseNum8_7[is.na(BaseNum8_7)] <- 0

######################
##Relación entre A y B
######################
tasa <- (sum(Base1$FAC_P18 * BaseNum8_7)/sum(Base1$FAC_P18 * BaseP6_3A))*100
tasa



######################

rm(list = ls())
