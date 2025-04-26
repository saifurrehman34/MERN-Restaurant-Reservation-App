@echo off
setlocal enabledelayedexpansion

echo ==========================================
echo   🚀 Setting Up React Project Structure
echo ==========================================

SET "ROOT=src"

:: ==========================================
:: 📂 Creating Folder Structure
:: ==========================================
echo Creating project folders...

mkdir "%ROOT%"
mkdir "%ROOT%\assets\images"
mkdir "%ROOT%\assets\fonts"
mkdir "%ROOT%\assets\icons"

mkdir "%ROOT%\components"
mkdir "%ROOT%\context"
mkdir "%ROOT%\hooks"
mkdir "%ROOT%\layouts"
mkdir "%ROOT%\services"
mkdir "%ROOT%\styles"
mkdir "%ROOT%\utils"
mkdir "%ROOT%\seo"

mkdir "%ROOT%\pages"
mkdir "%ROOT%\pages\Frontend"
mkdir "%ROOT%\pages\Auth"
mkdir "%ROOT%\pages\Dashboards"

:: Frontend Pages (Each page gets its own folder)
call :create_page_structure "Frontend" "Home"
call :create_page_structure "Frontend" "About"
call :create_page_structure "Frontend" "Contact"

:: Auth Pages
call :create_page_structure "Auth" "Login"
call :create_page_structure "Auth" "Register"

:: Dashboards
call :create_page_structure "Dashboards\User" "UserDashboard"
call :create_page_structure "Dashboards\Admin" "AdminDashboard"

mkdir "public"
mkdir "public\seo"

:: ==========================================
:: 📝 Creating Copyright File
:: ==========================================
echo /* >> "COPYRIGHT.js"
echo  * Project: React App Setup >> "COPYRIGHT.js"
echo  * Author: Your Name >> "COPYRIGHT.js"
echo  * License: MIT >> "COPYRIGHT.js"
echo  * Created on: %DATE% >> "COPYRIGHT.js"
echo  */ >> "COPYRIGHT.js"

:: ==========================================
:: 🔖 SEO Files
:: ==========================================
echo "User-agent: *" > "public\robots.txt"
echo "Disallow:" >> "public\robots.txt"

echo "<urlset xmlns='http://www.sitemaps.org/schemas/sitemap/0.9'>" > "public\seo\sitemap.xml"
echo "</urlset>" >> "public\seo\sitemap.xml"

:: ==========================================
:: ✅ Finalizing Setup
:: ==========================================
echo.
echo 🎉 Project setup completed successfully!
exit

:: ==========================================
:: 📌 Function to Create Page Structure with Subfolders
:: ==========================================
:create_page_structure
mkdir "%ROOT%\pages\%1\%2"
mkdir "%ROOT%\pages\%1\%2\components"
mkdir "%ROOT%\pages\%1\%2\sections"
call :create_file "%ROOT%\pages\%1\%2\%2.js" "%2 Page"
exit /b

:: ==========================================
:: 📌 Function to Create Files with Copyright
:: ==========================================
:create_file
(
echo /* >> %1
echo  * Project: React App Setup >> %1
echo  * Author: Your Name >> %1
echo  * License: MIT >> %1
echo  * Created on: %DATE% >> %1
echo  */ >> %1
echo import React from "react"; >> %1
echo const %~n1 = () => ^<h1^>%2^</h1^>; >> %1
echo export default %~n1; >> %1
)
exit /b
