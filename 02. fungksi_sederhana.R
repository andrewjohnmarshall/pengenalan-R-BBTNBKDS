#' 
#' # Latihan R di BBTNBKDS / R Training at BBTNBKDS
#' ## 2026-06-29 s/d 2026-06
#' ## disampikan oleh Andy Marshall, Universitas Michigan
#' 
#' # Pengantar fungsi R / Introduction to R functions
#' 
#' Kita akan memulai perjalanan R kita dengan salah satu komponen paling dasar dalam pemrograman R: fungsi. Menulis fungsi adalah langkah penting untuk berpindah dari pengguna R tingkat dasar menjadi pengguna yang lebih mahir. Karena itu, fungsi biasanya baru diperkenalkan jauh lebih belakangan kepada pengguna R baru. Tetapi menurut saya, hal ini justru membuat fungsi terasa lebih misterius daripada seharusnya. Jadi, kita akan mulai menggunakan fungsi sejak awal. Ini akan membantu Anda menjadi bukan hanya pengguna R, tetapi juga pemrogram R.
#' 
#' > We'll start our R journey with the of most fundamental components of R programming: functions. Writing functions is an important step in moving from a basic dabbler in R to a more advanced user. As such, functions are usually introduced much later to new R users than this. But I have come to think this mystifies them unduly. So we are going to start using functions from the beginning. This will help you become not just an R user, but an R programmer.
#' 
#' Pertama-tama, apa itu fungsi? Sebenarnya, hampir semua hal di R adalah fungsi. Fungsi adalah instruksi yang menerima beberapa input atau *argument*, menggunakannya untuk menghitung nilai tertentu, lalu mengembalikan hasil. Biasanya fungsi memiliki tiga bagian ini: input, perhitungan, dan output. Tidak semua fungsi selalu memiliki semuanya, tetapi untuk sekarang kita akan fokus pada fungsi dasar.
#' 
#' > First of all, what is a function? Well, almost everything in R is a function. Functions are instructions that take some inputs (arguments), use them to compute some value(s), and return result(s). Functions typically include all three: inputs, computations, and outputs. Not all do, but we'll focus on the basic ones for now. 
#' 
#' Ada banyak fungsi yang sudah tersedia di R, misalnya `c()` dan `help()`. Tetapi kita juga bisa mendefinisikan atau membuat fungsi sendiri. Hari ini kita akan belajar caranya.
#' 
#' > There are many functions built into R (e.g., c(), help()). But we can also define (create) them ourselves. Today we'll learn how.
#' 
#' ## sintaks dasar / basic syntax
#' 
#' *namafungsi* <- function(*input*) {
#'                          *perhitungan*
#'                          return(*hasil*)
#' }
#' 
#' > *functionname* <- function(*inputs*) {
#' >                          *computations*
#' >                          return(*results*)
#' > }
#' 
#' Teks yang *dicetak miring* menunjukkan bagian yang bisa Anda ubah.
#' 
#' > *highlighted* text indicates text you can change
#' 
#' ## contoh sederhana / simple examples
#' 
#' Buat fungsi khusus untuk menghitung rata-rata dari beberapa angka.
#' 
#' > Make a custom function to calculate the mean of a number
#' 
## -----------------------------------------------------------------

mymean <- function(a) {
     calc <- sum(a)/length(a)
     return(calc)
}

y <- c(rep(1, 9), rep(2, 15), rep(3,26), rep(4, 10))

mymean(y)
mean(y)


#' 
#' ## giliran Anda / your turn
#' 
#' Q1) Tulis sebuah fungsi untuk mengembalikan kebalikan dari sebuah angka. Sebagai pengingat, kebalikan dari sebuah angka, `x`, adalah `1/x`.
#' 
#' > Q1) write a function to return the reciprocal of a number. (Reminder, the reciprocal of a number, x, is 1/x).
#' 
#' Masukkan jawaban Anda di potongan kode di bawah ini:
#' 
#' > Put your answer in the code snippet below:
#' 
## -----------------------------------------------------------------


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
#' A1) contoh jawaban
#' 
#' > A1) sample answer
#' 
## -----------------------------------------------------------------

