#' 
#' # Latihan R di BBTNBKDS / R Training at BBTNBKDS
#' ## 2026-06-29 s/d 2026-06
#' ## disampikan oleh Andy Marshall, Universitas Michigan / delivered by Andy Marshall, University of Michigan
#' 
#' Visualisasi data II
#' 
#' > Data visualization II
#' 
#' # Package / Packages
#' 
## --------------------------------------------------

library(tidyverse)
library(plotly)
library(ggiraph)
library(patchwork)
library(gapminder)
library(hexbin)
library(maps)
library(mapproj)
library(viridis)


#' 
#' # Membuat visualisasi interaktif / Making interactive visualizations
#' 
#' Alat yang akan kita gunakan hari ini disediakan oleh package bernama `{plotly}`. Plotly (<https://plot.ly/>) adalah layanan komersial sekaligus produk open source untuk membuat visualisasi interaktif berkualitas tinggi. Package `{plotly}` memungkinkan Anda membuat grafik interaktif dengan dua cara. Cara pertama adalah menggunakan fungsi inti `{plotly}`, misalnya `plot_ly()`, untuk membuat grafik interaktif secara langsung. Cara kedua adalah menggunakan fungsi `{plotly}` yaitu `ggplotly()` untuk mengubah objek `{ggplot2}` menjadi grafik interaktif. Seperti yang saya sebutkan di pengantar, kita akan menggunakan pilihan kedua, yaitu `ggplotly()`, untuk mengubah objek `{ggplot2}` menjadi grafik interaktif. Alasannya, cara ini membangun dari pengetahuan yang sudah Anda miliki dan juga menyederhanakan beberapa hal teknis untuk kita.
#' 
#' > The tools we'll use today are provided by a package called {plotly}. Plotly (https://plot.ly/) is both a commercial service and an open source product for creating high end interactive visualizations. The {plotly} package allows you to create interactive graphs in two ways. The first is using core {plotly} functions (e.g., `plot_ly()`) to make interactive graphs directly. The second is to use the {plotly} function `ggplotly()` to turn {ggplot2} objects into interactive graphics. As I mentioned in the introduction, we'll be using the second option, `ggplotly()` to turn {ggplot2} objects into interactive graphics, both because it builds on knowledge you have already gained and because it simplifies some of the logistics for us.
#' 
#' Ada beberapa sumber informasi yang bagus tentang `{plotly}`. Lihat halaman R untuk `{plotly}` (<https://plot.ly/r/>) dan buku *Interactive web-based data visualization with R, Plotly, and Shiny* oleh Sievert, 2020.
#' 
#' > There are several good sources of information about {plotly}. See the {plotly} R pages (https://plot.ly/r/) and the book "Interactive web-based data visualization with R, Plotly, and Shiny" (Sievert 2020). 
#' 
#' Hari ini kita akan belajar membuat beberapa jenis visualisasi interaktif dengan `{plotly}`.
#' 
#' > Today we'll learn to make several types of interactive visualizations with {plotly}.
#' 
#' 
#' # Scatterplot / Scatterplots
#' 
#' Pertama, kita akan membuat grafik statis menggunakan data `mpg` yang tersedia bersama `{ggplot2}`. Sebagian besar kode ini seharusnya sudah terasa familiar bagi Anda:
#' 
#' > First, we'll create a static graph using the mpg data that comes with {ggplot2}. Most of this should be familiar to you:
#' 
## --------------------------------------------------

ggplot(mpg, aes(x = displ, y = hwy, 
                color = class)) +
  geom_point(size = 3, alpha = 0.5) +
  labs(x = "Engine displacement",
       y = "Highway Mileage",
       color = "Car class") +
  theme_minimal()


#' 
#' Satu hal baru adalah kita menambahkan argument baru ke `labs`, yang mengatur judul pada legenda.
#' 
#' > The one new thing is that we have added a new argument to 'labs', which sets the header in the legend.
#' 
#' `{plotly}` memungkinkan kita dengan cepat mengubah visualisasi statis ini menjadi visualisasi interaktif. Kita cukup menyimpan objek `{ggplot2}` sebagai sebuah objek, di sini disebut `p`, lalu menampilkannya menggunakan `ggplotly(p)`.
#' 
#' > {plotly} allows us to quickly turn this static visualization to an interactive one. We simple save the {ggplot2} as an object (here, called "p"), and then render it using `ggplotly(p)`.
#' 
## --------------------------------------------------

p <- ggplot(mpg, aes(x = displ, y = hwy, 
                color = class)) +
  geom_point(size = 3, alpha = 0.5) +
  labs(x = "Engine displacement",
       y = "Highway Mileage",
       color = "Car Class") +
  theme_minimal()

