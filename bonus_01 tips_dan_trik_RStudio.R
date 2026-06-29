#' 
#' # Latihan R di BBTNBKDS / R Training at BBTNBKDS
#' ## 2026-06-29 s/d 2026-06
#' ## disampikan oleh Andy Marshall, Universitas Michigan 
#' 
#' # Tips dan trik RStudio / RStudio tips and tricks
#' 
#' ## Pemeriksaan ejaan / Spell checking 
#' 
#' Dalam dokumen R Markdown, Anda bisa memeriksa ejaan dengan beberapa cara:
#' 
#' > in an RMarkdown document, you can check spelling:
#' 
#'   - **Edit > Check Spelling...**
#'   - tombol pemeriksa ejaan di sebelah kanan tombol simpan
#'   - tombol **[F7]** — kadang-kadang, tergantung pengaturan
#' 
#' >   - Edit > Check Spelling...
#' >   - The spell check button to the right of the save button
#' >   - The [F7] key (sometimes, depends on settings)
#' 
#' Anda bisa mengubah bahasa default di pengaturan global, misalnya untuk menambahkan Bahasa Indonesia.
#' 
#' > You can change the default language in the Global settings to add, for example, Indonesian.
#' 
#' 
#' ## Pintasan keyboard / Keyboard shortcuts
#' 
#' **Tools -> Keyboard Shortcuts Help**
#' 
#' ATAU
#' 
#' <https://support.rstudio.com/hc/en-us/articles/200711853-Keyboard-Shortcuts>
#' 
#' > Tools -> Keyboard Shortcuts Help
#' > OR
#' > https://support.rstudio.com/hc/en-us/articles/200711853-Keyboard-Shortcuts
#' 
#' Yang sering saya gunakan:
#' 
#' > Ones I use all the time:
#' 
#' di mana saja, untuk Mac:
#' 
#' > anywhere (Mac):
#' 
#' - **Cmd+Shift+O**  : menampilkan outline
#' - **Cmd+Shift+K**  : melakukan knit
#' - **Cmd+C/V/X**    : simpan/salin/tempel
#' - **Cmd+Option+I** : menyisipkan chunk
#' 
#' > - Cmd+Shift+O  : show outline
#' > - Cmd+Shift+K  : knit
#' > - Cmd+C/V/X    : save/copy/paste
#' > - Cmd+Option+I : insert chunk
#' 
#' di mana saja, untuk PC:
#' 
#' > anywhere (PC):
#' 
#' - **Ctrl+Shift+O**  : menampilkan outline
#' - **Ctrl+Shift+K**  : melakukan knit
#' - **Ctrl+C/V/X**    : simpan/salin/tempel
#' 
#' > - Ctrl+Shift+O  : show outline
#' > - Ctrl+Shift+K  : knit
#' > - Ctrl+C/V/X    : save/copy/paste
#' 
#' di dalam code chunk, untuk Mac:
#' 
#' > in code chunks (Mac):
#' 
#' - **Option+-**      : menyisipkan operator `<-`
#' - **Cmd+Return**   : menjalankan baris / kode yang disorot di Console
#' - **Cmd+Option+C** : menjalankan chunk saat ini di Console
#' - **Cmd+Option+I** : menyisipkan chunk
#' 
#' > - Option+-:    : insert an "<-" operator
#' > - Cmd+Return   : run line / highlighted code in console
#' > - Cmd+Option+C : run current chunk in console
#' > - Cmd+Option+I : insert chunk
#' 
#' di dalam code chunk, untuk PC:
#' 
#' > in code chunks (PC):
#' 
#' - **Alt+-**        : menyisipkan operator `<-`
#' - **Ctrl+Enter**  : menjalankan baris / kode yang disorot di Console
#' - **Ctrl+Alt+I**  : menjalankan seluruh chunk di Console
#' 
#' > - Alt+-        : insert an "<-" operator
#' > - Ctrl+Enter   : run line / highlighted code in console
#' > - Ctrl+Alt+I   : run whole chunk in console
#' 
#' Cobalah menjelajah dan temukan pintasan yang cocok untuk Anda. Saya sarankan menambahkan beberapa pintasan dulu. Setelah pintasan awal itu terasa otomatis, baru tambahkan pintasan lainnya.
#' 
#' > Explore and find ones that work for you... I suggest adding a few at a time, and only adding more once the initial ones are second nature.
#' 
#' ## Tips dan informasi lain / Other tips & info
#' 
#' - pilih teks, lalu ketik tanda kutip / tanda kurung / tanda kurung siku untuk mengapit pilihan tersebut
#' - **History** = daftar perintah yang pernah dijalankan dan bisa dicari
#' - tekan **Tab** untuk melengkapi nama fungsi dan argument fungsi
#' - tekan **Tab** di antara dua tanda kutip ganda (`" "`) untuk membuka daftar semua file di working directory
#' 
#' > - select text, type a (quotation mark/parentheses/brackets to surround selection)
#' > - History = a searchable list of commands that have been run
#' > - "Tab" to fill functions, function arguments
#' > - "Tab" between two double quotes (” “) to open 
#' >     a listing of all files in the working directory
#' 
#' Biasanya kita akan menggunakan file R Markdown, yaitu `filename.Rmd`, yang berisi kode sekaligus teks. Anda juga akan menemui file R script, yaitu `filename.R`, yang hanya berisi kode. Jika ada teks di dalam file R script, biasanya teks tersebut dijadikan komentar.
#' 
#' > We will usually be using R Markdown files, filename.Rmd, which contain both code and text. You will also run into R script files, filename.R, which contain only code (any text is commented out)
#' 
#' Sedikit lebih lanjut, tetapi mungkin juga berguna atau menarik bagi Anda:
#' 
#' <https://paulvanderlaken.com/2018/05/21/r-tips-and-tricks/#rstudio>
#' 
#' > Slightly more advanced, but also potentially useful or of interest to you is:
#' > https://paulvanderlaken.com/2018/05/21/r-tips-and-tricks/#rstudio
#' 
#' # Mendapatkan bantuan / Getting help
#' 
#' ## di R / in R
#' 
#' Opsi 1: `?function`
#' 
#' > Option 1:`?function`
#' 
## --------------------------------------------------

