# 🛒 Hotel Management System

A web-based Java application to manage hotel reservations using JSP, Servlets, JDBC, and MySQL following the MVC architecture.

## 🚀 Features

- Add new hotel reservations
- Update existing reservation details
- Cancel hotel reservations
- Display all current reservations
- Generate reports:
  - Reservations within a specific date range
  - Most frequently booked rooms
  - Total revenue generated over a selected period


  ## 📁 Project Structure

HotelWebApp/
├── WebContent/
│   ├── index.jsp
│   ├── reservationadd.jsp
│   ├── reservationupdate.jsp
│   ├── reservationdelete.jsp
│   ├── reservationdisplay.jsp
│   ├── reports.jsp
│   ├── report_form.jsp
│   └── report_result.jsp
├── src/
│   ├── com/
│   ├── dao/
│   │   └── ReservationDAO.java
│   ├── model/
│   │   └── Reservation.java
│   └── servlet/
│       ├── AddReservationServlet.java
│       ├── UpdateReservationServlet.java
│       ├── DeleteReservationServlet.java
│       ├── DisplayReservationsServlet.java
│       ├── ReportServlet.java
│       └── ReportCriteriaServlet.java
└── WEB-INF/
    └── web.xml




## 🗄️ Database Setup
### 1. Create Database

sql
CREATE DATABASE IF NOT EXISTS product_management;
USE product_management;


### 2. Create Table

sql
CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(100),
    Category VARCHAR(50),
    Price DECIMAL(10,2),
    Quantity INT
);

### 3. Insert Sample Data
sql
INSERT INTO Product (id, name, category, price, quantity) VALUES
(101, 'Smart Watch', 'Electronics', 2000.00, 25),
(102, 'Smartphone', 'Electronics', 20000.00, 15),
(103, 'Comb', 'Beauty', 30.00, 25),
(104, 'Pen', 'Stationery', 10.00, 300),
(105, 'Face wash', 'Beauty', 45.00, 12),
(106, 'Sunscreen', 'Beauty', 60.00, 65);






## ⚙️ Installation & Setup

### Step 1: Clone/Download the Project
Download all the project files and organize them according to the project structure above.

### Step 2: Database Configuration
1. Start your MySQL server  
2. Run the database setup scripts provided above  
3. Update database credentials in ProductDAO.java:

java
connection = DriverManager.getConnection(
    "jdbc:mysql://localhost:3306/product_management", 
    "your_username", 
    "your_password");
 
 ### Step 3: Add MySQL JDBC Driver

- Download *MySQL Connector/J* from the official MySQL website  
- Add the JAR file to your project's WEB-INF/lib directory  
- If using an IDE, add it to your *build path*

### Step 4: Deploy to Tomcat

- Create a new *Dynamic Web Project* in your IDE  
- Copy all source files to the appropriate folders  
- Deploy the project to *Tomcat server*  
- Start the Tomcat server

### Step 5: Access the Application

Open your web browser and navigate to:

http://localhost:8080/Product_Management_System/




## 🖼️ Output Screenshots

### 🏠 Home Page
![Home Page](screenshots/home.jpg)

### ➕ Add Product
![Add Product](screenshots/add.jpg)

### 📝 Update Product
![Update Product](screenshots/update.jpg)

### ❌ Delete Product
![Delete Product](screenshots/delete.jpg)

### 📋 Display Products
![Display Products](screenshots/display.jpg)

### 📊 Generate Reports
![Generate Reports](screenshots/report1.jpg)
![Generate Reports](screenshots/report2.jpg)
![Generate Reports](screenshots/report3.jpg)
![Generate Reports](screenshots/report4.jpg)