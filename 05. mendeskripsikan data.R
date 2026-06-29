#' 
#' # Latihan R di BBTNBKDS / R Training at BBTNBKDS
#' ## 2026-06-29 s/d 2026-06
#' ## disampikan oleh Andy Marshall, Universitas Michigan
#' 
#' Mendeskripsikan data
#' 
#' > Describing data
#' 
#' # Memuat package / load packages
#' 
#' Di sini kita memuat kumpulan dasar package `{tidyverse}`, bersama dengan beberapa package berguna lain yang akan Anda eksplorasi di akhir kelas.
#' 
#' > Here we load the basic suite of {tidyverse} packages, along with some other useful packages you'll explore at the end of class.
#' 
## --------------------------------------------------

library(tidyverse)
library(janitor)
library(skimr)
library(gtsummary)
library(summarytools)
library(DataExplorer)


#' 
#' # Mendeskripsikan data / Describing data: 
#' 
#' Dalam sesi ini, kita akan bekerja dengan salah satu package utama dalam `{tidyverse}`, yaitu `{dplyr}`. Package ini sering digambarkan sebagai package untuk membantu *wrangle data* atau merapikan dan mengolah data. Tetapi menurut saya, tugas itu lebih banyak menjadi wilayah `{tidyr}`, sedangkan `{dplyr}` lebih sering digunakan untuk mendeskripsikan data, membuat ringkasan, memproses data, dan hal-hal sejenis. Meski begitu, `{dplyr}` dan `{tidyr}` memang sering digunakan bersama. Berikut adalah fungsi-fungsi inti dalam `{dplyr}`:
#' 
#' > In this session we'll be working a key {tidyverse} package, {dplyr}. It is often described as a package to help wrangle data, but to my mind that is mostly the purview of {tidyr}, whereas {dplyr} is more often used for data description, summary, processing, and such (although {dplyr} and {tidyr} are often used together). These are the core {dplyr} functions:
#' 
#' `filter()`    - memfilter baris  
#' `select()`    - memilih, mengganti nama, dan mengatur ulang kolom  
#' `rename()`    - mengganti nama kolom  
#' `arrange()`   - mengatur ulang baris  
#' `mutate()`    - membuat kolom baru  
#' `group_by()`  - mengelompokkan variabel  
#' `summarize()` - meringkas informasi dalam sebuah dataset
#' 
#' > `filter()`    - filter rows
#' > `select()`    - select, rename, and reorder columns
#' > `rename()`    - rename columns
#' > `arrange()`   - reorder rows
#' > `mutate()`    - create a new column
#' > `group_by()`  - group variables
#' > `summarize()` - summarize information within a data set
#' 
#' Untuk banyak contoh di bawah ini, kita akan menggunakan dataset yang dimuat bersama package `{tidyverse}` bernama `msleep` (`?msleep`). Dataset ini berisi waktu tidur dan berat badan dari 83 mamalia berbeda. Dataset ini memiliki 11 variabel.
#' 
#' > For the many of the examples below, we’ll be using a data set that is loaded with the {tidyverse} package called 'msleep' (?msleep). It includes sleep times and weights from 83 different mammals. It has 11 variables.
#' 
## --------------------------------------------------

msleep


#' 
#' ## `filter()` baris / `filter()` rows
#' 
#' Saat bekerja dengan dataset besar, sering kali kita hanya tertarik bekerja dengan sebagian data pada satu waktu. Untuk melakukan ini, kita perlu memfilter dataset agar hanya mencakup baris-baris yang kita minati. Untuk dataset yang “tidy”, ini berarti memilih sebagian dari *observations* atau pengamatan.
#' 
#' > When working with a large data set, you’re often interested in only working with a portion of the data at any one time. To do this, you would want to filter your data set to only include rows you are interested in.  (for a "tidy" data set, this is a subset of the *observations*).
#' 
#' Jika kita hanya tertarik pada waktu tidur Primata, kita dapat memfilter dataset `msleep` agar hanya mencakup data tentang mamalia yang termasuk Primata. Pertama, kita lihat struktur data kita:
#' 
#' > If you were only interested in the sleep times of Primates, we could filter the 'msleep' data set to include only data about those mammals that are also Primates. First, we look at the structure of our data:
#' 
## --------------------------------------------------

