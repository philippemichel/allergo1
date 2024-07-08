zz <- tt |> 
  dplyr::select(starts_with("resp_")) |> 
          mutate_all(as.numeric) |>
  mutate_all(~ . -1) |> 
  rowwise() %>% 
  mutate(tot = sum(c_across(1:7)))
zz$tolerance <- tt$tolerance

zz |> 
  tbl_summary(missing = "no", 
              by = tolerance, 
              ) |>
  
  zz |>
  mutate(tot = as.factor(tot)) |>
  ggplot() +
  aes(x = tolerance, fill = tot) +
  geom_bar(position = "fill") +
  scale_y_continuous(labels = percent)
  
