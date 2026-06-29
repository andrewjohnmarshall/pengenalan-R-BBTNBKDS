#' # Latihan R di BBTNBKDS / R Training at BBTNBKDS
#' ## 2026-06-29 s/d 2026-06
#' ## disampikan oleh Andy Marshall, Universitas Michigan / delivered by Andy Marshall, University of Michigan
#' 
#' # Mengeksplorasi data / Exploring data
#' 
#' Bagian inti, mungkin *bagian paling inti*, dari eksplorasi data adalah visualisasi data. Kita akan membuat hampir semua visualisasi menggunakan `{ggplot2}`, yang akan kita pelajari dalam sesi berbeda. Dalam sesi ini, kita akan fokus mengeksplorasi data dalam bentuk non-visual, kecuali beberapa visualisasi sederhana yang dihasilkan dari ringkasan sederhana.
#' 
#' > A core part, perhaps *the* core part, of data exploration is data visualization. We'll be doing almost all of our visualizations in {ggplot2}, which we'll learn about in a different session. In this session we'll focus on exploring data in non-visual forms (save some simple visualizations produced in simple summaries).
#' 
#' Ada banyak package yang tersedia untuk melakukan eksplorasi data dasar di R. Kita akan fokus pada beberapa package yang, menurut saya, memiliki keseimbangan yang baik antara kesederhanaan atau kemudahan bagi pemula, dan kekuatan analisis. Package-package ini juga terintegrasi dengan baik dengan package `{tidyverse}` lain yang sudah atau akan kita temui.
#' 
#' > There are many packages available to do basic data exploration in R. We will focus on a small number that to my mind strike a good balance between simplicity (beginner friendliness) and power, and that integrate well with other {tidyverse} packages we have or will encounter.
#' 
#' Untuk gambaran umum tentang beberapa package utama, termasuk beberapa yang tidak akan kita bahas, saya menyarankan tulisan Michael Clark:
#' 
#' > For an overview of some of the major ones (including several we won't talk about), I suggest Michael Clark's posting:
#' 
#' <https://m-clark.github.io/exploratory-data-analysis-tools/>
#' 
#' > https://m-clark.github.io/exploratory-data-analysis-tools/
#' 
#' Dua referensi lain yang sudah saya rekomendasikan juga sangat berguna:
#' 
#' > Two other references I have already recommended are also very useful:
#' 
#' 1. *R for Data Science* oleh Hadley Wickham dan rekan-rekan  
#'    <https://r4ds.hadley.nz/eda>
#' 
#' > 1. Hadley Wickham et al.'s R for Data Science (https://r4ds.hadley.nz/eda)
#' 
#' 2. *Tidyverse Skills for Data Science* oleh Wright dan rekan-rekan  
#'    <https://jhudatascience.org/tidyversecourse/wrangle-data.html>
#' 
#' > 2. Wright et al.'s Tidyverse Skills for Data Science
#' > (https://jhudatascience.org/tidyversecourse/wrangle-data.html)
#' 
#' 
#' ## `glimpse()` / glimpse()
#' 
#' Seperti yang kita lihat di atas, `{tidyverse}` memiliki fungsi yang mirip dengan `str()`, yaitu `glimpse()`:
#' 
#' > As we saw above, the {tidyverse} has a similar function to `str()`, `glimpse()`:
#' 
## --------------------------------------------------

glimpse(msleep)


#' 
#' ## `tabyl()` / tabyl()
#' 
#' Fungsi `tabyl()` dari package `{janitor}` bisa sangat membantu untuk meringkas variabel kategorikal dengan cepat dan memahami output-nya sekilas. Fungsi ini mirip dengan fungsi `table()` dari base R, tetapi `tabyl()` menampilkan data yang hilang secara eksplisit, bukan mengabaikan nilai hilang secara default.
#' 
#' > The `tabyl()` function from {janitor} package can be incredibly helpful for summarizing categorical variables quickly and discerning the output at a glance. It is similar to the `table()` function from base R, but is explicit about missing data, rather than ignoring missing values by default.
#' 
## --------------------------------------------------

msleep %>% 
  tabyl(order)

# base R's `table()` ignores NAs
table(msleep$vore)
unique(msleep$vore)

# but the tidyverse's `tabyl()` shows them:
msleep %>% 
  tabyl(vore)