str(msleep)          # base R
glimpse(msleep)      # tidyverse


#' 
#' lalu menggunakan `filter()` untuk hanya menyertakan data tentang primata.
#' 
#' > and use `filter()` to include only data on primates
#' 
## --------------------------------------------------

msleep %>% 
  filter(order == "Primates")


#' 
#' Perhatikan bahwa kita bisa melakukan ini tanpa pipe dan mendapatkan hasil yang sama:
#' 
#' > Note that we could do this without a pipe and get the same result:
#' 
## --------------------------------------------------

filter(msleep, order == "Primates")


#' 
#' Kita bisa memfilter dataset lebih lanjut. Misalnya, di sini kita menggunakan `filter()` untuk menampilkan primata yang tidur lebih dari 10 jam:
#' 
#' > We could further filter the data set. For example, here we use `filter()` to show primates that sleep more than 10 hours:
#' 
## --------------------------------------------------

msleep %>%
  filter(order == "Primates", sleep_total > 10)


#' 
#' Kita akan mendapatkan hasil yang persis sama jika menggunakan operator logika `&`:
#' 
#' > We'd get exactly the same result if we used the "&" logical operator:
#' 
## --------------------------------------------------

msleep %>%
  filter(order == "Primates" & sleep_total > 10)


#' 
#' 
#' ### giliran Anda / your turn
#' 
#' Q. Filter dataset `msleep` agar hanya mencakup karnivora, menggunakan variabel `vore`, dengan berat badan lebih dari atau sama dengan 100 kg:
#' 
#' > Q. Filter the 'msleep' data set to include only carnivores (using the 'vore' variable) with body weights greater than or equal to 100 kg:
#' 
#' 
## --------------------------------------------------




#' 
#' 
#' 
#' 
#' 
#' 
#' 
#' 
#' 
#' 
#' 
#' 
#' 
#' 
#' 
#' 
#' 
#' 
#' 
#' 
#' 
#' 
#' 
#' 
#' 
#' 
#' 
#' 
#' 
#' 
#' 
#' 
#' A.
#' 
#' > A.
#' 
## --------------------------------------------------

msleep %>%
  filter(order == "Primates" & sleep_total > 10)

msleep %>%
  filter(vore == "carni", bodywt >= 100)

# OR

myobj <- msleep %>%
  filter(vore == "carni" & bodywt >= 100)



#' 
#' 
#' ## `select()` kolom / `select()` columns
#' 
#' Jika Anda ingin memilih sebagian kolom dari dataset, bukan memilih baris tertentu, kita menggunakan `select()`. Perhatikan, untuk dataset yang “tidy”, ini berarti memilih sebagian dari *variables* atau variabel.
#' 
#' > If you want to choose a subset of your data set's columns, rather than choose particular rows, we use `select()`. Note, for a "tidy" data set, this is a subset of the *variables*.
#' 
#' Mari kita mulai dengan kode di atas yang hanya mencakup primata yang tidur lebih dari 10 jam:
#' 
#' > Let’s start with the code above to only include primates who sleep > 10 hours:
#' 
## --------------------------------------------------

msleep %>%
  filter(order == "Primates" & sleep_total > 10)


#' 
#' lalu bayangkan kita hanya ingin menyertakan kolom pertama, yaitu nama mamalia, dan informasi tidur yang ada dalam kolom `sleep_total`, `sleep_rem`, dan `sleep_cycle`. Kita dapat melakukan ini dengan menambahkan pipe lain, lalu menggunakan fungsi `select()` untuk memilih hanya kolom-kolom tersebut:
#' 
#' > and imagine we only want to include the first column (the name of the mammal) and the sleep information (included in the columns 'sleep_total', 'sleep_rem', and 'sleep_cycle'). We would do this by adding another pipe, and using the function `select()` to choose only these columns:
#' 
## --------------------------------------------------

