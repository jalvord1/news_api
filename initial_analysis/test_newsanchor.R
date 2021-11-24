#####################################################
# testing the newsanchor package
# access the newsapi
#####################################################

# load packages
library(newsanchor)
library(data.table)

# getting headlines from fox about kyle rittenhouse
## first from fox
results_kr_fox <- get_everything(query = "Kyle Rittenhouse", 
                                 sources = 'fox-news',
                                 page_size = 100)

results_kr_fox_dt <- as.data.table(results_kr_fox)

## now from cnn
results_kr_cnn <- get_everything(query = "Kyle Rittenhouse", 
                                 sources = 'cnn',
                                 language = 'en',
                                 page_size = 100)

results_kr_cnn_dt <- as.data.table(results_kr_cnn)

# save sources
sources <- get_sources(country = 'us')
sources <- as.data.table(sources)

# save sources as txt file
write.table(sources, 'data/news_sources.txt', sep = ',')
