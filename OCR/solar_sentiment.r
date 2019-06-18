solar<-read.csv("tweets.csv")
View(solar)
solar<-solar[-1]
str(solar)

#building corpus
library(tm)
corpus<-iconv(solar$text,to = "utf-8")
corpus<-Corpus(VectorSource(corpus))
inspect(corpus[1:5])

#clean text
corpus<-tm_map(corpus,tolower)

#removing pancutation
corpus<-tm_map(corpus,removePunctuation)
##removing numbers
corpus<-tm_map(corpus,removeNumbers)

stopwordremoval<-tm_map(corpus,removeWords,stopwords('english'))

##remove URL

removeurl<-function(x) gsub('http[[:alnum:]]*', '',x)
cleanset<-tm_map(stopwordremoval,content_transformer(removeurl))

inspect(cleanset[1:5])

cleanset<-tm_map(cleanset,stripWhitespace)
cleanset<-tm_map(cleanset,removeWords,c('eduaubdedubu','eduaubcedubcua',
                                        'eduaubdedubuslrusd','aubdedububearnia'))


##term document matrix
tdm<-TermDocumentMatrix(cleanset)
tdm
tdm<-as.matrix(tdm)
tdm[1:10, 1:10]

##bar plot
w<-rowSums(tdm)
w

w_1<-subset(w,w>=10)
w_1

barplot(w_1, las=2,col=rainbow(50))

#wordcloud

library(wordcloud)
w_2<-sort(rowSums(tdm),decreasing = TRUE)
set.seed(222)
wordcloud(words = names(w_2),freq = w_2,max.words = 70,random.order = F,min.freq = 1,
          colors = brewer.pal(8,'Dark2'),scale = c(5,0.3),rot.per = 0.1)
install.packages("wordcloud2")
library(wordcloud2)
w_2<-data.frame(names(w_1),w_1)
colnames(w_2)<-c('word','freq')
wordcloud2(w_2,size =0.8,shape='circle')

##sentiment analysis 
library(syuzhet)
library(lubridate)
library(ggplot2)
library(scales)
library(reshape2)
library(dplyr)

##readfile 
tweets_1<-read.csv("tweets.csv")
tweets_2<-iconv(tweets_1$text,to = "utf-8")
s<-get_nrc_sentiment(tweets_2)
head(s)

barplot(colSums(s),
        las = 2,
        col = rainbow(10),ylab = 'count',
        main = "sentiment scores for SolarCoin Tweets")