msleep %>%
  filter(order == "Primates" & sleep_total > 10) %>% 
  select(name, sleep_total, sleep_rem, sleep_cycle)


#' 
#' Catatan: kita bisa melakukan ini tanpa menggunakan operator pipe `%>%`, tetapi kodenya lebih sulit dibaca:
#' 
#' > Note: we could do this without using our pipe operator `%>%`, but the code is harder to read:
#' 
## --------------------------------------------------

select(filter(msleep, order == "Primates", sleep_total > 10), name, sleep_total, sleep_rem, sleep_cycle)



#' 
#' 
#' Perhatikan juga: kita bisa memilih kolom-kolom ini berdasarkan nomornya:
#' 
#' > Also note: we can select these columns based on their number:
#' 
## --------------------------------------------------

msleep %>%
  filter(order == "Primates" & sleep_total > 10) %>% 
  select(1, 6:8)


#' 
#' Perhatikan juga: kita bisa memilih *semua kecuali* kolom tertentu, yaitu mengecualikan kolom tertentu:
#' 
#' > Also note: we can select *everything but* (i.e., exclude) specified columns, too:
#' 
## --------------------------------------------------

msleep %>%
  filter(order == "Primates" & sleep_total > 10) %>% 
    select(-c(sleep_rem, sleep_cycle))


msleep %>%
  filter(order == "Primates" & sleep_total > 10) %>% 
    select(-c(6:11)) %>% 
    select(1:3)


#' 
#' 
#' ### giliran Anda / your turn
#' 
#' Q. Mulai dengan dataset `msleep`, lalu pilih hanya baris untuk karnivora menggunakan variabel `vore`. Setelah itu, tampilkan hanya kolom `name`, `genus`, `order`, dan `bodywt`.
#' 
#' > Q. Start with the 'msleep' data set and choose only rows for carnivores (using the 'vore' variable), then show only the columns name, genus, order, and bodywt
#' 
## --------------------------------------------------




#' 
#' 
#' 
#' 
#' 
#' 
#' 
#' 
#' 
#' 
#' 
#' 
#' 
#' 
#' 
#' 
#' 
#' 
#' 
#' 
#' 
#' 
#' 
#' 
#' 
#' 
#' 
#' 
#' 
#' 
#' 
#' 
#' 
#' 
#' 
#' 
#' 
#' 
#' 
#' 
#' 
#' 
#' 
#' 
#' 
#' 
#' 
#' 
#' 
## --------------------------------------------------

msleep %>%
  filter(vore == "carni") %>% 
  select(name, genus, order, bodywt)

# OR

msleep %>%
  filter(vore == "carni") %>% 
  select(1, 2, 4, 11)


#' 
#' Jadi, kita menggunakan `filter()` untuk memilih baris, dan `select()` untuk memilih kolom. Bagaimana cara mengingatnya? Saya memakai trik sederhana: `filter()` memiliki huruf “r”, jadi kita menggunakannya untuk memilih *Rows* atau baris; `select()` memiliki huruf “c”, jadi kita menggunakannya untuk memilih *Columns* atau kolom.
#' 
#' > So, we use `filter()` to choose rows, `select()` to choose columns. How do you keep these straight? I use a simple memory trick: `filter()` has an "r", so we use it to choose Rows; `select()` has a "c", so we use it to choose Columns. 
#' 
#' 
#' ## mengganti nama kolom saat menggunakan `select()` / renaming columns while using `select()`
#' 
#' `select()` juga dapat digunakan untuk mengganti nama kolom. Sintaksnya adalah: `new_column_name = old_column_name` di dalam `select()`. Contohnya:
#' 
#' > `select()` can also be used to rename columns. The syntax is: `new_column_name = old_column_name` within `select()`. For example:
#' 
## --------------------------------------------------

