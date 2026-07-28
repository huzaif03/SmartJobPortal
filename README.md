# Smart Job Portal

A Java MVC-based web application that connects daily wage workers with employers through a simple and efficient online platform.

---

## 📌 Project Overview

Smart Job Portal is designed to bridge the gap between employers and skilled daily wage workers. The system provides separate modules for Workers, Employers, and Admin, allowing users to register, manage profiles, post hiring requests, and search for workers based on their skills and location.

---

## ✨ Features

### 👷 Worker Module
- Worker Registration & Login
- Profile Management
- Update Personal Details
- Availability Status
- Upload Profile Picture

### 🏢 Employer Module
- Employer Registration & Login
- Search Workers
- View Worker Profiles
- Send Hire Requests
- See Hire Requests Status

### 👨‍💼 Admin Module
- Admin Login
- Dashboard
- Manage Workers
- Manage Employers
- Monitor Hire Requests

---

## 🛠️ Technologies Used

- Java
- JSP
- Servlets
- JDBC
- MySQL
- HTML5
- CSS3
- JavaScript
- Bootstrap
- GlassFish Server
- NetBeans IDE

---

## 🏗️ Project Architecture

The project follows the MVC (Model-View-Controller) architecture.

### Controller
- FrontController

### Model
- Model Interface
- AdminDashboardModel
- WLoginModel
- ELoginModel
- WHomeModel
- EHomeModel
- DBConnectModel
- Other Model Classes

### View
- JSP Pages
- WHome.jsp
- EHome.jsp
- WLogin.jsp
- ELogin.jsp
- AdminDashboard.jsp
- AdminLogin.jsp
- And many more...

---

## 🗄️ Database Tables

- wregister
- waddress
- wprofile
- eregister
- eaddress
- adminregister
- hirerequests

---

## 📂 Project Structure

SmartJobPortal/
├── src/
├── web/
├── databases/
│ └── smartjobportal.sql
├── README.md
├── .gitignore
└── build.xml

---

## 🚀 Installation

1. Clone the repository.
2. Import the project into NetBeans.
3. Configure MySQL database.
4. Import `smartjobportal.sql`.
5. Update database credentials.
6. Deploy the project on GlassFish Server.
7. Run the application.

---

## 📸 Screenshots

Project screenshots will be added soon.

---

## 🔮 Future Enhancements

- Email & SMS Notifications
- Real-time Chat
- Job Recommendations
- Mobile Application
- Online Interview Scheduling
- Online Payment Integration
- Document Verification

---

## 👨‍💻 Author

**Hujaifa Majeed**

GitHub: https://github.com/huzaif03

---
