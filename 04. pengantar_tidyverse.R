#' 
#' # Latihan R di BBTNBKDS / R Training at BBTNBKDS
#' ## 2026-06-29 s/d 2026-06
#' ## disampikan oleh Andy Marshall, Universitas Michigan
#' 
#' # Pengantar tidyverse / Intro to the tidyverse
#' 
#' Dalam modul ini, saya akan memperkenalkan Anda pada `{tidyverse}`, yaitu kumpulan package yang sangat populer untuk pekerjaan data science di R. Kumpulan package ini bekerja dengan baik bersama-sama karena menggunakan representasi data dan fitur desain yang serupa. Package inti dari tidyverse mudah diinstal dan dimuat dengan satu perintah: `library(tidyverse)`. Perintah ini memuat beberapa package penting, termasuk `{readr}`, `{dplyr}`, `{tidyr}`, dan `{ggplot2}`.
#' 
#' > In this module I'll introduce you to the {tidyverse}, which are a very popular set of packages for data science work in R. This set of packages that work in harmony because they share common data representations (and design feaures in the programs themselves). It is easy to install and load core packages from the tidyverse in a single command: `library(tidyverse)`, which includes, among other things, {readr}, {dplyr}, {tidyr}, and {ggplot2}
#' 
#' ## dasar-dasar package / package basics
#' 
#' Package R adalah kumpulan alat tambahan yang menambahkan fungsi, dataset, dan fitur baru ke R dasar atau *base R*. Kita menggunakan package karena package memungkinkan kita melakukan tugas yang lebih khusus tanpa harus menulis semuanya dari awal—misalnya membuat grafik yang lebih baik, membersihkan data, membaca berbagai jenis file, menjalankan model statistik, atau membuat peta. Dalam praktiknya, package adalah salah satu alasan utama mengapa R sangat kuat: orang-orang di seluruh dunia mengembangkan dan membagikannya, sehingga kita bisa membangun pekerjaan kita berdasarkan alat yang sudah ada dan menggunakan alat yang andal untuk berbagai jenis analisis.
#' 
#' > R packages are collections of extra tools that add new functions, datasets, and features to base R. We use packages because they let us do more specialized tasks without having to write everything from scratch—for example, making better graphs, cleaning data, reading different file types, running statistical models, or creating maps. In practice, packages are one of the main reasons R is so powerful: people around the world develop and share them, so we can build on existing work and use reliable tools for many different kinds of analysis.
#' 
#' Pertama kali kita menggunakan sebuah package, kita perlu menginstalnya. Ini hanya perlu dilakukan satu kali untuk package tersebut. Menginstal package mirip seperti membeli bola lampu, hanya harus lakukan satu kali per bola lampu. Dalam konteks latihan ini, saya sudah menginstal package-package yang Anda perlukan.
#' 
#' > The first time we use a package we need to install it, we only do this once for a given package. Intalling a package is like buying a lightbulb, you only have to do it once per lightbulb. In this context, I have already installed the packages you will need.
#' 
#' Setiap kali kita ingin menggunakan sebuah package dalam suatu project, kita harus memuat kodenya menggunakan sintaks `library()`. Ini mirip seperti menyalakan bola lampu. Setiap kali kita menutup R, atau menggunakan project baru, kita harus memuat ulang package tersebut ke library (menyalakan bola lampu).
#' 
#' > Every time we want to use a package in a given project we have to load the code using the `library()` syntax. This is akin to turning a lightbulb on. Every time we shut R down, or use a new project, we have to reload the package into the library (turn the light on).
#' 
#' 
#' ## memuat package / load packages
#' 
#' Di sini kita memuat kumpulan dasar package `{tidyverse}`.
#' 
#' > Here we load the basic suite of {tidyverse} packages.
#' 
## -----------------------------------------------------------------

library(tidyverse)


#' 
#' Berikut adalah daftar package `{tidyverse}` yang diinstal secara default: <https://www.tidyverse.org/packages/>
#' 
#' > Here is a list of the {tidyverse} packages that are installed by default: https://www.tidyverse.org/packages/
#' 
#' 
#' ## operator infix / infix operators
#' 
#' Operator *infix* adalah mekanisme untuk merangkai beberapa perintah. Secara informal, kita sering menyebutnya sebagai “pipe”. Secara klasik, `{tidyverse}` menggunakan karakter `%>%` untuk mendefinisikan sebuah pipe.
#' 
#' > Infix operators are mechanisms for chaining commands. Colloquially, we refer to them as "pipes". Classically, the {tidyverse} used the characters '%>%' to define a pipe. 
#' 
## -----------------------------------------------------------------

# The following pairs are functionally equivalent:
cars %>% head()
head(cars)

cars %>% head() %>% summary()
summary(head(cars))


#' 
#' Anda bisa menggunakan pipe untuk menulis ulang beberapa operasi dengan cara yang bisa dibaca dari kiri ke kanan, dan dari atas ke bawah.
#' 
#' > You can use the pipe to rewrite multiple operations in a way that you can read left-to-right, top-to-bottom. 
#' 
#' Sejak rilis R versi 4.1, pipe juga sudah ditambahkan ke *base R*, menggunakan `|>`.
#' 
#' > As of the 4.1 release of base R, "pipes" have been added, using "|>"
#' 
## -----------------------------------------------------------------

