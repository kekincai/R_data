library("dplyr", help, pos = 2, lib.loc = NULL)
library("ggplot2", help, pos = 2, lib.loc = NULL)
data(mpg)


setwd("/Users/kejincai/Downloads/R_data/src")

class.type <- read.csv("../data/class_type.csv", header = TRUE)
names(class.type) <- c("name", "type")
class.type

discrete.name <- class.type$name[class.type$type == "Discrete"]
continuous.name <- class.type$name[class.type$type == "continuous"]

save.bar.plot <- function(discrete.name, continuous.name) {
  for (dn1 in discrete.name) {
    for (dn2 in discrete.name[-which(discrete.name == dn1)]) {
      for(cn in continuous.name) {
        g <- ggplot(mpg, aes(x = get(dn1), y = get(cn), fill = get(dn2))) + 
          geom_bar(stat = "identity") + 
          labs(x = dn1, y = cn, fill = dn2)
        ggsave(filename = paste(dn1, dn2, cn, ".png", sep = "_"), plot = g, path = "../plot/discrete/bar")
      }
    }
  }
}

save.point.plot <- function(discrete.name, continuous.name) {
  for (dn1 in discrete.name) {
    for (dn2 in discrete.name[-which(discrete.name == dn1)]) {
      for(cn in continuous.name) {
        g <- ggplot(mpg, aes(x = get(dn1), y = get(cn), color = get(dn2))) + 
          geom_point() + 
          labs(x = dn1, y = cn, color = dn2)
        ggsave(filename = paste(dn1, dn2, cn, ".png", sep = "_"), plot = g, path = "../plot/discrete/point")
      }
    }
  }
}

# continuous ~ continuous
save.c.c.plot <- function(continuous.name) {
  for (dn1 in continuous.name) {
    for (dn2 in continuous.name[-which(continuous.name == dn1)]) {
        
        p <- ggplot(mpg, aes(x = get(dn1), y = get(dn2))) + 
          labs(x = dn1, y = dn2)
        
        g <- p + geom_point() 
        j <- p + geom_jitter() 
          
        ggsave(filename = paste(dn1, dn2, ".png", sep = "_"), plot = g, path = "../plot/continuous_continuous/point")
        ggsave(filename = paste(dn1, dn2, ".png", sep = "_"), plot = j, path = "../plot/continuous_continuous/jitter")
    }
  }
}

save.d.c.plot <- function(discrete.name, continuous.name) {
  for (dn1 in discrete.name) {
      for(cn in continuous.name) {
        
        p <- ggplot(mpg, aes(x = get(dn1), y = get(cn))) + 
          labs(x = dn1, y = cn)
        
        b <- p + geom_boxplot() 
        
        v <- p + geom_violin() 
        
        
        ggsave(filename = paste(dn1, cn, ".png", sep = "_"), plot = b, path = "../plot/discrete_continuous/boxplot")
        ggsave(filename = paste(dn1, cn, ".png", sep = "_"), plot = v, path = "../plot/discrete_continuous/violin")
      }
    }
}

#save.bar.plot(discrete.name, continuous.name)
#save.point.plot(discrete.name, continuous.name)
save.d.c.plot(discrete.name, continuous.name)

#ggplot(mpg, aes(manufacturer)) + geom_bar()
#ggplot(mpg, aes(manufacturer)) + geom_bar(colour = "fl")

#p <- ggplot(data=mpg, aes(x=class, y=displ, fill=drv))
#p + geom_bar(stat = "identity")


