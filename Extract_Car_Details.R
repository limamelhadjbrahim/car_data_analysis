
# Load libraries
library(rvest)
library(dplyr)



# Function to extract car information from a single page
extract_car_info <- function(link) {
  # Read the HTML content of the page
  cars_page <- read_html(link)
  
  # Get all car tags
  car_tags <- cars_page %>% html_nodes("div.classic-card-wrapper")
  
  car_variables <- list()
  
  # Loop through each car tag to extract information
  for (car_tag in car_tags) {
    product_details <- car_tag %>% html_nodes("div.product-details")
    brand <- as.character(product_details %>% html_nodes("p.p3.ng-star-inserted") %>% html_text())
    model_and_seller <- product_details %>% html_nodes("p.p5") %>% html_text()
    model <- as.character(paste(model_and_seller[1], model_and_seller[2]))
    seller <- as.character(model_and_seller[3])
    
    car_definitions <- car_tag %>% html_nodes("div.product-definitions")
    car_info <- car_definitions %>% html_nodes("span.def-value") %>% html_text(trim = TRUE)
    Year <- as.numeric(car_info[1])
    Gear_Type <- as.character(car_info[2])
    Cylinder <- as.numeric(car_info[3])
    Mileage <- car_info[4]
    Mileage <- gsub(",", "", Mileage)
    Mileage <- as.numeric(substr(Mileage, 1, nchar(Mileage) - 2))
    
    Car_price_currency <- car_tag %>% html_nodes("div.product-price-info") %>% html_text()
    Car_price_currency <- substr(Car_price_currency, 2, nchar(Car_price_currency) - 1)
    Car_price_currency <- unlist(strsplit(Car_price_currency, "  "))
    price <- as.numeric(gsub(",", "", Car_price_currency[1]))
    currency <- Car_price_currency[2]
    
    car <- data.frame(Brand = brand, Model = model, Seller = seller, Year = Year, Gear_Type = Gear_Type, Cylinder = Cylinder, Mileage = Mileage, Price = price, Currency = currency)
    car_variables <- append(car_variables, list(car))
  }
  
  All_cars <- do.call(rbind, car_variables)
  return(All_cars)
}

# Get information of the first 1000 cars
i <- 0
car_count <- 0
cars_data <- list()

link <- "https://qatarsale.com/en/products/cars_for_sale="

while (car_count < 1000) {
  i <- i + 1
  new_data <- tryCatch({
    extract_car_info(paste0(link, i))
  }, error = function(e) {
    message("Error at index ", i, ": ", e)
    return(NULL)
  })
  
  if (!is.null(new_data) && nrow(new_data) > 0) {
    cars_data <- append(cars_data, list(new_data))
    car_count <- car_count + nrow(new_data)
  }
}

car_dataset <- do.call(rbind, cars_data)


# Remove rows with missing values
car_dataset <- na.omit(car_dataset)