cars |> head()
cars |> head() |> summary()


#' 
#' Saya semakin sering melihat pipe dari `{base}` R muncul dalam kode `{tidyverse}`, termasuk dalam buku *R for Data Science* karya Wickham sendiri. Lihat <https://r4ds.hadley.nz/data-transform.html#sec-the-pipe>
#' 
#' > I am seeing the {base} R pipe cropping up more and more in {tidyverse} code, including in Wickham's own *R for Data Science* book. See https://r4ds.hadley.nz/data-transform.html#sec-the-pipe
#' 
#' Untuk sebagian besar penggunaan tingkat pemula hingga menengah, pipe baru dari base R `|>` setara dengan pipe dari `{tidyverse}` yaitu `%>%`. Saat menggunakan fungsi-fungsi `{tidyverse}`, saat ini saya tidak melihat alasan kuat untuk menggunakan pipe baru `|>` yang pada akhirnya lebih terbatas, jadi saya akan tetap menggunakan `%>%`. Anda boleh menggunakan salah satu.
#' 
#' > For most beginner to intermediate uses, the new base R pipe '|>' is equivalent to the {tidyverse}’s pipe '%>%'. When using {tidyverse} functions, I see no reason at present to use the new (but ultimately more limited) '|>', so I will continue to use '%>%'. You may use either. 
#' 
#' 
#' Pintasan keyboard untuk menyisipkan pipe adalah:
#' 
#' > The shortcut to insert a pipe is:
#' 
#' Command + Shift + M  (Mac)  
#' Ctrl + Shift + M     (Windows)
#' 
#' > Command + Shift + M  (Mac)
#' > Ctrl + Shift + M     (Windows)
#' 
#' Cobalah:
#' 
#' > Try it:
#' 
## -----------------------------------------------------------------




#' 
#' Pipe mana yang ditambahkan bergantung pada pengaturan Anda. Secara default, yang digunakan adalah pipe asli `{tidyverse}` yaitu `%>%`, tetapi Anda bisa mengubahnya melalui **Tools -> Global options -> Code editor**.
#' 
#' > Which pipe is added depends on your settings. But default, it is the original  {tidyverse} pipe '%>%', but you can change this in Tools -> Global options -> Code editor
#' 
#' 
#' Jika Anda ingin tahu lebih lanjut, Anda bisa membaca pemikiran Hadley Wickham tentang hal ini di sini:
#' 
#' > If you want to know more, you can read Hadley Wickham's thoughts on this here:
#' 
#' <https://www.tidyverse.org/blog/2023/04/base-vs-magrittr-pipe/>
#' 
#' > https://www.tidyverse.org/blog/2023/04/base-vs-magrittr-pipe/
#' 
#' Apakah Anda menggunakan pipe atau tidak sebagian besar merupakan masalah gaya penulisan kode, meskipun dalam beberapa konteks salah satu pipe mungkin lebih disukai untuk meningkatkan keterbacaan.
#' 
#' > Whether you use pipes or not is largely a matter of style, although one or the other may be preferred in some contexts to improve readability.
#' 
#' Pipe digunakan secara luas dalam tidyverse Hadley Wickham. Satu-satunya pengecualian adalah `{ggplot2}`: package ini ditulis sebelum pipe dibuat.
#' 
#' > Pipes are widely used in to Hadley Wickham's tidyverse. The only exception is {ggplot2}: it was written before the pipe was created. 
#' 
#' ## tibble / tibbles
#' 
#' Tibble adalah alternatif untuk `data.frame` tradisional di R. Tibble adalah data frame, tetapi dengan sedikit penyesuaian agar bekerja lebih baik dalam tidyverse.
#' 
#' > Tibbles are alternatives to R's traditional data.frames. Tibbles are data frames, but slightly tweaked to work better in the tidyverse. 
#' 
#' Menurut tim RStudio, “Tibble, atau `tbl_df`, adalah versi modern dari `data.frame`, yang mempertahankan hal-hal yang terbukti efektif, dan membuang hal-hal yang kurang berguna. Tibble adalah `data.frame` yang bersifat malas dan agak ‘rewel’: tibble melakukan lebih sedikit hal, misalnya tidak mengubah nama atau tipe variabel dan tidak melakukan pencocokan parsial, serta lebih sering memberi peringatan, misalnya ketika sebuah variabel tidak ada. Ini memaksa kita menghadapi masalah lebih awal, yang biasanya menghasilkan kode yang lebih bersih dan lebih ekspresif.” Di sini kita akan mengimpor dataset yang sering digunakan, yaitu `{nycflights13}`, untuk melihat seperti apa tampilan tibble.
#' 
#' > According to the rstudio team "A tibble , or tbl_df , is a modern re-imagining of the data.frame, keeping what time has proven to be effective, and throwing out what is not. Tibbles are data.frames that are lazy and surly: they do less (i.e. they don't change variable names or types, and don't do partial matching) and complain more (e.g. when a variable does not exist). This forces you to confront problems earlier, typically leading to cleaner, more expressive code." Here we'll import a commonly-used data set {nycflights13} to see how tibbles look.
#' 
## -----------------------------------------------------------------

