#!/usr/bin/env bash
# scripts/update_readme.sh - Automatically updates README.md with a table of dotfile topics

DOTFILES_DIR="$(cd "$(dirname "$0")/.." && pwd)"
README="$DOTFILES_DIR/README.md"
TOPICS_DIR="$DOTFILES_DIR/topics"

# Check if markers exist in README
if ! grep -q "<!-- TOPICS_START -->" "$README" || ! grep -q "<!-- TOPICS_END -->" "$README"; then
    echo "Error: markers <!-- TOPICS_START --> and <!-- TOPICS_END --> not found in $README"
    exit 1
fi

# Generate the table header
TABLE="| Topic | Features | Tools/Apps |\n| :--- | :--- | :--- |"

# Iterate through topics
for topic in $(ls "$TOPICS_DIR" | sort); do
    TOPIC_PATH="$TOPICS_DIR/$topic"
    [[ -d "$TOPIC_PATH" ]] || continue

    FEATURES=""
    TOOLS=""

    # Detect features
    [[ -f "$TOPIC_PATH/Brewfile" ]] && FEATURES="$FEATURES 📦 Brewfile"
    [[ -n $(ls "$TOPIC_PATH"/*.zsh 2>/dev/null) ]] && FEATURES="$FEATURES 🐚 Shell"
    [[ -n $(ls "$TOPIC_PATH"/*.symlink 2>/dev/null) ]] && FEATURES="$FEATURES 🔗 Symlinks"

    # Extract tools from Brewfile
    if [[ -f "$TOPIC_PATH/Brewfile" ]]; then
        # Get up to 5 items, removing quotes and 'brew ' or 'cask '
        TOOLS=$(grep -E '^(brew|cask)' "$TOPIC_PATH/Brewfile" | head -n 5 | sed -E "s/^(brew|cask) //; s/\"//g" | paste -sd "," - | sed 's/,/, /g')
        [[ $(grep -E '^(brew|cask)' "$TOPIC_PATH/Brewfile" | wc -l) -gt 5 ]] && TOOLS="$TOOLS, ..."
    else
        # Fallback to key aliases or files
        [[ -f "$TOPIC_PATH/aliases.zsh" ]] && TOOLS="Aliases"
        [[ -f "$TOPIC_PATH/config.symlink" ]] && TOOLS="$TOOLS Config"
    fi

    # Append row
    TABLE="$TABLE\n| **$topic** | $FEATURES | $TOOLS |"
done

# Use temporary files for safely replacing the content
START_MARKER="<!-- TOPICS_START -->"
END_MARKER="<!-- TOPICS_END -->"

# Create a temporary file with the updated content
{
    sed -n "1,/$START_MARKER/p" "$README"
    echo -e "$TABLE"
    sed -n "/$END_MARKER/,\$p" "$README"
} > "$README.tmp"

mv "$README.tmp" "$README"
echo "README.md updated with topic table."
