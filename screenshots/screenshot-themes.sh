#!/bin/bash
# Justice League Theme Screenshot Helper
# This script helps you systematically capture screenshots of all themes

THEMES=("green-lantern" "wonder-woman" "superman" "batman" "aquaman" "flash" "martian-manhunter" "shazam")
OUTPUT_DIR="$HOME/.local/share/warp-terminal/themes/justice-league/screenshots"

# Colors for output
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

echo -e "${BLUE}╔═══════════════════════════════════════════════╗${NC}"
echo -e "${BLUE}║  Justice League Theme Screenshot Helper      ║${NC}"
echo -e "${BLUE}╔═══════════════════════════════════════════════╗${NC}"
echo ""
echo -e "${YELLOW}Instructions:${NC}"
echo "1. This script will guide you through capturing screenshots"
echo "2. For each theme, activate it in Warp Terminal"
echo "3. Run colorful commands to showcase the theme"
echo "4. Take a screenshot and save it to this directory"
echo "5. Press Enter to continue to the next theme"
echo ""
echo -e "${GREEN}Suggested commands to run before screenshot:${NC}"
echo "  ls -la --color=always"
echo "  git status"
echo "  eza --icons --git -la"
echo ""
read -p "Press Enter to begin..."

for i in "${!THEMES[@]}"; do
    theme="${THEMES[$i]}"
    num=$((i + 1))
    
    echo ""
    echo -e "${BLUE}═══════════════════════════════════════════════${NC}"
    echo -e "${GREEN}Theme $num of ${#THEMES[@]}: ${theme}${NC}"
    echo -e "${BLUE}═══════════════════════════════════════════════${NC}"
    echo ""
    echo "Steps:"
    echo "  1. Open Warp Settings → Appearance → Themes"
    echo "  2. Search for and activate: '${theme}'"
    echo "  3. Run colorful commands in the terminal"
    echo "  4. Take screenshot (Ctrl+Shift+PrintScreen or gnome-screenshot -a)"
    echo "  5. Save as: ${OUTPUT_DIR}/${theme}.png"
    echo ""
    
    # Check if screenshot already exists
    if [ -f "${OUTPUT_DIR}/${theme}.png" ]; then
        echo -e "${YELLOW}⚠ Screenshot already exists for ${theme}${NC}"
        read -p "Overwrite? (y/N): " overwrite
        if [[ ! $overwrite =~ ^[Yy]$ ]]; then
            echo -e "${GREEN}✓ Skipping ${theme}${NC}"
            continue
        fi
    fi
    
    read -p "Press Enter when screenshot is saved (or 's' to skip)... " response
    
    if [[ $response =~ ^[Ss]$ ]]; then
        echo -e "${YELLOW}⊘ Skipped ${theme}${NC}"
    else
        if [ -f "${OUTPUT_DIR}/${theme}.png" ]; then
            echo -e "${GREEN}✓ Screenshot saved for ${theme}${NC}"
        else
            echo -e "${YELLOW}⚠ Warning: Screenshot file not found${NC}"
        fi
    fi
done

echo ""
echo -e "${BLUE}═══════════════════════════════════════════════${NC}"
echo -e "${GREEN}Screenshot capture complete!${NC}"
echo -e "${BLUE}═══════════════════════════════════════════════${NC}"
echo ""

# Check how many screenshots were captured
captured=0
for theme in "${THEMES[@]}"; do
    if [ -f "${OUTPUT_DIR}/${theme}.png" ]; then
        ((captured++))
    fi
done

echo "Screenshots captured: $captured / ${#THEMES[@]}"
echo ""

if [ $captured -eq ${#THEMES[@]} ]; then
    echo -e "${GREEN}🎉 All screenshots captured!${NC}"
    echo ""
    echo "Next steps:"
    echo "  1. Review screenshots in: $OUTPUT_DIR"
    echo "  2. Commit to git: git add screenshots/*.png"
    echo "  3. Commit: git commit -m 'Add theme screenshots'"
    echo "  4. Push: git push"
elif [ $captured -gt 0 ]; then
    echo -e "${YELLOW}Partial completion. Missing screenshots:${NC}"
    for theme in "${THEMES[@]}"; do
        if [ ! -f "${OUTPUT_DIR}/${theme}.png" ]; then
            echo "  - ${theme}.png"
        fi
    done
else
    echo -e "${YELLOW}No screenshots were captured.${NC}"
    echo "Run this script again when ready to take screenshots."
fi

echo ""
