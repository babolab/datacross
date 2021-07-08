str(operations)
head(operations)

hist(ops_stats$annee)

tab <-table(operations$cross)
hist(tab)
barplot(tab)
o <- order(-tab)[1:7]
barplot(tab[order(-tab)[1:7]])
rep_par_an <- table (ops_stats$annee)
rep_par_an
barplot(rep_par_an)

select(ops_stats, annee, nombre_personnes_impliquees) %>% group_by(annee) %>% summarize()
personnes_par_an <- select(ops_stats,nombre_personnes_impliquees, annee ) %>% group_by(annee) %>% summarize(nbpax = sum(annee))

plot(personnes_par_an)
g<- ggplot(data = personnes_par_an)
g <- g + geom_point(aes(annee, nbpax))+scale_y_log10()
g
