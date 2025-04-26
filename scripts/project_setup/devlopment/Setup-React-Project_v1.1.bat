@echo off
setlocal enabledelayedexpansion

echo ==========================================
echo   🚀 Setting Up React Project Structure
echo ==========================================

:: Define the project root folder
SET "ROOT=src"

:: ==========================================
:: 📂 Creating Folder Structure
:: ==========================================
echo Creating project folders...

mkdir "%ROOT%"
mkdir "%ROOT%\pages"
mkdir "%ROOT%\pages\Frontend"
mkdir "%ROOT%\pages\Auth"
mkdir "%ROOT%\pages\Dashboards"
mkdir "%ROOT%\pages\Dashboards\User"
mkdir "%ROOT%\pages\Dashboards\Admin"
mkdir "%ROOT%\pages\Backend"
mkdir "%ROOT%\components"
mkdir "%ROOT%\firebase"
mkdir "%ROOT%\context"
mkdir "%ROOT%\hooks"
mkdir "%ROOT%\services"

:: ==========================================
:: 📝 Creating Files with Default Content
:: ==========================================

:: 🏠 Frontend Pages
echo import React from "react"; > "%ROOT%\pages\Frontend\Home.js"
echo const Home = () => ^<h1^>🏠 Home Page^</h1^>; >> "%ROOT%\pages\Frontend\Home.js"
echo export default Home; >> "%ROOT%\pages\Frontend\Home.js"

echo import React from "react"; > "%ROOT%\pages\Frontend\About.js"
echo const About = () => ^<h1^>ℹ️ About Us^</h1^>; >> "%ROOT%\pages\Frontend\About.js"
echo export default About; >> "%ROOT%\pages\Frontend\About.js"

echo import React from "react"; > "%ROOT%\pages\Frontend\Contact.js"
echo const Contact = () => ^<h1^>📞 Contact Us^</h1^>; >> "%ROOT%\pages\Frontend\Contact.js"
echo export default Contact; >> "%ROOT%\pages\Frontend\Contact.js"

:: 🔐 Auth Pages
echo import React from "react"; > "%ROOT%\pages\Auth\Login.js"
echo const Login = () => ^<h1^>🔑 Login Page^</h1^>; >> "%ROOT%\pages\Auth\Login.js"
echo export default Login; >> "%ROOT%\pages\Auth\Login.js"

echo import React from "react"; > "%ROOT%\pages\Auth\Register.js"
echo const Register = () => ^<h1^>📝 Register Page^</h1^>; >> "%ROOT%\pages\Auth\Register.js"
echo export default Register; >> "%ROOT%\pages\Auth\Register.js"

:: 👤 User Dashboard Pages
echo import React from "react"; > "%ROOT%\pages\Dashboards\User\UserDashboard.js"
echo const UserDashboard = () => ^<h1^>📊 User Dashboard^</h1^>; >> "%ROOT%\pages\Dashboards\User\UserDashboard.js"
echo export default UserDashboard; >> "%ROOT%\pages\Dashboards\User\UserDashboard.js"

echo import React from "react"; > "%ROOT%\pages\Dashboards\User\Profile.js"
echo const Profile = () => ^<h1^>👤 User Profile^</h1^>; >> "%ROOT%\pages\Dashboards\User\Profile.js"
echo export default Profile; >> "%ROOT%\pages\Dashboards\User\Profile.js"

:: 🔧 Admin Dashboard Pages
echo import React from "react"; > "%ROOT%\pages\Dashboards\Admin\AdminDashboard.js"
echo const AdminDashboard = () => ^<h1^>🛠️ Admin Dashboard^</h1^>; >> "%ROOT%\pages\Dashboards\Admin\AdminDashboard.js"
echo export default AdminDashboard; >> "%ROOT%\pages\Dashboards\Admin\AdminDashboard.js"

echo import React from "react"; > "%ROOT%\pages\Dashboards\Admin\ManageUsers.js"
echo const ManageUsers = () => ^<h1^>👥 Manage Users^</h1^>; >> "%ROOT%\pages\Dashboards\Admin\ManageUsers.js"
echo export default ManageUsers; >> "%ROOT%\pages\Dashboards\Admin\ManageUsers.js"

