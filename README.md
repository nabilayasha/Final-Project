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
# 5
a. Fungsi Probabilitas dari Distribusi Exponensia
```R
set.seed(1)
rexp(3)
[1] 0.7551818 1.1816428 0.1457067
```
b. Histogram dari Distribusi Exponensial untuk 10, 100, 1000 dan 10000 bilangan random
```R
hist(rexp(10))
hist(rexp(100))
hist(rexp(1000))
hist(rexp(10000))
```
data = 10
![image](https://user-images.githubusercontent.com/74358409/174013005-d12cb60d-a289-4301-8dcd-663b06e19439.png)

data = 100
![image](https://user-images.githubusercontent.com/74358409/174013161-bb12740d-9daa-4153-9252-95b4c9c2b858.png)

data = 1000
![image](https://user-images.githubusercontent.com/74358409/174013212-9c61c1aa-c5a5-434d-b54d-fc0286c97c91.png)

data = 10000
![image](https://user-images.githubusercontent.com/74358409/174013268-8909266e-9914-45cd-bdb1-9f4b85b653f7.png)

c. Nilai Rataan (μ) dan Varian (σ²) dari Distribusi Exponensial untuk n = 100 dan λ = 3
```R
lamda <- 3
rataan <- 1 / lamda
rataan
[1] 0.3333333
varian <- 1 / (lamda * lamda)
varian
[1] 0.1111111
```

# 6
a. Fungsi Probabilitas dari Distribusi Normal P(X1 ≤ x ≤ X2), hitung Z-Score Nya dan plot data generate randomnya dalam bentuk grafik. 
```R
mean = 50
sd = 8
n = 100
z = rnorm(n, mean, sd)
plot(z)
```
![image](https://user-images.githubusercontent.com/74358409/174017228-a9d23974-a6ad-43b1-8730-b5369055203f.png)


b. Generate Histogram dari Distribusi Normal dengan breaks 50 dan format penamaan:
    5025201139_Nabila Zakiyah Khansa' Machrus_Probstat_D_DNhistogram
```R
hist(z, breaks = 50, main="5025201139_Nabila Zakiyah Khansa' Machrus_Probstat_D_DNhistogram")
```
![no6](https://user-images.githubusercontent.com/74358409/174017413-3296d90e-897c-4a7f-9c31-fab4bdc603cb.png)


c. Nilai Varian (σ²) dari hasil generate random nilai Distribusi Normal.
```R

```