msleep %>%
  filter(order == "Primates" & sleep_total > 10) %>% 
  select(name, total = sleep_total, rem = sleep_rem, cycle = sleep_cycle)

# this is nicer to look at:

msleep %>%
  filter(order == "Primates" & sleep_total > 10) %>% 
  select(name, 
         total = sleep_total, 
         another = sleep_rem, 
         cycle = sleep_cycle)

# this also works

msleep %>%
  filter(order == "Primates" & sleep_total > 10) %>% 
  select(1, total = 6, rem = 7, cycle = 8)


#' 
#' ## `rename()` / `rename()`
#' 
#' Saat menggunakan `select()` untuk mengganti nama kolom, hanya kolom yang ditentukan yang akan disertakan dan diganti namanya dalam output. Jika kita ingin mengubah nama satu atau beberapa kolom tetapi tetap mengembalikan semua kolom dalam output, kita menggunakan `rename()`. Sebagai contoh, kode berikut mengembalikan data frame dengan semua 11 kolom, di mana nama tiga kolom yang ditentukan di dalam fungsi `rename()` telah diganti.
#' 
#' > When using `select()` to rename columns, only the specified columns will be included and renamed in the output. If we, instead, want to change the names of a column(s) but return all columns in your output, we use `rename()`. For example, the following, returns a data frame with all 11 columns, where the column names for three columns specified within `rename()` function have been renamed.
#' 
## --------------------------------------------------

msleep %>%
  filter(order == "Primates", sleep_total > 10) %>%
  rename(total = sleep_total, 
         rem = sleep_rem, 
         cycle = sleep_cycle)


#' 
#' ## mengatur ulang data / re-ordering data
#' 
#' ### kolom menggunakan `select()` / columns using `select()`
#' 
#' `select()` dapat mengubah urutan kolom yang ditampilkan. Cukup tuliskan kolom-kolom tersebut dalam urutan yang Anda inginkan.
#' 
#' > `select()` can change the order in which the columns are returned. Simply list them in the order you want.
#' 
## --------------------------------------------------

msleep %>%
  filter(order == "Primates" & sleep_total > 10) %>% 
  select(name, sleep_total, sleep_rem, sleep_cycle)

# compare with:

msleep %>%
  filter(order == "Primates" & sleep_total > 10) %>% 
  select(sleep_cycle, sleep_total, sleep_rem, sleep_cycle, name)


#' 
#' 
#' ### baris dengan `arrange()` / rows with `arrange()`
#' 
#' Baris juga dapat diatur ulang menggunakan `arrange()`, yang secara default mengurutkan pengamatan secara menaik, dari yang terkecil ke yang terbesar, berdasarkan nilai dari variabel tertentu. Melanjutkan contoh di atas, untuk mengurutkan baris berdasarkan total waktu tidur setiap mamalia, kita akan menggunakan sintaks berikut:
#' 
#' > Rows can also be reordered, using `arrange()`, which by default lists observations in ascending order (from smallest to largest) based on the value of a particular variable. Continuing on from our example above, to now sort our rows by the amount of total sleep each mammal gets, we would use the following syntax:
#' 
## --------------------------------------------------

msleep %>%
  filter(order == "Primates" & sleep_total > 10) %>% 
  select(name, sleep_total, sleep_rem, sleep_cycle) %>% 
  arrange(sleep_total)


#' 
#' Ini juga bekerja pada variabel karakter, yang diurutkan secara alfabetis dari A sampai Z:
#' 
#' > This works on character variables, too. Which are ordered alphabetically from A-Z:
#' 
## --------------------------------------------------

msleep %>%
  filter(order == "Primates" & sleep_total > 10) %>% 
  select(name, sleep_total, sleep_rem, sleep_cycle) %>% 
  arrange(name)