?mean
?seq
# R will tell you if you look for something that doesn't exist:
?gr


#' 
#' Opsi 2: `help()`
#' 
#' > Option 2:`help()`
#' 
## --------------------------------------------------

help(lm)
?help


#' 
#' Opsi 3: `help.search("keyword")`
#' 
#' > Option 3: `help.search("keyword")`
#' 
## --------------------------------------------------

help.search("mle")
# the "??" shortcut gives you the same thing:
??"mle"


#' 
#' ## online / on line
#' 
#' <https://rseek.org>
#' 
#' > https://rseek.org
#' 
#' ## Resep R / R Recipies
#' 
#' Sidebar kiri: **Learn -> Recipes**
#' 
#' > Left sidebar: Learn -> Recipes
#' 
#' ## Lembar contekan R / R cheat sheets
#' 
#' Sidebar kiri: **Learn -> Cheatsheets**
#' 
#' > Left sidebar: Learn -> Cheatsheets
#' 
#' # Potongan penting dalam kode R: print(), return() / R coding nuggets: print(), return()
#' 
## --------------------------------------------------

# draw ten random numbers from a normal distribution
a <- rnorm(10)  
a
print(a)
show(a)

# also works
(a <- rnorm(10))  

return(a)


#' 
#' Jika kita hanya mengetik nilai `a`, R akan menampilkan nilainya. Ini disebut *implicit printing*, atau pencetakan implisit. Biasanya ini hanya digunakan saat bekerja secara interaktif di Console.
#' 
#' > just typing the value 'a' shows a value, it is "implicit printing". It is normally only used when working in an interactive console.
#' 
#' `print()` menampilkan teks atau nilai di Console. Gunakan ini ketika Anda ingin menunjukkan sesuatu kepada pengguna atau melihatnya sendiri. Ini disebut *explicit printing*, atau pencetakan eksplisit. (*"`print()` adalah untuk manusia"*) Saat bekerja dalam script atau fungsi, biasanya lebih baik menggunakan `print()` daripada mengandalkan pencetakan implisit. Pencetakan implisit di dalam script atau fungsi hanya bekerja jika digunakan pada baris terakhir dari fungsi atau script tersebut.
#' 
#' > `print()` displays text in the console. Use it when you want to show something to a user or see it yourself. This is "explicit printing". (*"print() is for people"*) It is best to do this as opposed to "implicit printing" when working in a script of function. (Implicit printing within scripts or functions only works if you use it in the last line of the function or script)
#' 
#' `return()` menyimpan nilai agar bisa digunakan oleh sebuah fungsi saat dibutuhkan. `return()` tidak selalu mencetak nilai tersebut ke layar. `return()` hanya bisa digunakan di dalam fungsi.
#' 
#' > `return()` stores the value so it can be used by a function when required. It does not always print the value(s) on the screen. It can only be used in a function.
#' ````
