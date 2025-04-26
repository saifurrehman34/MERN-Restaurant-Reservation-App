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

print("\n🎉 Vite project setup completed with environment files and Git initialization.")