#' 
#' Keduanya dapat diurutkan secara menurun dengan menggunakan `arrange(desc())`:
#' 
#' > Either of these can be sorted in descending order by using `arrange(desc())`:
#' 
## --------------------------------------------------

msleep %>%
  filter(order == "Primates" & sleep_total > 10) %>% 
  select(name, sleep_total, sleep_rem, sleep_cycle) %>% 
  arrange(desc(sleep_total))

# substituting "-" for "desc" also works:

msleep %>%
  filter(order == "Primates" & sleep_total > 10) %>% 
  select(name, sleep_total, sleep_rem, sleep_cycle) %>% 
  arrange(-(sleep_total))


#' 
#' Ini juga bekerja pada variabel karakter, yang diurutkan secara alfabetis dari Z sampai A:
#' 
#' > This works on character variables, too. Which are ordered alphabetically from Z-A:
#' 
## --------------------------------------------------

msleep %>%
  filter(order == "Primates" & sleep_total > 10) %>% 
  select(name, sleep_total, sleep_rem, sleep_cycle) %>% 
  arrange(desc(name))


#' 
#' Kita juga bisa mengurutkan data berdasarkan beberapa kriteria. Data akan diurutkan sesuai urutan kriteria yang kita tuliskan:
#' 
#' > We can also sort things based on multiple criteria, they are sorted in the order we list:
#' 
## --------------------------------------------------

msleep %>%
  filter(order == "Primates" & sleep_total > 10) %>% 
  select(name, sleep_total, bodywt) %>% 
  arrange(bodywt, name)

# cf

msleep %>%
  filter(order == "Primates" & sleep_total > 10) %>% 
  select(name, sleep_total, bodywt) %>% 
  arrange(name, bodywt)


#' 
#' ### giliran Anda / your turn
#' 
#' Q. Mulai dengan dataset `msleep`, lalu pilih hanya baris untuk karnivora menggunakan variabel `vore`, tampilkan hanya kolom `name`, `genus`, `order`, dan `bodywt`, lalu urutkan berdasarkan `order` dan kemudian berat badan.
#' 
#' > A. Q. Start with the 'msleep' data set and choose only rows for carnivores (using the 'vore' variable), show only the columns name, genus, order, and bodywt, and sort these by order and then body weight
#' 
## --------------------------------------------------




#' 
#' 
#' 
#' 
#' 
#' 
#' 
#' 
#' 
#' 
#' 
#' 
#' 
#' 
#' 
#' 
#' 
#' 
#' 
#' 
#' 
#' 
#' 
#' 
#' 
#' 
#' 
#' 
#' 
#' 
#' 
#' 
#' 
#' 
#' 
#' 
#' A.
#' 
#' > A.
#' 
## --------------------------------------------------

msleep %>%
  filter(vore == "carni") %>% 
  select(name, genus, order, bodywt) %>% 
  arrange(order, bodywt)


#' 
#' 
#' ## `mutate()` untuk membuat kolom baru / `mutate()` to create new columns
#' 
#' Sering kali, kita ingin membuat kolom baru. Ini adalah tugas `mutate()`. Misalnya, kita dapat mengubah `sleep_total` dari satuan jam menjadi menit dengan mengalikannya dengan 60.
#' 
#' > Often, we want to create new columns. This is the job of `mutate()`. For example, we could convert the 'sleep_total' from its original hours to seconds by multiplying by 60. 
#' 
## --------------------------------------------------

msleep %>% 
  mutate(sleep_sec = sleep_total * 60)


#' 
#' Kita bisa memilih hanya beberapa kolom agar lebih mudah melihat bahwa perintah tersebut berhasil:
#' 
#' > We can select just a few columns to make it easier to see that it worked:
#' 
## --------------------------------------------------

msleep %>% 
  mutate(sleep_sec = sleep_total * 60) %>% 
  select(name, sleep_sec)


