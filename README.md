Nama : Nabila Zakiyah Khansa Machrus

NRP : 5025201139

# 1
1a. Berapa peluang penyurvei bertemu x = 3 orang yang tidak menghadiri acara vaksinasi
sebelum keberhasilan pertama ketika p = 0,20 dari populasi menghadiri acara vaksinasi ?
```R
dgeom(x=3, prob=0.20)
```

1b. Mean Distribusi Geometrik dengan 10000 data random , prob = 0,20 dimana distribusi
geometrik acak tersebut X = 3
```R
mean(rgeom(n = 10000, prob = p) == 3)
```

1c. Bandingkan Hasil poin a dan b , apa kesimpulan yang bisa didapatkan?
```R
Hasil kesimpulannya adalah poin a dan b membuahkan hasil yang tidak jauh berbeda
```
1d. Histogram Distribusi Geometrik , Peluang X = 3 gagal Sebelum Sukses Pertama.
```R
library(dplyr)
library(ggplot2)
data.frame(x = 0:10, prob = dgeom(x = 0:10, prob = 0.20)) %>%
  mutate(Failures = ifelse(x == 3, 3, "other")) %>%
ggplot(aes(x = factor(x), y = prob, fill = Failures)) +
  geom_col() +
  geom_text(
    aes(label = round(prob,2), y = prob + 0.01),
    position = position_dodge(0.9),
    size = 3,
    vjust = 0
  ) +
  labs(title = "Histogram Distribusi Geometrik , Peluang X = 3 gagal Sebelum Sukses Pertama",
       subtitle = "Geometric(.2)",
       x = "Kegagalan sebelum sukses pertama (x)",
       y = "Peluang")
```
historigramnya:
![image](https://user-images.githubusercontent.com/74358409/162612665-16210d6d-8554-4721-8cec-f0499f63a66a.png)

1e. Nilai Rataan (μ) dan Varian (σ²) dari Distribusi Geometrik
```R
x = 3
p = 0.2
1/p 
(1 - p) / p^2 
```

# 2
2a. Peluang terdapat 4 pasien yang sembuh
```R
x = 4
size = 20
prob = 0.2
dbinom(x = 4, size = 20, prob = 0.2)
```

2b. Gambarkan grafik histogram berdasarkan kasus tersebut.
```R
library(dplyr)
library(ggplot2)

data.frame(x = 0:10, prob = dbinom(x = 0:10, size = n, prob = p)) %>%
  mutate(pasien = ifelse(x == X, X, "lainnya")) %>%
ggplot(aes(x = factor(x), y = prob, fill = pasien)) +
  geom_col() +
  geom_text(
    aes(label = round(prob,2), y = prob + 0.01),
    position = position_dodge(0.9),
    size = 3,
    vjust = 0
  ) +
  labs(title = "Peluang 4 pasien sembuh", x = "Sembuh", y = "Peluang") 
```
Grafik Histogram:
![image](https://user-images.githubusercontent.com/74358409/162613759-7d32502f-5f5f-41a6-aba3-d4310b443085.png)

2c. Nilai Rataan (μ) dan Varian (σ²) dari Distribusi Binomial.
```R
n = 20
p = 0.2
rerata = n*p
varian = n*p*(1-p)
```

# 3
a. Berapa peluang bahwa 6 bayi akan lahir di rumah sakit ini besok?
```R
dpois(6, 4.5)
```
b. simulasikan dan buatlah histogram kelahiran 6 bayi akan lahir di rumah sakit ini selama
setahun (n = 365)
```R
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
```
![image](https://user-images.githubusercontent.com/74358409/162614664-da0cd6c0-7559-4549-9b51-74b521e1b9cf.png)


c. dan bandingkan hasil poin a dan b , Apa kesimpulan yang bisa didapatkan
```R
Kesimpulannya adalah Perbandingan hasil perhitungan nilai exactnya dan nilai simulasi tidak signifikan
```
d. Nilai Rataan (μ) dan Varian (σ²) dari Distribusi Poisson.
```R
bayi = 4.5
l == bayi 
rataan <- l
rataan
varian <- l
varian
```

# 4
a. Fungsi Probabilitas dari Distribusi Chi-Square.
```R
dchisq(x = 2,df = 10)
```

b. Histogram dari Distribusi Chi-Square dengan 100 data random.
```R
hist(rchisq(100, v))
```

c. Nilai Rataan (μ) dan Varian (σ²) dari Distribusi Chi-Square
```R
v=10
2*v
```
