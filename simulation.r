pacman::p_load(tidyverse, ggplot2, gganimate, gifski, png, lme4, gridExtra)

X=100
Y=100

b = c(7,-0.055,-0.0241,7,-0.065,-0.023)

f <- function(X,Y){
  b[1]+b[2]*X+b[3]*Y
}

g <- function(X,Y){
  b[4]+b[5]*Y+b[6]*X
}


df <- tibble(i=c(), X=c(),Y=c())

for(i in 1:100) {
  X=X+f(X,Y)+rnorm(1,sd=5)
  Y=Y+g(X,Y)+rnorm(1,sd=5)
  df <- df %>% rbind(tibble(i=c(i),X=c(X),Y=c(Y)))
}

p <- df %>% 
  pivot_longer(cols = c("X","Y"), names_to="participant") %>% 
  ggplot() +
  aes(x=i, color=participant, y=value) +
  geom_line(size=1) +
  theme_minimal() +
  scale_y_continuous(limits=c(0,200))

p

m1 <- lm(X~Y*i,df) %>% summary

m1