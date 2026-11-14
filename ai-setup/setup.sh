#!/usr/bin/env bash
# Sets up rules globally or in a local project directory.
# Run with bash (not sh).

set -e

# 1. Locate GEMINI.md (locally if cloned, or fetch from GitHub if pasted into terminal)
local_source=""
script_dir="$(cd "$(dirname "${BASH_SOURCE[0]:-$0}")" 2>/dev/null && pwd || true)"

if [ -n "$script_dir" ] && [ -f "$script_dir/GEMINI.md" ]; then
    local_source="$script_dir/GEMINI.md"
elif [ -f "./ai-setup/GEMINI.md" ]; then
    local_source="./ai-setup/GEMINI.md"
elif [ -f "./GEMINI.md" ]; then
    local_source="./GEMINI.md"
fi

printf '\n=== AI Rules Setup ===\n'
printf '1) Global\n'
printf '2) Local project directory\n'
read -rp "Select [1/2, default: 1]: " choice </dev/tty
choice=${choice:-1}

if [ "$choice" = "2" ]; then
    read -rp "Target directory [default: .]: " target_dir </dev/tty
    target_dir=${target_dir:-.}
    if [ ! -d "$target_dir" ]; then
        printf '\n[!] Directory does not exist: %s\n' "$target_dir" >&2
        exit 1
    fi
    dest_dir="$(cd "$target_dir" && pwd)"
else
    dest_dir="$HOME/.gemini"
    if [ ! -d "$dest_dir" ]; then
        read -rp "Directory $dest_dir does not exist. Create? [Y/n]: " create </dev/tty
        create=${create:-y}
        case "$create" in
            [nN]*) printf '\n[i] Cancelled.\n'; exit 0 ;;
            *) mkdir -p "$dest_dir" && printf '[+] Created directory: %s\n' "$dest_dir" ;;
        esac
    fi
fi

dest_file="$dest_dir/GEMINI.md"

if [ -f "$dest_file" ] || [ -L "$dest_file" ]; then
    printf '\n[!] File already exists: %s\n' "$dest_file"
    read -rp "Overwrite? [y/N]: " overwrite </dev/tty
    overwrite=${overwrite:-n}
    case "$overwrite" in
        [yY]*)
            cp "$dest_file" "$dest_file.bak"
            printf '[i] Backup created at: %s.bak\n' "$dest_file"
            ;;
        *)
            printf '[i] Cancelled - existing file left unchanged.\n'
            exit 0
            ;;
    esac
fi

# Install GEMINI.md
if [ -n "$local_source" ]; then
    cp "$local_source" "$dest_file"
else
    url="https://raw.githubusercontent.com/FalcO0O/scripts/master/ai-setup/GEMINI.md"
    printf 'Downloading GEMINI.md from GitHub...\n'
    curl -fsSL "$url" -o "$dest_file"
fi

printf '\n[+] Done! Installed GEMINI.md to:\n    %s\n' "$dest_file"
exit 0