#' 
#' Perhatikan bahwa kita membuat kolom baru pada baris kedua, dan dapat langsung menggunakannya pada baris berikutnya, atau baris mana pun setelahnya.
#' 
#' > Note that we created the new column in the second row, and can immediately use it in the next row (or any subsequent row)
#' 
#' 
#' ## mengelompokkan data / grouping data
#' 
#' Sering kali kita ingin mendeskripsikan data dengan mendeskripsikan subset data yang berbeda. Untuk melakukan ini, kita mengelompokkan data menggunakan `group_by()`. Jika digunakan sendiri, fungsi ini tidak terlalu berguna:
#' 
#' > Often we want to describe our data by describing different subsets of the data. To do this, we group our data using `group_by()`. On its own, it isn't that useful:
#' 
## --------------------------------------------------

msleep

msleep %>% 
  group_by(order)


#' 
#' Di sini, yang dilakukan `group_by()` hanyalah menambahkan informasi tentang jumlah kelompok di bagian atas tibble. Tetapi fungsi ini menjadi sangat berguna ketika dipasangkan dengan fungsi berikutnya.
#' 
#' > Here, all that `group_by()` has done has added information on the number of groups at the top of the tibble. But it is incredibly useful when paired with our next function.
#' 
#' 
#' ## meringkas data dengan `summarize()` / summarizing data with `summarize()`
#' 
#' `summarize()` menghitung statistik ringkasan dari data yang diberikan kepadanya melalui pipe. Di sini kita menggunakannya untuk menghitung berapa banyak baris dalam dataset kita:
#' 
#' > `summarize()` calculates summary statistics of the data piped to it. Here we use it to count how many rows in our data set:
#' 
## --------------------------------------------------

msleep %>%
  summarize(N = n())


#' 
#' Hasil sederhana ini juga bisa diperoleh dengan mengetik `nrow()`:
#' 
#' > This simple result could also be obtained by typing `nrow()`:
#' 
## --------------------------------------------------

nrow(msleep)


#' 
#' Namun, biasanya kita menggabungkan `summarize()` dengan `group_by()` untuk menghitung sesuatu untuk subset data yang berbeda. Misalnya, kita dapat menghitung jumlah pengamatan dalam setiap `order` menggunakan `n()`:
#' 
#' > Typically, though, we combine `summarize()` with `group_by()` to calculate things for different subsets of the data. For example, we could calculate the number of observations in each order using `n()`:
#' 
## --------------------------------------------------

msleep %>%
  group_by(order) %>% 
  summarize(N = n())

msleep %>%
  group_by(order) %>% 
  summarize(count = n())


#' 
#' Ada cara lain untuk meringkas data menggunakan `summarize()`, seperti `mean()`, `median()`, `min()`, dan `max()`.
#' 
#' > There are other ways in which the data can be summarized using `summarize()`, such as `mean()`, `median()`, `min()`, and `max()`.
#' 
#' Misalnya, kita dapat menghitung rata-rata total waktu tidur untuk setiap `order` mamalia:
#' 
#' > For example, we could calculate the average (mean) total sleep each order of mammal got:
#' 
## --------------------------------------------------

msleep %>%
  group_by(order) %>% 
  summarize(N = n(), 
            mean_sleep = mean(sleep_total),
            max = max(sleep_total))


#' 
#' 
#' ### giliran Anda / your turn
#' 
#' Q. Untuk setiap kelompok makanan (`vore`), tampilkan jumlah sampel, serta nilai minimum dan maksimum untuk variabel `bodywt`.
#' 
#' > Q. For each dietary group ('vore') list the number of samples, and the minimum and the maximum value for the variable 'bodywt'
#' 
#' 
#' 
#' 
#' 
#' 
#' 
#' 
#' 
#' 
#' 
#' 
#' 
#' 
#' 
#' 
#' 
#' 
#' 
#' 
#' 
#' 
#' 
#' 
#' 
#' 
#' 
#' 
#' 
#' 
#' 
#' 
#' 
#' 
#' 
#' 
#' 
#' A.
#' 
#' > A. 
#' 
## --------------------------------------------------