myrecip <- function(k) {
     h <- 1/k
     return(h)
}

myrecip(10)
myrecip(3)
myrecip(y)


#' 
#' 
#' 
#' 
#' 2) Tulis sebuah fungsi untuk membulatkan angka ke bilangan bulat terdekat. Petunjuk:
#' 
#' > 2) write a function to round a number to the nearest whole number. Hint:
#' 
## -----------------------------------------------------------------

pi
round(pi, digits = 3)
round(pi, digits = 1)


#' 
#' 
## -----------------------------------------------------------------




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
## -----------------------------------------------------------------

roundR <- function(r) {
     result <- round(r, digits = 0)
     return(result)
}

roundR(23.7)
roundR(2.1)

# could also add  a second argument
roundR_2 <- function(r,  d) {
     result <- round(r, digits = d)
     return(result)
}

roundR_2(23.7, 0)
roundR_2(24.678, 2)


#' 
#' 
#' 
#' # Mengapa menggunakan fungsi? / Why use functions?
#' 
#' Menggunakan fungsi memberikan banyak manfaat, termasuk:
#' 
#' > Using functions offers many benefits, including
#' 
#' • menghindari pengulangan = menghemat waktu!, dan menghindari kesalahan. Fungsi memungkinkan kita menggunakan kembali kode tanpa harus menulis ulang kode yang sama.
#' 
#' > • avoiding repetitions = saving time!, avoiding mistakes. Functions allow us to reuse code without repeating ourselves
#' 
#' • memberi struktur pada kode kita sehingga lebih mudah dibaca dan dipahami.
#' 
#' > • imposing structure on our codefunction making it easier to read and understand
#' 
#' • membantu proses *debugging* = seperti yang mungkin sudah Anda alami dalam kehidupan sehari-hari, segala sesuatu jarang berjalan persis sesuai rencana. Saat kita menulis kode, kita perlu mempersiapkan dan mengantisipasi kemungkinan bahwa kode kita bisa mengalami masalah.
#' 
#' > • helping with debugging = as you may have noticed in your own lives, things rarely go according to plan. When we code,	we need to prepare for, to anticipate, the fact that our code could run into problems.
#' 
#' Mari kita lihat sebuah contoh:
#' 
#' > Let's look at example:
#' 
#' Kita menghitung standar deviasi secara “manual”, menggunakan rumus standar:
#' 
#' > We "manually" calculate a standard deviation, using the standard formula:
#'  
## -----------------------------------------------------------------

sqrt(sum((x - mean(x))^2) / (length(x) - 1))


#' 
#' Gunakan kode tersebut tiga kali dengan cara menyalin kode dan mengganti nama objek.
#' 
#' > use the code three times by copying and changing the names of the objects
#' 
## -----------------------------------------------------------------

# randomly sample three vectors from normal distribution
set.seed(133) # pseudo randomization
x1 <- rnorm(1000, mean = 0, sd = 1.0)
x2 <- rnorm(1000, 0, 1.5)
x3 <- rnorm(1000, 0, 5.0)

# calculate standard deviation once ...
sd1 <- sqrt(sum((x1 - mean(x1))^2) / (length(x1) - 1))

# ... twice, ...
sd2 <- sqrt(sum((x2 - mean(x2))^2) / (length(x2) - 1))

# ... three times ...
sd3 <- sqrt(sum((x3 - mean(x2))^2) / (length(x3) - 1))

# ... and return the three answers
c(sd1, sd2, sd3)
# slightly nicer output
c(sd1 = sd1, sd2 = sd2, sd3 = sd3)

# compare to correct answers
c(sd1_correct = sd(x1),
  sd2_correct = sd(x2),
  sd3_correct = sd(x3))


