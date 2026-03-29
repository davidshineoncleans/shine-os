#!/bin/bash

# ─────────────────────────────────────────────────────
# SHINE OS — One-command install
# https://github.com/davidshineoncleans/shine-os
# Built by David Caldicott · hello@shineon.world
# ─────────────────────────────────────────────────────

set -e

SHINE_VERSION="0.1"
SHINE_REPO="https://github.com/davidshineoncleans/shine-os.git"
SHINE_WEBHOOK="https://shineon.world/api/welcome-call"

# ─── Colors ───
YELLOW='\033[1;33m'
GREEN='\033[0;32m'
BLUE='\033[0;34m'
BOLD='\033[1m'
NC='\033[0m'

echo ""
echo -e "${YELLOW}🌟 SHINE OS v${SHINE_VERSION}${NC}"
echo -e "An AI operating system for your business."
echo ""
echo "─────────────────────────────────────────"
echo ""

# ─── Step 1: Clone ───
echo -e "${BOLD}Downloading SHINE OS...${NC}"
if [ -d "shine-os" ]; then
    echo "  → shine-os/ already exists. Pulling latest..."
    cd shine-os && git pull origin main && cd ..
else
    git clone --quiet "$SHINE_REPO"
fi
echo -e "${GREEN}  ✓ Downloaded${NC}"
echo ""

# ─── Step 2: Quick questions ───
echo -e "${BOLD}Quick setup — just 4 questions:${NC}"
echo ""

read -p "  What's your business name? → " BUSINESS_NAME
read -p "  What do you do? (e.g. cleaning, plumbing, consulting) → " BUSINESS_TYPE
read -p "  Your first name? → " YOUR_NAME
echo ""
echo -e "  ${BLUE}Optional:${NC} Give us your phone number and Donna — our AI receptionist —"
echo "  will call you in about 60 seconds to welcome you and check everything's working."
echo "  (Leave blank to skip)"
read -p "  Phone number? → " PHONE_NUMBER

echo ""

# ─── Step 3: Customise workspace ───
echo -e "${BOLD}Setting up your workspace...${NC}"
cd shine-os

# Update CLAUDE.md
if [ -f "CLAUDE.md" ]; then
    sed -i.bak "s/\[YOUR_BUSINESS_NAME\]/$BUSINESS_NAME/g" CLAUDE.md
    sed -i.bak "s/\[ONE LINE DESCRIPTION\]/$BUSINESS_TYPE/g" CLAUDE.md
    sed -i.bak "s/\[YOUR_NAME\]/$YOUR_NAME/g" CLAUDE.md
    rm -f CLAUDE.md.bak
fi

# Update glossary
if [ -f "Memory/glossary.md" ]; then
    sed -i.bak "s/\[YOUR_BUSINESS_NAME\]/$BUSINESS_NAME/g" Memory/glossary.md
    sed -i.bak "s/\[YOUR_NAME\]/$YOUR_NAME/g" Memory/glossary.md
    rm -f Memory/glossary.md.bak
fi

# Update INDEX.md
if [ -f "INDEX.md" ]; then
    sed -i.bak "s/\[YOUR_BUSINESS_NAME\]/$BUSINESS_NAME/g" INDEX.md
    rm -f INDEX.md.bak
fi

echo -e "${GREEN}  ✓ Workspace customised for ${BUSINESS_NAME}${NC}"

# ─── Step 4: Welcome call ───
if [ -n "$PHONE_NUMBER" ]; then
    echo ""
    echo -e "${BOLD}Calling Donna...${NC}"

    WEBHOOK_RESPONSE=$(curl -s -w "%{http_code}" -o /dev/null \
        -X POST "$SHINE_WEBHOOK" \
        -H "Content-Type: application/json" \
        -d "{
            \"business_name\": \"$BUSINESS_NAME\",
            \"business_type\": \"$BUSINESS_TYPE\",
            \"name\": \"$YOUR_NAME\",
            \"phone\": \"$PHONE_NUMBER\",
            \"source\": \"terminal-install\",
            \"version\": \"$SHINE_VERSION\"
        }" 2>/dev/null || echo "000")

    if [ "$WEBHOOK_RESPONSE" = "200" ] || [ "$WEBHOOK_RESPONSE" = "201" ]; then
        echo -e "${GREEN}  ✓ Donna will call you in about 60 seconds${NC}"
    else
        echo -e "  → Couldn't reach Donna right now (she might be busy). No worries — you're all set."
        echo -e "  → If you hit any issues: hello@shineon.world"
    fi
fi

# ─── Done ───
echo ""
echo "─────────────────────────────────────────"
echo ""
echo -e "${GREEN}${BOLD}✅ SHINE OS is ready.${NC}"
echo ""
echo -e "Your workspace is at: ${BOLD}./shine-os/${NC}"
echo ""
echo -e "${BOLD}Three ways to start:${NC}"
echo ""
echo -e "  ${YELLOW}1. Claude Cowork (best)${NC}"
echo "     Open the Claude app → select the shine-os folder → start talking"
echo ""
echo -e "  ${YELLOW}2. Any AI (ChatGPT, Gemini, etc.)${NC}"
echo "     Copy the contents of CLAUDE.md → paste as your first message"
echo ""
echo -e "  ${YELLOW}3. Obsidian${NC}"
echo "     Open shine-os/ as a vault → wiki-links work natively"
echo ""
echo -e "Say this to get started:"
echo ""
echo -e "  ${BLUE}\"I've just installed SHINE OS for ${BUSINESS_NAME}. Let's get set up.\"${NC}"
echo ""
echo -e "Questions? Bugs? Ideas? → ${BOLD}hello@shineon.world${NC}"
echo -e "Updates: ${BOLD}cd shine-os && git pull${NC}"
echo ""
