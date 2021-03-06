context("read_excel")

test_that("types imputed & read correctly", {
  types <- read_excel("types.xlsx")
  expect_is(types$number, "numeric")
  expect_is(types$string, "character")
  expect_is(types$date, "POSIXct")
})

test_that("can read sheets with inlineStr", {
  # Original source: http://our.componentone.com/wp-content/uploads/2011/12/TestExcel.xlsx
  # These appear to come from LibreOffice 4.2.7.2.
  x <- read_excel("inlineStr.xlsx")
  expect_equal(x$ID, "RQ11610")
})

test_that("can read file without ending", {

  ## Test for xlsx without ending
  file.copy("iris-excel.xlsx", "iris-xlsx-no-ending")
  on.exit(file.remove("iris-xlsx-no-ending"))
  iris_xlsx <- read_xlsx("iris-xlsx-no-ending")
  expect_equal(iris_xlsx, read_excel("iris-excel.xlsx"))
  expect_error(read_xls("iris-xlsx-no-ending"))

  ## Test for xls without ending
  file.copy("iris-excel.xls", "iris-xls-no-ending")
  on.exit(file.remove("iris-xls-no-ending"))
  iris_xls <- read_xls("iris-xls-no-ending")
  expect_equal(iris_xls, read_excel("iris-excel.xls"))
  expect_error(read_xlsx("iris-xls-no-ending"))


})