#' 
#' Apakah Anda bisa menemukan kesalahannya?
#' 
#' > Can you spot an error?
#' 
#' Catatan: Anda bisa membandingkan hasil-hasil ini dengan lebih mudah dengan menyimpannya sebagai objek, lalu membandingkan jawabannya:
#' 
#' > Note, you could compare these more easily by assigning them to objects and comparing the answers:
#' 
## -----------------------------------------------------------------

hand_calcs   <- c(sd1, sd2, sd3)
correct_vals <- c(sd(x1), sd(x2), sd(x3))

hand_calcs == correct_vals


#' 
#' Buat sebuah fungsi:
#' 
#' > create a function:
#' 
## -----------------------------------------------------------------

mysd <- function(x) {
  res <- sqrt(sum((x - mean(x))^2) / (length(x) - 1))
  return(res)
}


#' 
#' lalu gunakan fungsi tersebut.
#' 
#' > and use it
#' 
## -----------------------------------------------------------------

# calculate standard deviation using function
sd1 <- mysd(x1)
sd2 <- mysd(x2)
sd3 <- mysd(x3)

# return the three answers
c(sd1 = sd1, sd2 = sd2, sd3 = sd3)
# compare to correct answers
c(sd1_correct = sd(x1),
  sd2_correct = sd(x2),
  sd3_correct = sd(x3))


#' 
#' Apa yang kita pelajari?
#' 
#' > What did we learn?
#' 
#' 
#' # Fungsi yang lebih lanjut / More advanced functions
#' 
#' Jadi, kita sudah belajar bahwa fungsi adalah sebuah objek yang biasanya menerima beberapa *argument*, melakukan satu atau beberapa *action*, lalu mengembalikan sebuah *output*. Sebagai pengingat, struktur dasarnya adalah:
#' 
#' > So, we have learned that a function is an object that (usually) takes some *arguments*, performs some *action(s)*, and returns some *output.* As a reminder, the basic structure is:
#' 
#' name <- function(*arguments*) {
#'   *action(s)*
#'   return(*output*)
#' }
#' 
#' > name <- function(*arguments*) {
#' >   *action(s)*
#' >   return(*output*)
#' > }
#' 
#' Sebagai contoh, kita menulis fungsi untuk membulatkan angka ke bilangan bulat terdekat:
#' 
#' > For example, we wrote a function to round a number to the nearest whole number:
#' 
## -----------------------------------------------------------------

my_round <- function(x) {
     calc <- round(x)
     return(calc)
}

my_round(10.67)
my_round(pi)


#' 
#' Sekarang kita akan memperluas kotak alat fungsi kita dalam beberapa cara. Ini akan memberi kita fleksibilitas dan kekuatan yang lebih besar.
#' 
#' > Now we're going to expand our functions toolbox in a few ways, which will allow us greater flexibility and power.
#' 
#' ## menentukan beberapa input / specifying multiple inputs
#' 
#' Anda bisa membuat fungsi dengan sebanyak mungkin input sesuai kebutuhan. Sebagai contoh, kita akan membuat fungsi bernama `coffee_budget()` yang memperkirakan berapa banyak uang yang Anda habiskan untuk minuman berkafein dalam periode waktu tertentu.
#' 
#' > You can create functions with as many inputs as you’d like. As an example, we’ll create a function called `coffee_budget()` that estimates how much you spend on caffeinated drinks in a given period of time.
#' 
#' Fungsi ini akan menerima tiga input:
#' 
#' > The function will take three inputs:
#' 
#' `drip`: jumlah pesanan kopi seduh biasa, misalnya cafe Americano atau cappuccino.
#' 
#' > drip: the number of orders of basic drip coffee (e.g., cafe Americano, cappuccino)
#' 
#' `espresso`: jumlah pesanan minuman berbasis espresso, misalnya macchiato atau latte.
#' 
#' > espresso: the number of orders of espresso-based drinks (e.g., macchiato, latte)
#' 
#' `specials`: jumlah pesanan minuman spesial musiman, misalnya pumpkin spice latte.
#' 
#' > specials: the number of orders of seasonal specialty drinks (e.g., pumpkin spice latte)
#' 
#' Kita akan berasumsi bahwa harga minuman ini adalah:
#' 
#' > We’ll assume that these drinks cost:
#' 
#' drip:     $3.50  
#' espresso: $5.25  
#' special:  $6.50
#' 
#' > drip:     $3.50  
#' > espresso: $5.25  
#' > special:  $6.50
#' 
## -----------------------------------------------------------------

