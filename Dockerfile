# Use the official R base image for version 4.3.1
FROM rocker/r-ver:4.3.1

# Set the working directory
WORKDIR /app

# Update packages and install necessary system dependencies
RUN apt-get update && apt-get install -y \
    libcurl4-openssl-dev \  
    libssl-dev \            
    libxml2-dev \          
    zlib1g-dev              

# Install required R packages for the application
RUN R -e "install.packages(c('rvest', 'dplyr', 'shiny', 'ggplot2', 'plotly'), repos='http://cran.rstudio.com/')"


# Copy application files into the Docker image
COPY . /app



# Expose the port the app runs on
EXPOSE 3838

# Run the Shiny application
CMD ["R", "-e", "shiny::runApp('/app/Car_Data_Insights.R')"]


 