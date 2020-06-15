library("dplyr", help, pos = 2, lib.loc = NULL)
library("ggplot2", help, pos = 2, lib.loc = NULL)
data(mpg)


setwd("/Users/kejincai/Downloads/R_data/src")

class.type <- read.csv("../data/class_type.csv", header = TRUE)
names(class.type) <- c("name", "type")
class.type

discrete.name <- class.type$name[class.type$type == "Discrete"]
continuous.name <- class.type$name[class.type$type == "continuous"]

save.discrete.plot <- function(discrete.name) {
  for (name in discrete.name) {
    for (sn in discrete.name[-which(discrete.name == name)]) {
      g <- ggplot(mpg, aes(x = name)) +
        geom_bar() 
      ggsave(filename = paste(name, "_", sn, ".png", sep = ""), plot = g, path = "../plot/dicrete/")
    }
  }
}

save.discrete.plot2 <- function(discrete.name, continuous.name) {
  for (dn1 in discrete.name) {
    for (dn2 in discrete.name[-which(discrete.name == dn1)]) {
      for(cn in continuous.name) {
        g <- ggplot(mpg, aes(x = dn1, y =cn, fill = dn2)) + geom_bar(stat = "identity")
        ggsave(filename = paste(dn1, dn2, cn, ".png", sep = "_"), plot = g)
      }
    }
  }
}

save.discrete.plot3 <- function(discrete.name, continuous.name) {
  for (dn1 in discrete.name) {
    for (dn2 in discrete.name[-which(discrete.name == dn1)]) {
      for(cn in continuous.name) {
        g <- ggplot(mpg, aes(x = get(dn1), y = get(cn), fill = get(dn2))) + 
          geom_bar(stat = "identity") + 
          labs(x = dn1, y = cn)
        ggsave(filename = paste(dn1, dn2, cn, ".png", sep = "_"), plot = g, path = "../plot/discrete")
      }
    }
  }
}

save.discrete.plot3(discrete.name, continuous.name)

#ggplot(mpg, aes(manufacturer)) + geom_bar()
#ggplot(mpg, aes(manufacturer)) + geom_bar(colour = "fl")

#p <- ggplot(data=mpg, aes(x=class, y=displ, fill=drv))
#p + geom_bar(stat = "identity")


