import os
import subprocess

# Check if we're inside a git repo
if not os.path.exists(".git"):
    print("🚫 This folder is not a Git repository. Initializing Git...")
    subprocess.run(["git", "init"])

# Ask user to pull first
pull_first = input("Do you want to pull the latest changes before committing? (yes/no): ").strip().lower()

if pull_first == "yes":
    remote_set = subprocess.run(["git", "remote", "-v"], capture_output=True, text=True)
    if "origin" in remote_set.stdout:
        print("🔄 Pulling latest changes from remote...")
        subprocess.run(["git", "pull"])
    else:
        print("⚠️ No remote repository set. Skipping pull.")

# Ask for commit message
commit_message = input("📝 Enter your commit message: ").strip()

# Add all changes
print("📂 Staging all changes...")
subprocess.run(["git", "add", "."])

# Commit changes
print(f"✅ Committing with message: {commit_message}")
subprocess.run(["git", "commit", "-m", commit_message])

# Push changes
print("🚀 Pushing to remote repository...")
subprocess.run(["git", "push"])

print("🎉 Done!")