coffee_budget <- function(drip,
                          espresso,
                          special) {

  output <- drip * 3.5 + 
            espresso * 5.25 + 
            special * 6.5

  return(output)
}


#' 
#' Sekarang mari kita uji fungsi baru kita dengan beberapa nilai input yang berbeda. Berapa dolar yang dihabiskan Max jika ia memesan 3 kopi drip, 1 espresso, dan 5 minuman spesial?
#' 
#' > Now let’s test our new function with a few different values for the inputs. How many dollars did Max spend if he ordered 3 drip coffees, 1 espresso, and 5 specials?
#' 
## -----------------------------------------------------------------

coffee_budget(drip = 3,
              espresso = 1,
              special = 5)


#' 
#' $48.25. Wah, lumayan juga! Bagaimana dengan Jo, yang minum dua kopi drip setiap hari, dan satu minuman spesial pada hari Jumat?
#' 
#' > $48.25. Yikes! How about Jo, who drinks two drip coffees a day, and a special on Fridays?
#' 
## -----------------------------------------------------------------

coffee_budget(drip = 2 * 7,
              espresso = 0,
              special = 1)


#' 
#' $55.50. Dan Arlo, yang memesan satu minuman spesial setiap pagi dan satu espresso setelah makan siang pada hari kerja, menghabiskan:
#' 
#' > $55.50. And Arlo, who orders a special every morning and an espresso after lunch on weekdays, spends:
#' 
## -----------------------------------------------------------------

coffee_budget(drip = 0,
              espresso = 5,
              special = 7)


#' 
#' $71.75. Hampir 300 dolar sebulan.
#' 
#' > $71.75. Almost 300 dollars a month.
#' 
#' 
#' ### giliran Anda / your turn
#' 
#' Q1. Modifikasi fungsi `coffee_budget()` kita untuk menghitung berapa banyak uang yang dihabiskan seseorang untuk kopi dalam satu tahun. Untuk latihan ini, Anda bisa berasumsi bahwa pengguna akan memberikan daftar jumlah minuman kopi dalam satu minggu.
#' 
#' > Q1. Modify our `coffee_budget()` function to calculate how much money someone spends in a year on coffee. For the purposes of this exercise, you can assume that your user will provide a list of the number of coffee drinks in a week.
#' 
#' Q2. Dengan menggunakan fungsi Anda, hitung berapa banyak uang yang akan dihabiskan seseorang untuk kopi jika mereka membeli satu kopi drip setiap hari kerja, satu minuman spesial pada hari Sabtu, dan dua espresso pada hari Minggu.
#' 
#' > Q2. Using your function, calculate how much someone would spend on coffee if they buy a drip coffee each day of the work week, a special on Saturdays, and two espressos on Sunday.
#' 
#' Berikut kode aslinya:
#' 
#' > Here's the original code:
#' 
## -----------------------------------------------------------------

coffee_budget <- function(drip,
                          espresso,
                          special) {

  output <- drip * 3.5 + 
            espresso * 5.25 + 
            special * 6.5

  return(output)
}


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
#' A1. Ada 52 minggu dalam satu tahun:
#' 
#' > A1. 52 weeks in a year:
#' 
## -----------------------------------------------------------------

coffee_budget2 <- function(drip,
                          espresso,
                          special) {

  output <- 52 * (drip * 3.5 + 
            espresso * 5.25 + 
            special * 6.5)

  return(output)
}