ggplotly(p)


#' 
#' Plot yang dihasilkan akan muncul di jendela **Viewer**, bukan di jendela **Plots**. Tampilannya sangat mirip dengan versi statis, tetapi sekarang ada elemen interaktif tambahan. Ketika kursor diarahkan ke sebuah titik, informasi tentang titik tersebut akan muncul. Mengklik salah satu item legenda akan menghapus kelas tersebut dari plot. Mengkliknya lagi akan menampilkannya kembali. Mengklik dua kali akan menghapus semua titik lainnya. Alat di kanan atas plot memungkinkan Anda memperbesar dan memperkecil gambar, menggeser tampilan, memilih area, mengatur ulang sumbu, dan mengunduh gambar sebagai file PNG.
#' 
#' > The resultant plot will appear in the "Viewer" window, not the "Plots" window. It looks very similar to the static one, but there are now added interactive elements. Hovering the cursor over a point displays information about that point. Clicking on a legend point removes that class from the plot. Clicking on it again returns it. Double clicking on it removes all other points. Tools on the upper right of the plot allow you to zoom in and out of the image, pan, select, reset axes, and download the image as a png file.
#' 
#' Seperti yang sudah kita pelajari, kita bisa menggunakan `geom_smooth()` untuk menambahkan garis ke plot:
#' 
#' > As we have learned, we can use `geom_smooth()` to add lines to the plot:
#' 
## --------------------------------------------------

p <- ggplot(mpg, aes(x = displ, 
                     y = hwy, 
                     color = class)) +   # color differentiation
                                         # applies to full plot
  geom_point(size = 3, alpha = 0.5) + 
  geom_smooth() +
  labs(x = "Engine displacement",
       y = "Highway Mileage",
       color = "Car Class") +
  theme_bw()

ggplotly(p)


#' 
#' Ini menambahkan garis smooth terpisah untuk setiap kelas mobil. Dalam beberapa konteks, ini sangat berguna. Tetapi di sini hasilnya terlihat terlalu ramai. Jika kita ingin `color = class` hanya berlaku untuk titik-titik, bukan seluruh plot, kita memindahkannya dari pemanggilan awal `ggplot(mpg, aes(x = displ, y = hwy, color = class))` ke pemanggilan yang menambahkan titik, yaitu `geom_point(aes(color = class), alpha = 0.5, size = 3)`. Ini lebih baik:
#' 
#' > This has added a separate smoother for each car class. In some contexts, this is quite useful. But here it is just messy. If we want the 'color = class' to apply to the points only, and not the whole plot, we move it from the initial plot call `ggplot(mpg, aes(x = displ, y = hwy, color = class))` to the call adding points `geom_point(aes(color = class), alpha = 0.5, size = 3)`. This is better:
#' 
## --------------------------------------------------

p <- ggplot(mpg, aes(x = displ, 
                     y = hwy)) +
  geom_point(aes(color = class), 
             alpha = 0.5, size =3) +  # color differentiation
                                      # applies to points only
  geom_smooth() +
  labs(x = "Engine displacement",
       y = "Highway Mileage",
       color = "Car Class")  +
  theme_bw()

ggplotly(p)


#' 
#' # Menyesuaikan tooltip / Customizing tooltips
#' 
#' Secara default, ketika mouse diarahkan ke titik, akan muncul informasi pop-up yang disebut *tooltip*, yang menampilkan nilai-nilai yang digunakan untuk membuat plot, di sini `displ`, `hwy`, dan `class`. Namun, Anda bisa menyesuaikan tooltip. Ini dilakukan dengan menambahkan `labeln = variablen` ke dalam `aes()` pada pemanggilan `{ggplot2}`, dan juga ke fungsi `ggplotly()`.
#' 
#' > By default, the mouse over provides pop-up information, known as a "tooltip", that displays the values used to create the plot ('displ', 'hwy', and 'class' here). However you can customize the tooltip. This involves adding a 'labeln = variablen' to the 'aes()' inside the {ggplot2} call and also to the `ggplotly()` function.
#' 
## --------------------------------------------------

p <- ggplot(mpg, aes(x = displ, 
                     y = hwy, 
                     color = class,
                     label1 = manufacturer,
                     label2 = model,
                     label3 = year)) +
  geom_point(size = 3, alpha = 0.5) +
  labs(x = "Engine displacement",
       y = "Highway Mileage",
       color = "Car Class") +
  theme_bw()

ggplotly(p, tooltip = c("label1", "label2", "label3"))


