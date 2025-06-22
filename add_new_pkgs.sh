#!/bin/bash

set -euo pipefail

NEW_DIR="./new"
MIRROR_DIR="./x86_64"
MODE="hard"

# Colors
GREEN='\033[1;32m'
YELLOW='\033[1;33m'
RED='\033[1;31m'
BLUE='\033[1;34m'
CYAN='\033[1;36m'
BOLD='\033[1m'
RESET='\033[0m'

# Check new_dir availability 
if [ ! -d "$NEW_DIR" ]; then
    echo -e "${RED}>> '$NEW_DIR' directory not found${RESET}"
    echo -e "${BLUE}>> working directory:${RESET} ${BOLD}$(pwd)${RESET}"
    exit 1
fi

# Parse flags
while [[ $# -gt 0 ]]; do
    case "$1" in
        --soft)
            MODE="soft"
            shift
            ;;
        --hard)
            MODE="hard"
            shift
            ;;
        *)
            echo -e "${RED}Unknown option:${RESET} $1"
            echo -e "Usage: $0 [--soft|--hard]"
            exit 1
            ;;
    esac
done

echo -e "${BOLD}${CYAN}Scanning for new packages in ${NEW_DIR}...${RESET}"
shopt -s nullglob

for pkgpath in "$NEW_DIR"/*.pkg.tar.zst; do
    pkgfile=$(basename "$pkgpath")
    pkgbase="${pkgfile%%-[0-9]*-[0-9]*-*.pkg.tar.zst}"

    echo -e "${BLUE}➤ Processing:${RESET} ${pkgfile}"
    echo -e "   ${CYAN}├─ Package name:${RESET} ${pkgbase}"

    # Portable filtering of matching files
    old_versions=()
    while IFS= read -r f; do
        fname=$(basename "$f")
        fbase="${fname%%-[0-9]*-[0-9]*-*.pkg.tar.zst}"
        if [[ "$fbase" == "$pkgbase" ]]; then
            # echo "      matched: $fname"
            old_versions+=("$f")
        # else
        #     echo "skipped: $fname"
        fi
    done < <(find "$MIRROR_DIR" -maxdepth 1 -type f -name "$pkgbase-*.pkg.tar.zst")


    if [[ ${#old_versions[@]} -gt 0 ]]; then
        echo -e "   ${YELLOW}├─ Removing old versions:${RESET}"
        for old in "${old_versions[@]}"; do
            echo -e "   ${YELLOW}│   └─${RESET} $(basename "$old")"
            rm -f -- "$old"
        done
    else
        echo -e "   ${YELLOW}├─ No previous version found.${RESET}"
    fi

    echo -e "   ${GREEN}├─ Copying new package to mirror...${RESET}"
    cp -- "$pkgpath" "$MIRROR_DIR/"

    if [[ "$MODE" == "hard" ]]; then
        echo -e "   ${RED}└─ Removing copied package from ${NEW_DIR}...${RESET}"
        rm -f -- "$pkgpath"
    else
        echo -e "   ${BLUE}└─ Retained package in ${NEW_DIR} (soft mode)${RESET}"
    fi

    echo ""
done

echo -e "${GREEN}Done.${RESET} Mode: ${BOLD}$MODE${RESET}"
