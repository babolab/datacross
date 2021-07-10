# exploration du jeu de données
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

#la fonction nb_radio permet de savoir combien de licences sont actives à l'instant T.

nb_radio <- function (datetest)
{
  nrow(filter(radio, (date_ouverture < datetest & date_fermeture > datetest)|(date_ouverture < datetest & is.na(date_fermeture))))
}

annee <- ymd(seq (19850101, 20200101, by = 10000))
nb_radio_service <- data.frame(date = annee)
nb_radio_service <- mutate(nb_radio_service, nb = 1)
for (i in 1:36)
{
  nb_radio_service$nb[i] <- nb_radio(nb_radio_service$date[i])
}

# Mise en regard des données ANFR/DAM
personnes_par_an <- select(ops_stats,nombre_personnes_impliquees, annee ) %>%
  group_by(annee) %>% 
  summarize(nbpax = sum(nombre_personnes_impliquees))

personnes_par_an <- select(ops_stats, annee, nombre_personnes_impliquees) %>%
  group_by(annee) %>% 
  summarize(nb_ops = n()) %>% 
  mutate(personnes_par_an)

personnes_par_an <- filter(personnes_par_an, !annee %in% c('1984','2021'))
personnes_par_an <- mutate(personnes_par_an, nb_radio = nb_radio_service$nb, taux=nb_radio/nb_ops)

# affichage graphique
plot(personnes_par_an)

# choix de la vue et affichage final
legende <- data.frame(bandeaux = c('Licences','Opérations'), x=c(1986,1986),y=c(10000,5000), couleur = c('red','blue'))

g<- ggplot(data = personnes_par_an)
g <- g + 
  geom_line(aes(annee, nb_ops), color = legende$couleur[1])+
  scale_y_log10()+
  geom_line(aes(annee, nb_radio), color = legende$couleur[2]) +
  geom_text(data = legende, aes(x,y,label = bandeaux,color = couleur))+
  ggtitle("Évolution conjointe opérations CROSS / nombre de licences radio")+
  xlab("Année") + 
  ylab("Nombre")+
  theme(legend.position = 'none')
  #theme_economist(legend.position='none')
  
g