:: 🖥️ Backend Pages
echo import React from "react"; > "%ROOT%\pages\Backend\Users.js"
echo const Users = () => ^<h1^>👥 Manage Users Backend^</h1^>; >> "%ROOT%\pages\Backend\Users.js"
echo export default Users; >> "%ROOT%\pages\Backend\Users.js"

echo import React from "react"; > "%ROOT%\pages\Backend\Settings.js"
echo const Settings = () => ^<h1^>⚙️ Settings^</h1^>; >> "%ROOT%\pages\Backend\Settings.js"
echo export default Settings; >> "%ROOT%\pages\Backend\Settings.js"

:: ==========================================
:: 🔥 Firebase Config File
:: ==========================================
echo import { initializeApp } from "firebase/app"; > "%ROOT%\firebase\firebase.js"
echo const firebaseConfig = { >> "%ROOT%\firebase\firebase.js"
echo   apiKey: "YOUR_API_KEY", >> "%ROOT%\firebase\firebase.js"
echo   authDomain: "YOUR_AUTH_DOMAIN", >> "%ROOT%\firebase\firebase.js"
echo   projectId: "YOUR_PROJECT_ID", >> "%ROOT%\firebase\firebase.js"
echo   storageBucket: "YOUR_STORAGE_BUCKET", >> "%ROOT%\firebase\firebase.js"
echo   messagingSenderId: "YOUR_MESSAGING_SENDER_ID", >> "%ROOT%\firebase\firebase.js"
echo   appId: "YOUR_APP_ID" >> "%ROOT%\firebase\firebase.js"
echo }; >> "%ROOT%\firebase\firebase.js"
echo const app = initializeApp(firebaseConfig); >> "%ROOT%\firebase\firebase.js"
echo export default app; >> "%ROOT%\firebase\firebase.js"

:: ==========================================
:: 📌 Creating Routes File
:: ==========================================
echo import React from "react"; > "%ROOT%\routes.js"
echo import { BrowserRouter as Router, Routes, Route } from "react-router-dom"; >> "%ROOT%\routes.js"
echo import Home from "./pages/Frontend/Home"; >> "%ROOT%\routes.js"
echo import About from "./pages/Frontend/About"; >> "%ROOT%\routes.js"
echo import Contact from "./pages/Frontend/Contact"; >> "%ROOT%\routes.js"
echo import Login from "./pages/Auth/Login"; >> "%ROOT%\routes.js"
echo import Register from "./pages/Auth/Register"; >> "%ROOT%\routes.js"
echo import UserDashboard from "./pages/Dashboards/User/UserDashboard"; >> "%ROOT%\routes.js"
echo import AdminDashboard from "./pages/Dashboards/Admin/AdminDashboard"; >> "%ROOT%\routes.js"
echo. >> "%ROOT%\routes.js"
echo const AppRoutes = () => ( >> "%ROOT%\routes.js"
echo    ^<Router^> >> "%ROOT%\routes.js"
echo       ^<Routes^> >> "%ROOT%\routes.js"
echo          ^<Route path="/" element={^<Home /^>} /^> >> "%ROOT%\routes.js"
echo          ^<Route path="/about" element={^<About /^>} /^> >> "%ROOT%\routes.js"
echo          ^<Route path="/contact" element={^<Contact /^>} /^> >> "%ROOT%\routes.js"
echo          ^<Route path="/login" element={^<Login /^>} /^> >> "%ROOT%\routes.js"
echo          ^<Route path="/register" element={^<Register /^>} /^> >> "%ROOT%\routes.js"
echo          ^<Route path="/user-dashboard" element={^<UserDashboard /^>} /^> >> "%ROOT%\routes.js"
echo          ^<Route path="/admin-dashboard" element={^<AdminDashboard /^>} /^> >> "%ROOT%\routes.js"
echo       ^</Routes^> >> "%ROOT%\routes.js"
echo    ^</Router^> >> "%ROOT%\routes.js"
echo ); >> "%ROOT%\routes.js"
echo export default AppRoutes; >> "%ROOT%\routes.js"

:: ==========================================
:: ✅ Finalizing Setup
:: ==========================================
echo.
echo 🎉 Project setup completed successfully!
exit
