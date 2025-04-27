
```markdown
# Car Data Analysis Project 🚗📊

## Project Overview 📝
This project involves analyzing car data to uncover insights and trends. It includes the following steps:
- Extracting car details from a website:https://qatarsale.com/en/products/cars_for_sale
- Processing and cleaning the data.
- Visualizing the data using interactive plots and charts.

## Prerequisites 🛠️
Before you begin, ensure you have met the following requirements:
- **Docker Desktop**: You can download and install Docker Desktop from Docker's official website: [Docker Desktop](https://www.docker.com/products/docker-desktop/)
- **Git**: You can download and install Git from Git's official website: Git Downloads

## Step-by-Step Guide 📝

### Step 1: Install Docker 🐳🔧
1. **Install Docker**:
   - Visit the Docker Desktop download page.
   - Download the appropriate version for your operating system.
   - Follow the installation instructions provided on the website.



### Step 2: Install Git 🐳🔧
 **Install Git**:
   - Visit the Git download page.
   - Download the appropriate version for your operating system.
   - Follow the installation instructions provided on the website.
```

### Step 2: Clone the Repository and Navigate to the Project Directory 📁
Type these commands one after the other::
```bash
git clone https://github.com/limamelhadjbrahim/car_data_analysis.git
cd car_data_analysis
```

### Step 3: Build the Docker Image 🏗️
Build the Docker image using the following command:
```bash
docker build -t car_data_analysis .
```

### Step 4: Run the Docker Container 🚀
Run the Docker container using the following command:
```bash
docker run -p 3838:3838 car_data_analysis
```

### Step 5: Access the Shiny App 🌐
Wait until you see in the terminal "Listening on http://0.0.0.0:3838", then open your web browser and go to http://localhost:3838 to access the Shiny app.

## Project Structure 🗂️
- `Extract_Car_Details.R`: Extracts data from the website.
- `Car_Data_Insights.R`: Shiny app visualizing the data using interactive plots and charts.
- `Dockerfile`: The Dockerfile sets up the environment for running the Shiny application.

## License 📜
This project is licensed under the MIT License.

## Contact 📧
For any questions or suggestions, please contact [limam.elhadj@yahoo.com].
```

