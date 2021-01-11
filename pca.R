library(tidyverse)
gapminder_w_url <- "https://bit.ly/2vEDq5b"
gapminder_wide <- read_csv(gapminder_w_url)
head(gapminder_wide, n=3)
gapminder_life <- gapminder_wide %>%
  filter(continent %in% c("Africa","Europe")) %>%
  select(continent,country,starts_with('lifeExp'))
gapminder_life <- gapminder_life %>% 
  unite("continent_country", c(continent,country)) %>%
  column_to_rownames("continent_country")
head(gapminder_life)

pca_res <- prcomp(gapminder_life, scale=TRUE)
summary(pca_res)

names(pca_res)

[1] "sdev"     "rotation" "center"   "scale"    "x"
pca_res$x[1:5,1:3]
pca_res$center[1:5]
head(pca_res$scale^2, n=5)
var_explained <- pca_res$sdev^2/sum(pca_res$sdev^2)
var_explained[1:5]

pca_res$x %>% 
  as.data.frame %>%
  ggplot(aes(x=PC1,y=PC2)) + geom_point(size=4) +
  theme_bw(base_size=32) + 
  labs(x=paste0("PC1: ",round(var_explained[1]*100,1),"%"),
       y=paste0("PC2: ",round(var_explained[2]*100,1),"%")) +
  theme(legend.position="top")

pca_res$x %>% 
  as.data.frame %>%
  rownames_to_column("continent_country") %>%
  separate(continent_country,c("continent")) %>%
  ggplot(aes(x=PC1,y=PC2)) + geom_point(aes(color=continent),size=4) +
  theme_bw(base_size=32) + 
  labs(x=paste0("PC1: ",round(var_explained[1]*100,1),"%"),
       y=paste0("PC2: ",round(var_explained[2]*100,1),"%")) +
  theme(legend.position="top")