import os
import subprocess

# Function to check if git repo is initialized
def is_git_repo():
    return os.path.exists(".git")

# Function to run a command and return the result
def run_command(cmd_list, show_output=True):
    result = subprocess.run(cmd_list, capture_output=not show_output, text=True)
    if not show_output:
        return result.stdout.strip()
    return None

# Step 0: Check if Git user.name and user.email are configured
def is_git_configured():
    name = run_command(["git", "config", "--global", "user.name"], show_output=False)
    email = run_command(["git", "config", "--global", "user.email"], show_output=False)
    return bool(name) and bool(email)

def configure_git():
    print("🔧 Git global config not found. Let's set it up.")
    name = input("👤 Enter your name for Git commits: ").strip()
    email = input("📧 Enter your email for Git commits: ").strip()
    
    run_command(["git", "config", "--global", "user.name", name])
    run_command(["git", "config", "--global", "user.email", email])
    
    print("✅ Git configured successfully.\n")

# Check and configure Git if needed
if not is_git_configured():
    configure_git()
else:
    print("✅ Git is already configured.\n")

# Step 1: Check if it's a Git repo
if not is_git_repo():
    print("🚫 This folder is not a Git repository. Initializing Git...")
    run_command(["git", "init"])
    print("🧷 Git initialized. Now set remote before pushing.")

# Step 2: Ask for pull
pull_input = input("🔄 Do you want to pull the latest changes from remote? (yes/no): ").strip().lower()
if pull_input == "yes":
    remote_status = run_command(["git", "remote", "-v"], show_output=False)
    if "origin" in remote_status:
        print("📥 Pulling latest changes...")
        run_command(["git", "pull"])
    else:
        print("⚠️ No remote set. Use 'git remote add origin <URL>' to connect your repo.")

# Step 3: Ask for commit
commit_input = input("📝 Do you want to commit your changes now? (yes/no): ").strip().lower()
if commit_input == "yes":
    commit_message = input("📝 Enter commit message: ").strip()
    
    # Stage and commit changes
    print("📂 Staging all files...")
    run_command(["git", "add", "."])
    
    print(f"✅ Committing with message: '{commit_message}'")
    run_command(["git", "commit", "-m", commit_message])
else:
    print("🕓 Skipping commit.")

# Step 4: Ask for push
push_input = input("🚀 Do you want to push now? (yes/no): ").strip().lower()
if push_input == "yes":
    print("📤 Pushing to remote...")
    run_command(["git", "push"])
else:
    print("🛑 Skipping push. You can push later with 'git push'")

print("\n✅ All done! 🎉")