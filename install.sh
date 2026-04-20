#!/usr/bin/env bash
set -e

DOTFILES_DIR="$(cd "$(dirname "$0")" && pwd)"
TOPICS_DIR="$DOTFILES_DIR/topics"

# Topics to install (default to all if none provided)
SELECTED_TOPICS=("$@")
if [[ ${#SELECTED_TOPICS[@]} -eq 0 ]]; then
    SELECTED_TOPICS=($(ls "$TOPICS_DIR"))
fi

echo "Installing topics: ${SELECTED_TOPICS[*]}"

# Create essential directories
mkdir -p "$HOME/.config"

for topic in "${SELECTED_TOPICS[@]}"; do
    TOPIC_PATH="$TOPICS_DIR/$topic"
    if [[ ! -d "$TOPIC_PATH" ]]; then
        echo "Warning: Topic '$topic' not found. Skipping."
        continue
    fi

    echo "--- Topic: $topic ---"

    # 1. Install packages via Homebrew
    if [[ "$(uname)" == "Darwin" ]] && [[ -f "$TOPIC_PATH/Brewfile" ]]; then
        echo "Installing packages from $TOPIC_PATH/Brewfile..."
        brew bundle --file="$TOPIC_PATH/Brewfile"
    fi

    # 2. Symlink configuration files
    # Find all files ending in .symlink in this topic folder
    for symlink_file in "$TOPIC_PATH"/*.symlink; do
        [[ -e "$symlink_file" ]] || continue
        
        filename=$(basename "$symlink_file" .symlink)
        target=""

        case "$filename" in
            "starship.toml")
                target="$HOME/.config/starship.toml"
                ;;
            "config")
                target="$HOME/.gitconfig"
                ;;
            "ignore")
                target="$HOME/.gitignore_global"
                ;;
            *)
                target="$HOME/.$filename"
                ;;
        esac

        echo "Linking $symlink_file to $target..."
        ln -sf "$symlink_file" "$target"
    done
done

echo "Done. Restart your shell."