msleep %>%
  group_by(vore) %>% 
  summarize(N = n(), 
            min_size = min(bodywt),
            max_size = max(bodywt))


#' 
#' Bayangkan bahwa alih-alih dua kolom untuk nilai minimum dan maksimum, kita ingin satu kolom bernama `range` yang mencantumkan rentang berat badan dan dipisahkan dengan tanda hubung. Kita bisa menggunakan fungsi `unite()` yang kita lihat sebelumnya:
#' 
#' > Let's imagine that instead of two columns for min and max, we want a single column called range that lists the range of body weights separated by a dash. We can use a the `unite()` function we saw last time:
#' 
## --------------------------------------------------

msleep %>%
  group_by(vore) %>% 
  summarize(N = n(), 
            min_size = min(bodywt),
            max_size = max(bodywt)) %>% 
  unite(range, min_size, max_size, sep = "-")


#' 
#' 
#' Ada fungsi lain dalam `{dplyr}` yang kurang lebih mereplikasi hal-hal yang sudah kita lihat di atas, termasuk `tally()` dan `count()`. Anda bisa mengeksplorasinya sendiri jika tertarik.
#' 
#' > There are other functions in {dplyr} that more or less replicate things we've seen above, including `tally()` and `count()`. You can explore them on your own, if you like.
#' 
#' Catatan: Anda bisa menggunakan `group_by()` untuk beberapa hal sekaligus:
#' 
#' > Note: you can `group_by()` multiple things at once:
#' 
## --------------------------------------------------

msleep %>%
  group_by(vore, order) %>% 
  summarize(N = n(), 
            min_size = min(bodywt),
            max_size = max(bodywt)) %>% 
  print(n = Inf)


#' 
#' Saat kita menggunakan `group_by()` untuk beberapa variabel, urutannya penting:
#' 
#' > When we `group_by()` multiple variables, the order matters:
#' 
## --------------------------------------------------

msleep %>%
  group_by(vore, order) %>% 
  summarize(N = n())%>% 
  print(n = Inf)

msleep %>%
  group_by(order, vore) %>% 
  summarize(N = n())%>% 
  print(n = Inf)


#' 
#' ## mengidentifikasi duplikat dengan `get_dupes()` / identifying duplicates with `get_dupes()`
#' 
#' Fungsi `get_dupes()` sangat membantu untuk mengidentifikasi entri duplikat. Anda menentukan bagaimana duplikat didefinisikan selama proses *data wrangling*. Anda akan menggunakan fungsi ini dan menentukan kolom mana yang ingin diperiksa untuk mencari duplikat.
#' 
#' > The `get_dupes()` function is very helpful to identify duplicate entries. You specify how you define duplicates during data wrangling, you’ll use this function and specify which columns you’re looking for duplicates in.
#' 
## --------------------------------------------------

msleep %>% 
  get_dupes(genus, vore)


#' 
#' Jika Anda tidak menentukan kolom, fungsi ini akan mencari duplikat yang persis sama di semua kolom.
#' 
#' > if you don't specify, it looks for perfect duplicates
#' 
## --------------------------------------------------

msleep %>% 
  get_dupes()


#' 
#' Mari kita uji bahwa fungsi ini bekerja. Kita memilih sebagian baris dalam dataset, yaitu primata, menyimpannya sebagai dataset baru, lalu menggabungkan dua dataset menggunakan `bind_rows()` dan mencari duplikat lagi:
#' 
#' > Let's test that this works. We choose a subset of rows in the data set (the primates), save this as a new data set, then add the two data sets together using `bind_rows()` and search again for dupes:
#' 
## --------------------------------------------------

primates <- msleep %>%
  filter(order == "Primates")
primates

new_data <- bind_rows(msleep, primates)
new_data

new_data %>% 
    get_dupes()


