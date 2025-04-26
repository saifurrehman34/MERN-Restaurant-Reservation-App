import os

# Ask user for type of structure
structure_type = input(
    "Select folder structure type:\n1. General (all industries)\n2. Restaurant-specific\nEnter choice (1 or 2): ").strip()

# Base folders
base_folders = [
    "public/seo",
    "src/assets/images",
    "src/assets/icons",
    "src/assets/fonts",
    "src/saas",
    "src/config",
    "src/context",
    "src/styles",
    "src/utils",
    "src/seo",
    "src/components/ui",
    "src/components/layout",
]

# Pages structure
page_groups = ["Auth", "Dashboards", "Frontend", "Backend"]

# Subcategories based on type
if structure_type == "2":
    sub_categories = ["Admin", "User", "Restaurant", "Delivery"]
else:
    sub_categories = ["Admin", "User"]

# Essential files with sample content
files = {
    ".env": "",
    ".env.development": "",
    ".env.production": "",
    ".env.sample": "VITE_API_URL=https://example.com/api\nVITE_MODE=development\n",
    ".gitignore": "node_modules/\ndist/\n.env*\n",
    "README.md": "# Project Title\n\nDescribe your project here.\n",
    "package.json": '{\n  "name": "vite-project",\n  "version": "1.0.0"\n}\n',
    "vite.config.js": "// Vite config\nexport default {\n  // Add your Vite config here\n}\n",
    "public/index.html": "<!DOCTYPE html>\n<html>\n<head><title>Vite App</title></head>\n<body><div id=\"root\"></div></body>\n</html>\n",
    "scripts/git_automation/git_helper.py": "# Git automation script goes here\n",
    "scripts/project_setup/setup_envs.py": "# Script to generate .env files\n",
    "scripts/cleanup/cleanup.py": "# Script to delete dist, node_modules, etc.\n",
    "COPYRIGHT.js": "/*\n * Project: React App Setup\n * Author: Your Name\n * License: MIT\n * Created on: DATE_PLACEHOLDER\n */\n"
}

# Function to create folders
def create_folders(folders):
    for folder in folders:
        os.makedirs(folder, exist_ok=True)

# Function to create files
def create_files(file_dict):
    for file_path, content in file_dict.items():
        dir_path = os.path.dirname(file_path)
        if dir_path:  # only create directories if path is not empty
            os.makedirs(dir_path, exist_ok=True)
        with open(file_path, "w", encoding="utf-8") as f:
            f.write(content)


# Function to create nested page folders
def create_page_structure():
    for group in page_groups:
        for sub in sub_categories:
            base_path = f"src/pages/{group}/{sub}"
            os.makedirs(f"{base_path}/components", exist_ok=True)
            os.makedirs(f"{base_path}/sections", exist_ok=True)
            page_name = f"{sub}{group}Page"
            with open(f"{base_path}/{page_name}.js", "w") as f:
                f.write(f"""/*
 * Project: React App Setup
 * Author: Your Name
 * License: MIT
 * Created on: DATE_PLACEHOLDER
 */
import React from "react";
const {page_name} = () => {{
  return (
    <div>
      <h1>{page_name}</h1>
    </div>
  );
}};
export default {page_name};
""")
            with open(f"{base_path}/components/{page_name}Component.js", "w") as f:
                f.write(f"// {page_name} Component\n")
            with open(f"{base_path}/sections/{page_name}HeroSection.js", "w") as f:
                f.write(f"// {page_name} Hero Section\n")
            with open(f"{base_path}/sections/{page_name}FeaturesSection.js", "w") as f:
                f.write(f"// {page_name} Features Section\n")

# Run setup
create_folders(base_folders)
create_page_structure()
create_files(files)

"✅ Vite/React folder structure created successfully."

