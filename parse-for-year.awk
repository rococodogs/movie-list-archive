# parse-for-year.awk
#
# I've done this by hand the past couple of years so it makes sense
# to automate it. Extracts all the entries for a given year from
# the unified diary CSV file.
#
# usage:
#   awk -v year=2018 -f parse-for-year.awk /path/to/letterboxd-export/diary.csv > 2018.csv

BEGIN {
  if (!year) {
    exit
  }

  FPAT = "([^,]*)|(\"[^\"]+\")"
}

# print headers
NR == 1 {
  print $0
  next
}

{
  DATE_REG = sprintf("^%s-[0-9][0-9]-[0-9][0-9]", year)

  if ($8 ~ DATE_REG) {
    print $0
  }
}
