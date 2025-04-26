import os
import subprocess
import sys

# Step 1: Ask to create Vite project
create_project = input("Do you want to create a new Vite project? (yes/no): ").strip().lower()
if create_project == "yes":
    project_name = input("Enter the project name: ").strip()
    try:
        subprocess.run([
            "powershell",
            "-Command",
            f"npm create vite@latest {project_name} -y"
        ], check=True)
        print(f"✅ Vite project '{project_name}' created successfully.")
    except FileNotFoundError:
        print("❌ PowerShell or npm not found. Ensure Node.js is installed and accessible.")
        sys.exit(1)
    except subprocess.CalledProcessError as e:
        print(f"❌ Failed to create Vite project. Error: {e}")
        sys.exit(1)
else:
    print("ℹ️ Skipping Vite project creation.")
    project_name = input("Enter your existing Vite project folder name: ").strip()

# Step 2: Check project folder
if not os.path.exists(project_name):
    print(f"❌ Folder '{project_name}' not found. Please ensure the project exists.")
    sys.exit(1)

# Step 3: Change directory into the Vite project
os.chdir(project_name)

# Step 4: Initialize Git (if not already initialized)
if not os.path.exists(".git"):
    subprocess.run(["git", "init"])
    print("✅ Git initialized.")

# Step 5: Create .gitignore if it doesn't exist
gitignore_path = ".gitignore"
if not os.path.exists(gitignore_path):
    with open(gitignore_path, "w") as f:
        f.write("node_modules/\ndist/\n.env*\n")
    print("✅ .gitignore created.")
else:
    print("ℹ️ .gitignore already exists.")

# Step 6: Create .env files
env_files = {
    ".env": "",
    ".env.development": "",
    ".env.production": "",
    ".env.sample": "VITE_API_URL=https://example.com/api\nVITE_MODE=development\n"
}
for file_name, content in env_files.items():
    with open(file_name, "w", encoding="utf-8") as f:
        f.write(content)
    print(f"✅ Created {file_name}")

import subprocess

# Step 7: Ask to install default + additional libraries
install_libs = input("\nDo you want to install default libraries via Vite (npm install)? (yes/no): ").strip().lower()

if install_libs == "yes":
    try:
        subprocess.run(["powershell", "-Command", "npm install"], check=True)
        print("✅ Default dependencies installed.")
        
        # Predefined optional libraries
        library_options = {
            "1": "antd",
            "2": "react-bootstrap",
            "3": "bootstrap",
            "4": "react-router-dom",
            "5": "@supabase/supabase-js",
            "6": "firebase",
            "7": "axios",
            "8": "zustand",
            "9": "tailwindcss",
            "10": "classnames",
            "11": "framer-motion",
            "12": "react-icons",
            "13": "react-hook-form",
            "14": "recoil",
            "15": "jotai",
            "16": "react-query",
            "17": "dayjs",
            "18": "lodash"
        }

        print("\n📦 Optional Libraries:")
        for num, name in library_options.items():
            print(f"{num}. {name}")

        selected_libs = input("\nSelect libraries to install (comma-separated numbers, e.g., 1,4,6): ").strip()
        selected_list = selected_libs.split(',')

        to_install = [library_options.get(num.strip()) for num in selected_list if num.strip() in library_options]

        if to_install:
            try:
                install_command = f"npm install {' '.join(to_install)}"
                subprocess.run(["powershell", "-Command", install_command], check=True)
                print(f"✅ Installed selected libraries: {' '.join(to_install)}")
            except subprocess.CalledProcessError as e:
                print(f"❌ Failed to install libraries. Error: {e}")
        else:
            print("⚠️ No valid libraries selected.")

        # Ask for extra libraries
        extra_libs = input("Enter additional libraries to install (space-separated), or leave blank: ").strip()
        if extra_libs:
            subprocess.run(["powershell", "-Command", f"npm install {extra_libs}"], check=True)
            print(f"✅ Installed additional libraries: {extra_libs}")

    except subprocess.CalledProcessError as e:
        print(f"❌ Error during npm install: {e}")


# Step 8: Ask for Blank Canvas setup
blank_canvas = input("\nDo you want to set up a blank canvas (remove default files)? (yes/no): ").strip().lower()
if blank_canvas == "yes":
    import shutil

    # Files/folders to delete
    files_to_remove = [
        "public/vite.svg",
        "src/assets/react.svg",
        "src/App.css",
        "src/index.css",
        "src/App.jsx",
        "src/main.jsx"
    ]

    for file_path in files_to_remove:
        try:
            os.remove(file_path)
            print(f"🗑 Removed {file_path}")
        except FileNotFoundError:
            pass

    # Add App.scss
    with open("src/App.scss", "w", encoding="utf-8") as f:
        f.write("")
    print("✅ Created src/App.scss")

    # Add App.jsx
    with open("src/App.jsx", "w", encoding="utf-8") as f:
        f.write("""import { useState } from 'react'

function App() {

  return (
    <>
        <div>Blank Canvas</div>
    </>
  )
}

export default App
""")
    print("✅ Created src/App.jsx")

    # Add main.jsx
    with open("src/main.jsx", "w", encoding="utf-8") as f:
        f.write("""import { StrictMode } from 'react'
import { createRoot } from 'react-dom/client'
import App from './App.jsx'

createRoot(document.getElementById('root')).render(
  <StrictMode>
    <App />
  </StrictMode>,
)
""")
    print("✅ Created src/main.jsx")

print("\n🎉 Setup completed successfully.")
