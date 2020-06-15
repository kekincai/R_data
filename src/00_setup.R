library("ggplot2", help, pos = 2, lib.loc = NULL)
data(mpg)
#class.type <- data.frame(data = mpg, type = sapply(mpg, class))

class.type <- sapply(mpg, class)

class.type <- gsub("character", "discrete", class.type)
class.type <- gsub("(numeric)|(integer)", "continuous", class.type)
class.type
write.csv(class.type, "../data/class_type.csv")

dir.create("../plot/discrete")
dir.create("../plot/continuous")