#' 
#' Tooltip sekarang menampilkan produsen mobil, model, dan tahun.
#' 
#' > The tooltip now displays the car manufacturer, make, and year.
#' 
#' Anda bisa menyesuaikan tooltip sepenuhnya dengan membuat label sendiri dan memasukkannya sebagai variabel dalam data frame menggunakan `mutate()`. Lalu tempatkan label tersebut dalam `{ggplot2}` sebagai `text`, dan dalam fungsi `ggplotly()` sebagai label.
#' 
#' > You can fully customize the tooltip by creating your own label and including it as a variable in the data frame Using `mutate()`. Then place the label in the {ggplot2} as text and in the `ggplotly()` function as a label.
#' 
## --------------------------------------------------

mpg <- mpg %>%
  mutate(mylabel = paste("This is a", manufacturer, model, "\n",
                         "released in", year, "."))

p <- ggplot(mpg, aes(x = displ, 
                     y = hwy, 
                     color = class,
                     text = mylabel)) +
  geom_point(size = 3, alpha = 0.5) +
  labs(x = "Engine displacement",
       y = "Highway Mileage",
       color = "Car Class") +
  theme_bw()

ggplotly(p, tooltip = c("mylabel"))


#' 
#' # Hexbin / Hexbins
#' 
#' *Hexagonal binning*, yaitu `geom_hex()`, memungkinkan kita memvisualisasikan kepadatan dua dimensi. Untuk scatterplot dengan banyak titik, metode ini menambahkan kotak-kotak berbentuk heksagon ke plot, lalu memberi warna pada heksagon berdasarkan jumlah titik yang jatuh di dalamnya. Berikut adalah scatterplot yang sangat padat menggunakan dataset bawaan `diamonds`. Karena dataset `diamonds` besar, kita mengambil sampel acak 1000 observasi agar tidak perlu menunggu terlalu lama sampai plot digambar.
#' 
#' > Hexagonal binning (i.e., `geom_hex()`) allows us to visualize a two-dimensional density. For scatterplots with lots of points, in imposes hexagonal bins on the plot and then colors the hexagons based on how many points fall inside it. Here is a very busy scatterplot made using  the built in diamonds data set. Because the diamonds dataset is large, we take a random dample of 1000 observations so we don't need to wait too long for the plot to draw.
#' 
## --------------------------------------------------

# Randomly sample 1000 rows
set.seed(133)
diamonds_subset <- diamonds %>% sample_n(10000)

p <- ggplot(diamonds_subset, aes(x = log(carat), y = log(price))) + 
  geom_point(alpha = 0.25) +
  theme_bw()

ggplotly(p)


#' 
#' Membagi nilai ke dalam bin berbentuk heksagon membuat plot lebih mudah dipahami.
#' 
#' > Dividing the values into hexagonal bins makes the plot easier to digest.
#' 
## --------------------------------------------------

p <- ggplot(diamonds_subset, aes(x = log(carat), y = log(price))) + 
  geom_hex(bins = 100) +
  theme_bw()

ggplotly(p)


#' 
#' Kita bisa melihat adanya hubungan linear positif yang kuat antara log karat dan harga. Plot ini juga menunjukkan bahwa untuk banyak berlian, nilai karat dibulatkan ke angka tertentu, yang ditunjukkan oleh pita biru muda tempat banyak nilai berkumpul. Selain itu, tidak ada berlian yang dihargai sekitar $1500, terlihat sebagai garis horizontal putih pada 7.3, yaitu `log(1500)`. Membuat plot ini interaktif memudahkan kita menerjemahkan warna heksagon menjadi jumlah data yang diwakilinya.
#' 
#' > We can see there is a strong positive linear relationship between the log of carat and price. It also shows that for many, the carat is only rounded to a particular number (indicated by the light blue bands where many values are clustered together) and no diamonds are priced around $1500 (the white horizontal stripe at 7.3 (which is log(1500)). Making this plot interactive makes it easier to decode the hexagonal colors into the counts that they represent.
#' 
#' Kita bisa mengubah ukuran bin jika mau:
#' 
#' > We can change the bin size if we like:
#' 
## --------------------------------------------------

p <- ggplot(diamonds_subset, aes(x = log(carat), y = log(price))) + 
  geom_hex(bins = 50) + # change bin size
  theme_bw()

ggplotly(p)


