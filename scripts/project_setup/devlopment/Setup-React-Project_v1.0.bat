@echo off
echo ==========================================
echo   🚀 Setting up React + Node.js + Firebase Project
echo ==========================================
echo.

SET "ROOT=src"

:: ==========================================
:: 📂 Creating Main Folder Structure
:: ==========================================
mkdir %ROOT%
mkdir %ROOT%\pages
mkdir %ROOT%\pages\Frontend
mkdir %ROOT%\pages\Auth
mkdir %ROOT%\pages\Dashboards
mkdir %ROOT%\pages\Dashboards\User
mkdir %ROOT%\pages\Dashboards\Admin
mkdir %ROOT%\pages\Backend
mkdir %ROOT%\components
mkdir %ROOT%\firebase
mkdir %ROOT%\context
mkdir %ROOT%\hooks
mkdir %ROOT%\services

:: ==========================================
:: 📝 Creating Base Files with Default Content
:: ==========================================

:: 🏠 Frontend Pages
(
echo // Copyright (c) 2024 Your Company
echo import React from "react";
echo const Home = () => ^{ return ^<h1^>🏠 Home Page^</h1^>; ^};
echo export default Home;
) > %ROOT%\pages\Frontend\Home.js

(
echo // Copyright (c) 2024 Your Company
echo import React from "react";
echo const About = () => ^{ return ^<h1^>ℹ️ About Us^</h1^>; ^};
echo export default About;
) > %ROOT%\pages\Frontend\About.js

(
echo // Copyright (c) 2024 Your Company
echo import React from "react";
echo const Contact = () => ^{ return ^<h1^>📞 Contact Us^</h1^>; ^};
echo export default Contact;
) > %ROOT%\pages\Frontend\Contact.js

:: 🔐 Auth Pages
(
echo // Copyright (c) 2024 Your Company
echo import React from "react";
echo const Login = () => ^{ return ^<h1^>🔑 Login Page^</h1^>; ^};
echo export default Login;
) > %ROOT%\pages\Auth\Login.js

(
echo // Copyright (c) 2024 Your Company
echo import React from "react";
echo const Register = () => ^{ return ^<h1^>📝 Register Page^</h1^>; ^};
echo export default Register;
) > %ROOT%\pages\Auth\Register.js

:: 👤 User Dashboard Pages
(
echo // Copyright (c) 2024 Your Company
echo import React from "react";
echo const UserDashboard = () => ^{ return ^<h1^>📊 User Dashboard^</h1^>; ^};
echo export default UserDashboard;
) > %ROOT%\pages\Dashboards\User\UserDashboard.js

(
echo // Copyright (c) 2024 Your Company
echo import React from "react";
echo const Profile = () => ^{ return ^<h1^>👤 User Profile^</h1^>; ^};
echo export default Profile;
) > %ROOT%\pages\Dashboards\User\Profile.js

:: 🔧 Admin Dashboard Pages
(
echo // Copyright (c) 2024 Your Company
echo import React from "react";
echo const AdminDashboard = () => ^{ return ^<h1^>🛠️ Admin Dashboard^</h1^>; ^};
echo export default AdminDashboard;
) > %ROOT%\pages\Dashboards\Admin\AdminDashboard.js

(
echo // Copyright (c) 2024 Your Company
echo import React from "react";
echo const ManageUsers = () => ^{ return ^<h1^>👥 Manage Users^</h1^>; ^};
echo export default ManageUsers;
) > %ROOT%\pages\Dashboards\Admin\ManageUsers.js

:: 🖥️ Backend Pages
(
echo // Copyright (c) 2024 Your Company
echo import React from "react";
echo const Users = () => ^{ return ^<h1^>👥 Manage Users Backend^</h1^>; ^};
echo export default Users;
) > %ROOT%\pages\Backend\Users.js

(
echo // Copyright (c) 2024 Your Company
echo import React from "react";
echo const Settings = () => ^{ return ^<h1^>⚙️ Settings^</h1^>; ^};
echo export default Settings;
) > %ROOT%\pages\Backend\Settings.js

:: ==========================================
:: 📌 Creating Routes File
:: ==========================================
(
echo // Copyright (c) 2024 Your Company
echo import React from "react";
echo import { BrowserRouter as Router, Routes, Route } from "react-router-dom";
echo import Home from "./pages/Frontend/Home";
echo import About from "./pages/Frontend/About";
echo import Contact from "./pages/Frontend/Contact";
echo import Login from "./pages/Auth/Login";
echo import Register from "./pages/Auth/Register";
echo import UserDashboard from "./pages/Dashboards/User/UserDashboard";
echo import AdminDashboard from "./pages/Dashboards/Admin/AdminDashboard";
echo const AppRoutes = () => (
echo    ^<Router^>
echo       ^<Routes^>
echo          ^<Route path="/" element={^<Home /^>} /^>
echo          ^<Route path="/about" element={^<About /^>} /^>
echo          ^<Route path="/contact" element={^<Contact /^>} /^>
echo          ^<Route path="/login" element={^<Login /^>} /^>
echo          ^<Route path="/register" element={^<Register /^>} /^>
echo          ^<Route path="/user-dashboard" element={^<UserDashboard /^>} /^>
echo          ^<Route path="/admin-dashboard" element={^<AdminDashboard /^>} /^>
echo       ^</Routes^>
echo    ^</Router^>
echo );
echo export default AppRoutes;
) > %ROOT%\routes.js

:: ==========================================
:: 🔐 Creating Auth Context API
:: ==========================================
(
echo // Copyright (c) 2024 Your Company
echo import React, { createContext, useContext, useState } from "react";
echo const AuthContext = createContext();
echo export const AuthProvider = ({ children }) => {
echo     const [user, setUser] = useState(null);
echo     return (
echo         ^<AuthContext.Provider value={{ user, setUser }}^>
echo             {children}
echo         ^</AuthContext.Provider^>
echo     );
echo };
echo export const useAuth = () => useContext(AuthContext);
) > %ROOT%\context\AuthContext.js

:: ==========================================
:: 🔥 Firebase Config File
:: ==========================================
(
echo // Copyright (c) 2024 Your Company
echo import { initializeApp } from "firebase/app";
echo const firebaseConfig = {
echo   apiKey: "YOUR_API_KEY",
echo   authDomain: "YOUR_AUTH_DOMAIN",
echo   projectId: "YOUR_PROJECT_ID",
echo   storageBucket: "YOUR_STORAGE_BUCKET",
echo   messagingSenderId: "YOUR_MESSAGING_SENDER_ID",
echo   appId: "YOUR_APP_ID"
echo };
echo const app = initializeApp(firebaseConfig);
echo export default app;
) > %ROOT%\firebase\firebase.js

:: ==========================================
:: 🎯 Creating Main Entry Point Files
:: ==========================================
(
echo // Copyright (c) 2024 Your Company
echo import React from "react";
echo import AppRoutes from "./routes";
echo import { AuthProvider } from "./context/AuthContext";
echo function App() {
echo   return (
echo     ^<AuthProvider^>
echo       ^<AppRoutes /^>
echo     ^</AuthProvider^>
echo   );
echo }
echo export default App;
) > %ROOT%\App.js

(
echo // Copyright (c) 2024 Your Company
echo import React from "react";
echo import ReactDOM from "react-dom/client";
echo import App from "./App";
echo import { BrowserRouter } from "react-router-dom";
echo ReactDOM.createRoot(document.getElementById("root")).render(
echo   ^<BrowserRouter^>
echo     ^<App /^>
echo   ^</BrowserRouter^>
echo );
) > %ROOT%\index.js

echo ✅ Project setup completed successfully!
