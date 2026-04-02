#!/bin/bash
# GitArmor: Multi-site Integrity Checker
# color variable
GREEN='\033[0;32m'
RED='\033[0;31m'
NC='\033[0m' # No Color


# WEBSITE LISTING
SITES=(
  "abc-sites.co.jp"
  "examplesite.com"
  # ... else. ...
)

echo -e "🔍 ${GREEN}Git Audit Starting ...${NC}"
echo "-----------------------------------------------"

for SITE in "${SITES[@]}"; do
    echo "--- $SITE ---"
    # if it existing
    if [ -d "$HOME/$SITE/public_html" ]; then
        cd "$HOME/$SITE/public_html" || continue
        # check Git Status
        STATUS=$(git status --short)
        if [ -z "$STATUS" ]; then
            echo -e "  ${GREEN}✅ Clean (no drift)${NC}"
        else
            echo -e "${RED}$STATUS${NC}"
        fi
    else
        echo -e "  ${RED}❌ Path not found${NC}"
    fi
    echo ""
done

echo "-----------------------------------------------"
echo -e "✨ ${GREEN}Auditing Complete!${NC}"