#' 
#' Ini membuat plot lebih mudah dipahami dalam beberapa hal, tetapi perhatikan bahwa sekarang kita kehilangan pita horizontal putih tersebut.
#' 
#' > This makes the plot easier to digest in some ways, but note we have now lost the white horizontal band. 
#' 
#' # Poligon frekuensi / Frequency polygons
#' 
#' Kita bisa memanfaatkan antarmuka `{ggplot2}` yang konsisten untuk mengeksplorasi ringkasan statistik antar kelompok. Misalnya, dengan menyertakan variabel warna diskrit, seperti `clarity`, bersama `geom_freqpoly()`, kita mendapatkan poligon frekuensi untuk setiap level variabel tersebut.
#' 
#' > We can leverage {ggplot2}s consistent interface for exploring statistical summaries across groups. For example, by including a discrete color variable (e.g., clarity) with `geom_freqpoly()`, we get a frequency polygon for each level of that variable.
#' 
## --------------------------------------------------

p <- ggplot(diamonds_subset, aes(x = log(price), color = clarity)) + 
    geom_histogram() +
    theme_bw()

ggplotly(p)


#' 
#' Ini bekerja pada dasarnya untuk semua `geom`, misalnya `geom_histogram()` dan `geom_density()`.
#' 
#' > This works for basically any geom (e.g. `geom_histogram()`, `geom_density()`).
#' 
#' # Faceting / Faceting
#' 
#' Sekarang, untuk melihat bagaimana harga bervariasi berdasarkan `cut` dan `clarity`, kita bisa mengulang visualisasi yang sama untuk setiap level `cut` menggunakan salah satu “kekuatan super” `{ggplot2}`, yaitu `facet_wrap()`. Di sini, untuk memudahkan perbandingan, kita bisa membuat `geom_freqpoly()` menampilkan frekuensi relatif, bukan frekuensi absolut. Dengan membuat plot ini interaktif, kita dapat lebih mudah membandingkan level `cut` tertentu dengan memanfaatkan kemampuan penyaringan pada legenda.
#' 
#' > Now, to see how price varies with both cut and clarity, we could repeat this same visualization for each level of cut using one of {ggplot2}'s super powers, `facet_wrap()`. Here, to facilitate comparisons, we can have `geom_freqpoly()` display relative rather than absolute frequencies. By making this plot interactive, we can more easily compare particular levels of cut by leveraging the legend filtering capabilities.
#' 
## --------------------------------------------------

p <- ggplot(diamonds_subset, aes(x = log(price), color = clarity)) + 
    geom_freqpoly(stat = "density") + 
    facet_wrap(~cut)

ggplotly(p)


#' 
#' # Plot dumbbell / Dumbbell plots
#' 
#' Plot dumbbell adalah cara sederhana dan berdampak untuk membandingkan dua keadaan antar individu. Kita dapat membuatnya dengan sederhana menggunakan kombinasi fungsi `{ggplot2}` yaitu `geom_line()` dan `geom_point()`.
#' 
#' > Dumbbell plots are simple, impactful ways of making comparisons between two states across individuals. We can make them simply by combining {ggplot2}s `geom_line()` and `geom_point()` functions.
#' 
#' Di sini kita akan menggunakan data dari package `{gapminder}` tentang harapan hidup, GDP per kapita, dan populasi menurut negara untuk membuat plot dumbbell yang membandingkan perubahan harapan hidup dari tahun 1952 ke 2007 untuk semua negara Asia. Kita membuat plot dumbbell dengan memplot titik untuk setiap waktu dan menghubungkan titik-titik tersebut dengan garis untuk setiap negara. Agar titik-titik bisa dihubungkan, kita perlu menentukan baris atau negara mana yang harus dihubungkan. Kita membuat variabel baru yang menentukan kelompok yang sesuai untuk setiap negara.
#' 
#' > Here will use the {gapminder} package's data on life expectancy, GDP per capita, and population by country to make dumbbell plot to compare life expectancy change from 1952 to 2007 for all Asian countries. We make dumbbell plot by plotting points for each time point and connect them with a line for each country. In order to connect the points, we need specify which rows or countries need to be connected. We create a new variable that specifies the group corresponding to each country.
#' 
## --------------------------------------------------

gapminder <- read_csv("gapminder-FiveYearData.csv")

df <- gapminder %>%
  filter(year %in% c(1952,2007)) %>%
  filter(continent == "Asia") 

df <- df %>%
  mutate(paired = rep(1:(n()/2), each = 2),
         year = factor(year))

p <- df %>% 
  ggplot(aes(x = lifeExp, y = country)) +
  geom_line(aes(group = paired))+
  geom_point(aes(color = year)) +
  theme(legend.position = "top") +
  theme_bw()

ggplotly(p)


