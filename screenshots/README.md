# Screenshots Directory

This directory contains screenshots of each Justice League theme in action.

## How to Capture Screenshots

### Using Warp Terminal

1. **Activate a theme:**
   - Open Warp Terminal
   - Go to Settings → Appearance → Themes
   - Select the Justice League theme you want to screenshot

2. **Set up a good example:**
   - Run some colorful commands to show off the theme
   - Suggested commands:
     ```bash
     # Show directory listing with colors
     ls -la --color=always
     
     # Show git status with colors
     git status
     
     # Run a command that shows various colors
     echo -e "\033[0;30mBlack\033[0m \033[0;31mRed\033[0m \033[0;32mGreen\033[0m \033[0;33mYellow\033[0m \033[0;34mBlue\033[0m \033[0;35mMagenta\033[0m \033[0;36mCyan\033[0m \033[0;37mWhite\033[0m"
     
     # Or use eza if installed
     eza --icons --git -la
     ```

3. **Take the screenshot:**
   - **Linux/Ubuntu:** Press `Shift + Ctrl + Print Screen` (select area)
   - Or use: `gnome-screenshot -a`
   - Or use: `flameshot gui` (if installed)

4. **Save the screenshot:**
   - Name it according to the theme: `green-lantern.png`, `batman.png`, etc.
   - Save as PNG format
   - Recommended size: 1920x1080 or similar
   - Save to this directory

### Batch Screenshot Script

Here's a script to help you take all screenshots systematically:

```bash
#!/bin/bash
# screenshot-themes.sh

THEMES=("green-lantern" "wonder-woman" "superman" "batman" "aquaman" "flash" "martian-manhunter" "shazam")
OUTPUT_DIR="$HOME/.local/share/warp-terminal/themes/justice-league/screenshots"

echo "Justice League Theme Screenshot Helper"
echo "======================================"
echo ""
echo "Instructions:"
echo "1. This script will help you take screenshots of all 8 themes"
echo "2. For each theme, activate it in Warp Terminal"
echo "3. Run some colorful commands (ls, git status, etc.)"
echo "4. Press Enter when ready to take screenshot"
echo "5. Use your screenshot tool to capture the terminal"
echo ""

for theme in "${THEMES[@]}"; do
    echo "Next theme: $theme"
    echo "1. Activate '$theme' theme in Warp"
    echo "2. Run colorful commands"
    echo "3. Take screenshot and save as: $OUTPUT_DIR/${theme}.png"
    read -p "Press Enter when screenshot is saved..."
    echo "✓ $theme screenshot marked as complete"
    echo ""
done

echo "All screenshots captured! 🎉"
```

Save this as `screenshot-themes.sh`, make it executable (`chmod +x screenshot-themes.sh`), and run it.

## Screenshot Requirements

- **Format:** PNG (supports transparency if needed)
- **Resolution:** Minimum 1280x720, recommended 1920x1080
- **Content:** Should show terminal with theme colors clearly visible
- **Naming:** Exact match to theme file names (lowercase with hyphens)

### File Names

- `green-lantern.png`
- `wonder-woman.png`
- `superman.png`
- `batman.png`
- `aquaman.png`
- `flash.png`
- `martian-manhunter.png`
- `shazam.png`

## Suggested Terminal Content for Screenshots

Show a mix of:
- Directory listing (`ls -la` or `eza`)
- Git status/log (`git status`, `git log --oneline --graph`)
- Some code or text files
- Command output with different colors
- Your shell prompt

## Example Screenshot Commands

```bash
# Create a colorful terminal display
cat << 'EOF'
#!/bin/bash
# Justice League Theme Demo

echo "Testing terminal colors..."
echo ""

# ANSI color test
echo -e "\033[0;30m■ Black (normal)\033[0m    \033[1;30m■ Black (bright)\033[0m"
echo -e "\033[0;31m■ Red (normal)\033[0m      \033[1;31m■ Red (bright)\033[0m"
echo -e "\033[0;32m■ Green (normal)\033[0m    \033[1;32m■ Green (bright)\033[0m"
echo -e "\033[0;33m■ Yellow (normal)\033[0m   \033[1;33m■ Yellow (bright)\033[0m"
echo -e "\033[0;34m■ Blue (normal)\033[0m     \033[1;34m■ Blue (bright)\033[0m"
echo -e "\033[0;35m■ Magenta (normal)\033[0m  \033[1;35m■ Magenta (bright)\033[0m"
echo -e "\033[0;36m■ Cyan (normal)\033[0m     \033[1;36m■ Cyan (bright)\033[0m"
echo -e "\033[0;37m■ White (normal)\033[0m    \033[1;37m■ White (bright)\033[0m"
EOF
```

## After Taking Screenshots

1. Verify all 8 PNG files are in this directory
2. Check file sizes (should be reasonable, compress if needed)
3. Commit and push to GitHub:
   ```bash
   git add screenshots/*.png
   git commit -m "Add theme screenshots to gallery"
   git push
   ```

## Notes

- Screenshots will be displayed in the main README.md
- They help users preview themes before installation
- Consider taking screenshots both with and without background images
- If you update a theme's colors, update its screenshot too
