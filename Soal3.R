dpois(6, 4.5)

set.seed(2)
baby <- data.frame('prob' = rpois(365, 4.5))

baby %>%
  ggplot() + geom_histogram(aes(x = prob, 
  y = stat(count / sum(count)), 
  fill = prob == 6), binwidth = 1, color = 'black',) +
  scale_fill_manual(values = c("#FFCC66", "#669933")) +
  scale_x_continuous(breaks = 0:10) +
  labs(x = 'Angka bayi lahir per periode', y = 'Proporsi bayi lahir', title = 'Simulasi kelahiran 6 bayi dalam setahun') +
  theme_bw()

bayi = 4.5
l == bayi 
rataan <- l
rataan
varian <- l
varian