#' 
#' Seperti biasanya, urutan alfabetis tidak terlalu membantu untuk sebuah plot. Kita bisa mengurutkan ulang plot dumbbell berdasarkan nilai harapan hidup menggunakan `reorder()` untuk menyampaikan informasi tambahan.
#' 
#' > As is usually the case, alphabetical order is not so helpful for a plot. We can reorder the dumbbell plot by life expectancy values using `reorder()` to convey additional information.
#' 
## --------------------------------------------------

p <- df %>% 
  ggplot(aes(x = lifeExp, y = reorder(country, lifeExp))) +
  geom_line(aes(group = paired)) +
  geom_point(aes(color = year)) +
  labs(y = "country") +
  theme_bw()

ggplotly(p)


#' 
#' Mengubah warna garis di antara titik dan membuat titik sedikit lebih besar meningkatkan efektivitas visualisasi.
#' 
#' > Changing the color of the line between the points and making them slightly larger improves the efficacy of the visualization.
#' 
## --------------------------------------------------

p <- df %>% 
  group_by(paired) %>%
  ggplot(aes(x = lifeExp, y = reorder(country, lifeExp))) +
  geom_line(aes(group = paired), color = "grey")+
    geom_point(aes(color = year), size = 2) +
  labs(y = "country") +
  theme_bw()

ggplotly(p)



#' 
#' # Bubble chart / Bubble charts
#' 
#' Ketika titik-titik pada plot digunakan untuk menyandikan informasi tambahan, plot yang dihasilkan sering disebut *bubble chart*. Di sini kita kembali menggunakan data `{gapminder}` untuk memplot harapan hidup sebagai fungsi dari GDP per kapita, dan mengatur ukuran titik agar mencerminkan ukuran populasi.
#' 
#' > When plotting points are used to encode additional information the resultant plots are often called bubble charts. Here we use the {gapminder} data again to plot life expectancy as a function of per capita GDP, and set the point size to reflect population size.
#' 
## --------------------------------------------------

data <- gapminder %>% 
  filter(year=="2007") %>% 
  dplyr::select(-year)

p <- ggplot(data, aes(x = gdpPercap, 
                      y = lifeExp,
                      size = pop)) +
              geom_point(alpha = 0.5) +
  theme_bw()

ggplotly(p)


#' 
#' Kita bisa mengubah rentang ukuran titik menggunakan `scale_size()`. Cobalah beberapa nilai berbeda untuk melihat bagaimana output berubah.
#' 
#' > We can modify the range of sizes of the points by using `scale_size()`. Try a few different values to see how it alters the output.
#' 
## --------------------------------------------------

p <- ggplot(data, aes(x = gdpPercap, 
                      y = lifeExp,
                      size = pop)) +
              geom_point(alpha = 0.5) +
  theme_bw() +
      scale_size(range = c(0.5, 20))

ggplotly(p)


#' 
#' Kita bisa membuat perubahan lain menggunakan fungsi `{ggplot2}` yang sudah kita kenal. Misalnya, di sini kita mengatur warna agar berbeda berdasarkan benua.
#' 
#' > We can make other changes using {ggplot2} functions we already know. For example, here we set the colors to differ by continent.
#' 
## --------------------------------------------------

p <- ggplot(data, aes(x = gdpPercap, 
                      y = lifeExp,
                      size = pop,
                      color = continent)) +
              geom_point(alpha = 0.5) +
  theme_bw() +
      scale_size(range = c(0.5, 20))

ggplotly(p)


#' 
#' 
#' # Alat lain / Other tools
#' 
#' Walaupun `{plotly}` adalah pendekatan paling populer untuk mengubah grafik statis `{ggplot2}` menjadi plot interaktif, ada banyak pendekatan lain, termasuk `{ggiraph}`, `{rbokeh}`, `{rcharts}`, dan `{highcharter}`. Berikut tautan ke masing-masing package agar Anda mendapat gambaran tentang kemampuannya.
#' 
#' > While {plotly} is the most popular approach for turning static {ggplot2} graphs into interactive plots, many other approaches exist, including {ggiraph}, {rbokeh}, {rcharts}, and {highcharter}. Here are links to each to give you a sense of their capabilities.
#' 
#' - <https://davidgohel.github.io/ggiraph/>
#' - <https://hafen.github.io/rbokeh/articles/rbokeh.html>
#' - <https://ramnathv.github.io/rCharts/>
#' - <https://jkunst.com/highcharter/>
#' 
#' > - https://davidgohel.github.io/ggiraph/
#' > - https://hafen.github.io/rbokeh/articles/rbokeh.html
#' > - https://ramnathv.github.io/rCharts/
#' > - https://jkunst.com/highcharter/
