ompleterecords <- na.omit(citations)

group <- ompleterecords %>% group_by(lei_citada) %>% summarize(n())

group <- rename(group, contagem = `n()`)

maxN<-subset(group,group$contagem== max(group$contagem),select=lei_citada)

df <-group[order(group$contagem),]

top10LeastCitations <- slice_tail(df, n = 10)

ggplot(top10LeastCitations, aes(x=lei_citada, y=contagem)) + 
  geom_bar(stat = "identity") +
  coord_flip()

reactable(top10LeastCitations)