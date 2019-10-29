library(tidyverse)
library(rvest)

# URL containing tables of icons and corresponding codes
url <- "https://github.com/ikatyang/emoji-cheat-sheet/blob/master/README.md"
# read the tables
tables <- read_html(url) %>%
  html_nodes("table") %>%
  html_table(fill = TRUE)
# coerce as tibbles
y <- map(tables, as_tibble, .name_repair = "unique")
# remove the first and last cols
y <- map(y, select, -1, -6)

# for every table, bind the right and left side
for (i in seq_along(y)) {
  a <- y[[i]][, 1:2]
  names(a) <- c("ico", "code")
  b <- y[[i]][, 2:3]
  names(b) <- c("code", "ico")
  y[[i]] <- bind_rows(a, b)
}

# create a named vector of codes and emoji
# this can be used in str_replace_all to replace codes w/ emoji
y <- drop_na(na_if(bind_rows(y), ""))
emoji_codes <- deframe(y)
emoji_codes <- setNames(names(emoji_codes), unname(emoji_codes))

# save named vector
usethis::use_data(emoji_codes)
