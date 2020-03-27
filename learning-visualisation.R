library(ggplot2)
library(ggplot2movies)
library(hexbin)
library(ggthemes)
library(plotly)

#histogram
ggplot(movies,aes(x=rating))+
  geom_histogram(bindwidth=0.1,color='red',fill='pink',alpha=0.4)+
  xlab('Movie Rating')+
  ylab('Count')+
  ggtitle('MY TITLE')

#scatterplots
df<-mtcars
ggplot(df,aes(x=wt,y=mpg))+
  geom_point(aes(shape=factor(cyl),color=factor(cyl)),size=5)

ggplot(df,aes(x=wt,y=mpg))+
  geom_point(aes(color=hp),size=5)

ggplot(df,aes(x=wt,y=mpg))+
  geom_point(aes(color=hp),size=5)+
  scale_color_gradient(low='blue',high='red')

#Barplots
df<-mpg

ggplot(df,aes(x=class))+
  geom_bar(aes(fill=drv),position='dodge')

ggplot(df,aes(x=class))+
  geom_bar(aes(fill=drv),position='fill')

#boxplots
df<-mtcars
ggplot(df,aes(x=factor(cyl),y=mpg))+
  geom_boxplot(aes(fill=factor(cyl)))+
  coord_flip()+
  theme_dark()

#variating plotting
ggplot(movies,aes(x=year,y=rating))+
  geom_bin2d(binwidth=c(3,1))+
  scale_fill_gradient(high='red',low='blue')

ggplot(movies,aes(x=year,y=rating))+
  geom_hex()

ggplot(movies,aes(x=year,y=rating))+
  geom_density2d()

#coordinates and faceting
ggplot(mpg,aes(x=displ,y=hwy))+
  geom_point()+
  coord_cartesian(xlim=c(1,4),ylim=c(15,30))

ggplot(mpg,aes(x=displ,y=hwy))+
  geom_point()+
  facet_grid(drv~.)

#exercise
library(ggplot2)
library(ggthemes)
ggplot(mpg,aes(x=hwy)) + geom_histogram(bins=20,fill='red',alpha=0.5)

ggplot(mpg,aes(x=manufacturer)) + geom_bar(aes(fill=factor(cyl))) + theme_gdocs()

pl <- ggplot(txhousing,aes(x=sales,y=volume)) + geom_point(color='blue',alpha=0.5)
print(pl)

pl + geom_smooth(color='red')

#plotly
pl<-ggplot(mtcars,aes(mpg,wt))+
  geom_point()
gpl<-ggplotly(pl)
print(gpl)

# firula
library(dslabs)
data(murders)
head(murders)
ggplot(x, aes(reorder(country, wing, median), wing)) + geom_boxplot()
ggplot(x, aes(reorder(country, wing, median, order=TRUE), wing)) + geom_boxplot()

dat <- us_contagious_diseases %>%
  6. filter(year == 1967 & disease=="Measles" & !is.na(population)) %>%
  mutate(rate = count / population * 10000 * 52 / weeks_reporting)