#install.packages("nycflights13")
library("nycflights13")
# call in a dataframe from the {nycflights13} database
flights


#' 
#' Tibble dicetak sedikit berbeda dari data frame lain yang mungkin pernah kita gunakan sebelumnya: tibble hanya menampilkan beberapa baris pertama dan semua kolom yang muat di satu layar. Untuk melihat seluruh dataset, Anda bisa menjalankan `View(flights)`, yang akan membuka dataset di viewer RStudio. Perhatikan bahwa jika Anda mencoba ini, mungkin perlu satu atau dua menit untuk ditampilkan.
#' 
#' > Tibble data frames print a little differently from other data frames we have used in the past: they only show the first few rows and all the columns that fit on one screen. (To see the whole data set, you can run `View(flights)` which will open the data set in the RStudio viewer- note that if you try this, it might take a minute or two to render).
#' 
#' Baris singkatan tiga huruf di bawah nama kolom menjelaskan tipe dari setiap variabel. Fitur ini dipinjam dari `str()`:
#' 
#' > The row of three letter abbreviations under the column names describe the type of each variable, a feature borrowed from str():
#' 
#'     `lgl` = logical, yaitu hanya berisi `TRUE` atau `FALSE`
#'     `int` = integer.
#'     `dbl` = double, atau angka riil.
#'     `chr` = vektor karakter, atau string.
#' 
#' >     `lgl` = logical (i.e., contain only `TRUE` or `FALSE`)
#' >     `int` = integers.
#' >     `dbl` = doubles, or real numbers.
#' >     `chr` = character vectors, or strings.
#' 
## -----------------------------------------------------------------

# compare:
mtcars
as_tibble(mtcars)


#' 
#' Mari kita lihat lagi dataset `flights`:
#' 
#' > Let's look again at the flights data set:
#' 
## -----------------------------------------------------------------

flights


#' 
#' Satu pertanyaan yang mungkin muncul saat melihat tibble adalah mengapa beberapa angka diberi garis bawah. Menurut dokumentasi `tidyverse`, ini dilakukan di tibble untuk “memberikan gambaran yang lebih baik tentang orde besarnya angka”. Kelompok tiga digit diberi garis bawah, dimulai dari digit keempat sebelum atau sesudah titik desimal. Pada dasarnya, ini mirip seperti pemisah koma untuk ribuan, tetapi berlaku di kedua sisi titik desimal. Berikut contoh sederhana:
#' 
#' > One obvious question one might have looking at tibbles is why some numbers are underlined. According to 'tidyverse' documentation, this is done in tibbles to "give better idea of the order of magnitude of the numbers". Groups of three digits are underlined, starting with the fourth before/after the decimal point. Essentially this works like the comma separator for 1,000s, but holds on both sides of the decimal point. A simple example:
#' 
## -----------------------------------------------------------------

x <- -123456789 * (10 ^ c(-2, -5, -6, NA, -8, -10)) * c(-1, 1)
x

tibble(x)


#' 
#' Anda juga bisa melihat bahwa nilai negatif ditampilkan dengan warna merah.
#' 
#' > You can see negative values are also indicated in red.
#' 
#' #### mencetak tibble / printing
#' 
#' Saat dicetak, tibble hanya menampilkan 10 baris pertama dan semua kolom yang muat di layar. Tibble dirancang agar Anda tidak secara tidak sengaja membanjiri Console saat mencetak data frame yang besar. Namun, kadang-kadang Anda membutuhkan output yang lebih banyak daripada tampilan default. Ada beberapa opsi yang bisa membantu.
#' 
#' > When printed, tibbles show only the first 10 rows, and all the columns that fit on screen. Tibbles are designed so that you don't accidentally overwhelm your console when you print large data frames. But sometimes you need more output than the default display. There are a few options that can help.
#' 
#' Pertama, Anda bisa secara eksplisit menggunakan `print()` pada data frame dan mengatur jumlah baris (`n`) serta `width` atau lebar tampilan. `width = Inf` akan menampilkan semua kolom. Ini menghasilkan output yang lebih mirip dengan output dari base R:
#' 
#' > First, you can explicitly `print()` the data frame and control the number of rows (`n`) and the `width` of the display. `width = Inf` will display all columns (this produces an output that is more similar to that produced by base R):
#' 
## -----------------------------------------------------------------

flights %>% 
     print(n = 10, width = Inf)


#' 
#' Beberapa fungsi lama tidak bekerja dengan tibble. Jika Anda menemukan salah satu fungsi seperti ini, gunakan `as.data.frame()` untuk mengubah tibble kembali menjadi data frame:
#' 
#' > Some older functions don't work with tibbles. If you encounter one of these functions, use `as.data.frame()` to turn a tibble back to a data frame:
#'      
## -----------------------------------------------------------------

flights
fl2 <- as.data.frame(flights)
fl2


#' ````
