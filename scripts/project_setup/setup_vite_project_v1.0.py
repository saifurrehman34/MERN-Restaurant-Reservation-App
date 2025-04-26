import os

# Ask for the project name
project_name = input("Enter your new Vite project name: ").strip()

# Create the project folder
os.makedirs(project_name, exist_ok=True)

# Navigate into project
os.chdir(project_name)

# Initialize a Vite project (Assumes Node.js + Vite already installed)
os.system("npm create vite@latest")

# Create common environment files
env_files = {
    ".env": "VITE_API_URL=http://localhost:3000\nMODE=local",
    ".env.production": "VITE_API_URL=https://api.production.com\nMODE=production",
    ".env.development": "VITE_API_URL=http://dev.server.com\nMODE=development",
    ".env.sample": "# Sample env\nVITE_API_URL=https://sample.api.com\nMODE=sample"
}

for file, content in env_files.items():
    with open(file, "w") as f:
        f.write(content)

# Create standard folders (like assets, components)
folders = ["src/assets", "src/components", "src/pages", "src/utils"]
for folder in folders:
    os.makedirs(folder, exist_ok=True)

print(f"\n🎉 Project '{project_name}' setup completed successfully!!!")