#' 
#' 
#' A2. Dengan menggunakan fungsi Anda, hitung berapa banyak uang yang akan dihabiskan seseorang untuk kopi jika mereka membeli satu kopi drip setiap hari kerja, satu minuman spesial pada hari Sabtu, dan dua espresso pada hari Minggu.
#' 
#' > A2. Using your function, calculate how much someone would spend on coffee if they buy a drip coffee every workday of the week, a special on Saturdays, and two espressos on Sunday.
#' 
## -----------------------------------------------------------------

coffee_budget2(drip = 5,
              espresso = 2,
              special = 1)


#' 
#' $1,794.
#' 
#' > $1,794.
#' 
#' 
#' ## menyertakan nilai default untuk argument / including default values for arguments
#' 
#' Saat kita membuat fungsi dengan banyak input, sering kali berguna untuk menambahkan nilai default yang akan digunakan fungsi jika pengguna tidak menentukan nilainya sendiri. Sebagian besar fungsi di R memiliki nilai default. Misalnya, saat kita membuat *scatter plot*, R menggunakan nilai default untuk input seperti simbol titik, label sumbu, tema, dan lain-lain. Menyertakan nilai default dapat menghemat banyak waktu bagi pengguna, karena mereka tidak perlu menentukan setiap kemungkinan input untuk sebuah fungsi.
#' 
#' > When we create functions with many inputs, it is often useful to add default values that the function will use if the user does not specify their own. Most functions in R have default values. For example, when we make a scatter plot it uses default values for inputs like plotting characters, axis labels, theme, etc. Including defaults can save the user a lot of time because it keeps them from having to specify every possible input to a function.
#' 
#' Untuk menambahkan nilai default ke input fungsi, kita cukup menuliskan nilai default tersebut setelah setiap argument.
#' 
#' > To add a default value to a function input, we simply include our default values after each argument. 
#' 
#' Sebagai contoh, di bawah ini kita menetapkan nilai default 0 untuk setiap jenis minuman kopi dalam fungsi kita. Dengan melakukan ini, R akan menetapkan input apa pun yang tidak ditentukan oleh pengguna menjadi 0. Dengan kata lain, R akan berasumsi bahwa jika Anda tidak memberi tahu berapa banyak minuman dari jenis tertentu yang Anda minum, maka jumlahnya adalah 0.
#' 
#' > For example, below we set default values of 0 for each type of coffee drink in our function. By doing this, R will set any inputs that the user does not specify to 0 – in other words, it will assume that if you don’t tell it how many drinks of a certain type you had, then you must have had 0.
#' 
## -----------------------------------------------------------------

coffee_budget3 <- function(drip = 0,
                          espresso = 0,
                          special = 0) {

  output <- drip * 3.5 + 
            espresso * 5.25 + 
            special * 6.5

  return(output)
}


#' 
#' Mari kita uji versi baru fungsi kita dengan data untuk seseorang yang minum 5 kopi drip tetapi tidak minum espresso atau minuman spesial. Karena 0 adalah nilai default, kita bisa mengabaikan argument tersebut:
#' 
#' > Let’s test the new version of our function with data for someone, who had 5 drip coffees but no espressos or specials. Because 0 is the default, we can just ignore these arguments:
#' 
## -----------------------------------------------------------------

coffee_budget3(drip = 5)


#' 
#' $17,50. Perhatikan, jika kita mencoba ini dengan fungsi asli kita `coffee_budget()`, kita akan mendapatkan pesan error.
#' 
#' > $17,50. Note, if we tried this with our original function `coffee_budget()`, we get an error message. 
#' 
## -----------------------------------------------------------------

coffee_budget <- function(drip,
                          espresso,
                          special) {

  output <- drip * 3.5 + 
            espresso * 5.25 + 
            special * 6.5

  return(output)
}

coffee_budget(drip = 5)


#' 
#' Jadi, menetapkan nilai default yang masuk akal membuat fungsi kita lebih kuat dan lebih mudah digunakan. Singkatnya, fungsi menjadi kode R lebih baik.
#' 
#' > So setting reasonable defaults makes our functions more robust and easier to use. In a word, it makes them better.
#' ````
