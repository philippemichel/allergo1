

#  ------------------------------------------------------------------------
#
# Title : import allergo1
#    By : PhM
#  Date : 2024-06-27
#    
#  ------------------------------------------------------------------------

importph <- function(){
library(tidyverse)
library(janitor)
library(readODS)
library(baseph)

  tt <- readODS::read_ods("datas/ALLERGOLOGIE.ods",1) |> 
      clean_names() |> 
      mutate(across(where(is.character), as.factor)) |> 
    ## Réordonnancement de tt$asthme
mutate(asthme = fct_relevel(asthme,
    "Non", "Intermittant", "À l’effort", "Persistant léger",
    "Persistant modéré", "Persistant sévère")) |> 
## Réordonnancement de tt$rhinoconjonctivite
  mutate(rhinoconjonctivite = fct_relevel(rhinoconjonctivite,
    "Non", "Intermittante", "Persistante légère", "Persistante modérée",
    "persistante sévère"
  )) |> 
    ## Réordonnancement de tt$dermite_atopique
mutate(dermite_atopique = fct_relevel(dermite_atopique,
    "Non", "En rémisssion", "Persistante et sévère", "Persistante légère à modérée")) |> 
  ## Réordonnancement de tt$accident_ito
  mutate(accident_ito =fct_relevel(accident_ito,
    "Non", "Grade 1", "Grade 2", "Grade 3", "Grade 4", "Grade 5"
  ))
  
  
  #
  bn <- readODS::read_ods("datas/ALLERGOLOGIE.ods",2) 
  var_label(tt) <- bn$nom
  
  
  save(tt, file = "datas/allergo.RData")
}

importph()
load("datas/allergo.RData")
