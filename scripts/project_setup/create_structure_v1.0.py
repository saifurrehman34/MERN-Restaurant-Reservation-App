import os

# Define internal subfolders for src
src_folders = [
    "src/assets",
    "src/components",
    "src/layouts",
    "src/pages",
    "src/services",
    "src/utils",
    "src/hooks",
    "src/context"
]

# Define other folders outside src
other_folders = [
    "public",
    "scripts/git_automation",
    "scripts/project_setup",
    "scripts/cleanup",
]

# Define essential files with sample content
files = {
    ".env": "",
    ".env.development": "",
    ".env.production": "",
    ".env.sample": "VITE_API_URL=https://example.com/api\nVITE_MODE=development\n",
    ".gitignore": "node_modules/\ndist/\n.env*\n",
    "README.md": "# Project Title\n\nDescribe your project here.\n",
    "package.json": "{\n  \"name\": \"vite-project\",\n  \"version\": \"1.0.0\"\n}\n",
    "vite.config.js": "// Vite config\nexport default {\n  // Add your Vite config here\n}\n",
    "public/index.html": "<!DOCTYPE html>\n<html>\n<head><title>Vite App</title></head>\n<body><div id=\"root\"></div></body>\n</html>\n",
    "scripts/git_automation/git_helper.py": "# Git automation script goes here\n",
    "scripts/project_setup/setup_envs.py": "# Script to generate .env files\n",
    "scripts/cleanup/cleanup.py": "# Script to delete dist, node_modules, etc.\n"
}

# Step 1: Check if 'src' folder exists
if os.path.exists("src"):
    # If src folder exists, create subfolders as per internal standards
    print("✅ 'src' folder exists. Creating standard subfolders inside 'src'...")
    for folder in src_folders:
        os.makedirs(folder, exist_ok=True)
else:
    print("⚠️ 'src' folder does not exist. Skipping subfolder creation inside 'src'.")

# Step 2: Create other main folders
for folder in other_folders:
    os.makedirs(folder, exist_ok=True)

# Step 3: Create essential files with predefined content
for file_path, content in files.items():
    with open(file_path, "w", encoding="utf-8") as f:
        f.write(content)

print("✅ Vite project folder structure created successfully.")
