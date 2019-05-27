library(ggplot2)
library(data.table)
library(ggthemes)
df <- fread('Economist_Assignment_Data.csv', drop=1)
pl <- ggplot(df,aes(x=CPI,y=HDI,color=Region)) + geom_point(size=4,shape=1)
#pl <- ggplot(df,aes(x=CPI,y=HDI)) + geom_point(aes(color=factor(Region)))
#print(pl)
#aes - aesthetics (what am i plotting from data)
pl2 <- pl + geom_smooth(aes(group=1),method='lm',formula = y~log(x),color='red')
#print(pl2)
#pl3 <- pl2 + geom_text(aes(label=Country))
#print(pl3)
pointsToLabel <- c("Russia", "Venezuela", "Iraq", "Myanmar", "Sudan",
                   "Afghanistan", "Congo", "Greece", "Argentina", "Brazil",
                   "India", "Italy", "China", "South Africa", "Spane",
                   "Botswana", "Cape Verde", "Bhutan", "Rwanda", "France",
                   "United States", "Germany", "Britain", "Barbados", "Norway", "Japan",
                   "New Zealand", "Singapore")

pl3 <- pl2 + geom_text(aes(label = Country), color = "gray20", 
                       data = subset(df, Country %in% pointsToLabel),check_overlap = TRUE)

#print(pl3+theme_economist_white())
pl4 <- pl3 + scale_x_continuous(limits=c(.9,10.5),breaks=1:10)
print(pl4)