#' 
#' 
#' ## `skim()` / skim()
#' 
#' Output dari `skim()` membagi data berdasarkan tipe variabel. Misalnya, dataset `msleep` dibagi menjadi tipe variabel karakter dan numerik. Kemudian data tersebut diringkas dengan cara yang sesuai untuk masing-masing tipe. Fungsi ini memberikan banyak informasi tentang keseluruhan dataset.
#' 
#' > The output from `skim()` breaks the data up by variable type. For example, the 'msleep' data set is broken up into character and numeric variable types. The data are then summarized in a meaningful way for each. This function provides a lot of information about the entire data set. 
#' 
## --------------------------------------------------

skim(msleep)


#' 
#' Perhatikan, kita bisa menggunakan `skim()` dan alat lain di dalam pipeline deskripsi data yang lebih kompleks; kita akan melihatnya di bawah.
#' 
#' > Note, we can use `skim()` and other tools inside a more complex description pipeline; we'll see that below.
#' 
#' 
#' ## `view()` / view()
#' 
#' Ada juga `view()`, yang membuka dataset Anda dalam jendela bergaya spreadsheet yang *dapat diedit*. Tetapi berhati-hatilah di sini — perubahan apa pun yang Anda buat tidak akan terdokumentasi dalam script Anda, sehingga dapat memengaruhi reproduksibilitas. Perhatikan bahwa saya harus menggunakan `tibble::view()` karena fungsi `view()` dalam `{tibble}`, yang merupakan bagian dari `{tidyverse}`, “tertutup” atau *masked* oleh package `{summarytools}` yang kita panggil setelahnya.
#' 
#' > There's also `view()` that opens your data set in an *editable* spreadsheet-style window, but tread carefully here - any changes you make will not be documented in your script, affecting reproducibility. Note that I had to use `tibble::view()` because the `view()` function in {tibble} (which is part of the {tidyverse}) is "masked" by the package {summarytools} that we called afterwards.
#' 
## --------------------------------------------------

view(msleep) # produces an error
tibble::view(msleep)


#' 
#' 
#' ## DataExplorer / DataExplorer
#' 
#' Package `{DataExplorer}` menyediakan beberapa fungsi yang berguna. Package ini dapat memberikan gambaran umum dengan `introduce()` dan membuat laporan `.html` dengan banyak informasi deskriptif menggunakan `create_report()`. Sebagian besar laporan ini bersifat visual, dan banyak di antaranya belum terlalu berguna bagi kita saat ini. Namun, ini tetap package kecil yang kuat untuk eksplorasi sederhana. Laporan tersebut akan muncul sebagai file di working directory Anda.
#' 
#' > {DataExplorer} package provides some useful functionality. It can provide an overview with `introduce()` and create an *.html report with lots of descriptive information using `create_report()`. Most of this report is visual, and much of it not all that useful for us at present. Still, it is a powerful little package for simple exploration. The report appears as a file in your working directory.
#' 
## --------------------------------------------------

introduce(msleep)
create_report(msleep)


#' 
#' ## gtsummary / gtsummary
#' 
#' `{gtsummary}` adalah alat yang kuat dan bekerja dengan baik bersama package `{tidyverse}` untuk menghasilkan ringkasan yang berguna, yang muncul di pane **Viewer**.
#' 
#' > {gtsummary} is a powerful tool that plays well with {tidyverse} packages to produce useful summaries (that appear in the 'Viewer' pane).
#' 
## --------------------------------------------------

tbl_summary(msleep)

# this does the same:

msleep %>% 
  tbl_summary()

# by subgroup
msleep %>% 
  tbl_summary(by = vore)


#' 
#' ## summarytools / summarytools
#' 
#' `{summarytools}` adalah package yang masih cukup baru bagi saya, tetapi tampaknya sangat bagus. Saya belum mengeksplorasinya secara mendalam, tetapi fungsi-fungsi sederhananya intuitif dan terlihat sangat membantu:
#' 
#' > {summarytools} is a package that is pretty new to me, but seems great. I have not done extensive exploration of it, but the simple functions are intuitive and seem very helpful:
#' 
## --------------------------------------------------

descr(msleep)

dfSummary(msleep)

msleep %>% 
  group_by(vore) %>% 
  dfSummary()


#' 
#' Ada vignette yang berguna tentang `{summarytools}` di sini, jika Anda ingin mengeksplorasinya lebih lanjut:
#' 
#' > There is a useful vignette about {summarytools} available here, if you wish to explore it more:
#' 
#' <https://cran.r-project.org/web/packages/summarytools/vignettes/introduction.html>
#' 
#' > https://cran.r-project.org/web/packages/summarytools/vignettes/introduction.html
