#!/bin/bash

# --- Configuration ---
SCRIPT_NAME="gcheck.sh"
ALIAS_NAME="gcheck"
BASHRC="$HOME/.bashrc"
CURRENT_DIR=$(pwd)
SCRIPT_PATH="$CURRENT_DIR/$SCRIPT_NAME"

echo "🚀 GitArmor Installer Starting..."

# 1.  gcheck.sh confirmation
if [ ! -f "$SCRIPT_PATH" ]; then
    echo "❌ Error: $SCRIPT_NAME not found in $CURRENT_DIR"
    exit 1
fi

# 2.  chmod +x for auto-run
echo "🛡️ Setting execution permissions for $SCRIPT_NAME..."
chmod +x "$SCRIPT_PATH"

# 3. check alias in .bashrc ( avoid overwritten)
if grep -q "alias $ALIAS_NAME=" "$BASHRC"; then
    echo "⚠️  Alias '$ALIAS_NAME' already exists in $BASHRC. Skipping..."
else
    # 4. Backup .bashrc before edit
    cp "$BASHRC" "$BASHRC.bak.$(date +%Y%m%d_%H%M%S)"
    echo "💾 Backup of .bashrc created."

    # 5. add Alias into .bashrc
    echo "" >> "$BASHRC"
    echo "# GitArmor: Multi-site Integrity Auditor" >> "$BASHRC"
    echo "alias $ALIAS_NAME='$SCRIPT_PATH'" >> "$BASHRC"
    
    echo "✅ Alias '$ALIAS_NAME' added to $BASHRC"
fi

echo "-----------------------------------------------"
echo "✨ Installation Complete!"
echo "💡 Please run: 'source ~/.bashrc' to start using '$ALIAS_NAME'"
echo "-----------------------------------------------"