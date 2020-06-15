library("dplyr", help, pos = 2, lib.loc = NULL)
library("ggplot2", help, pos = 2, lib.loc = NULL)
data(mpg)

class.type <- read.csv("../data/class_type.csv", header = TRUE)
names(class.type) <- c("name", "type")
class.type

discrete.name <- class.type$name[class.type$type == "Discrete"]
continuous.name <- class.type$name[class.type$type == "Discrete"]

save.discrete.plot <- function(discrete.name) {
  for (name in discrete.name) {
    for (sn in discrete.name[-which(discrete.name == name)]) {
      g <- ggplot(mpg, aes(x = name)) +
        geom_bar(colour = sn)
      ggsave(filename = paste(name, "_", sn, ".png", sep = ""), plot = g, path = "../plot/dicrete/")
    }
  }
}

save.discrete.plot(discrete.name)



