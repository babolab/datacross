# idée: pouvoir mesurer le nombre de licences radio à l'instant T, pour connaître le nombre de plaisanciers "en service"

# la fonction nb_radio permet de savoir combien de licences sont actives à l'instant T.

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



