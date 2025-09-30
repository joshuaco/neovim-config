#!/bin/bash
# Post-Migration Setup Script
# Run this after the migration to ensure everything is set up correctly

echo "🚀 Neovim Post-Migration Setup Script"
echo "======================================"
echo ""

# Colors for output
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m' # No Color

# Check if Neovim is installed
if ! command -v nvim &> /dev/null; then
    echo -e "${RED}❌ Neovim is not installed!${NC}"
    exit 1
fi

echo -e "${GREEN}✓${NC} Neovim found: $(nvim --version | head -n1)"
echo ""

# Backup check
BACKUP_FILE=~/.config/nvim-backup-20250930-131358.tar.gz
if [ -f "$BACKUP_FILE" ]; then
    echo -e "${GREEN}✓${NC} Backup found at: $BACKUP_FILE"
else
    echo -e "${YELLOW}⚠${NC}  Backup not found. Creating one now..."
    cd ~/.config && tar -czf nvim-backup-$(date +%Y%m%d-%H%M%S).tar.gz nvim/
fi
echo ""

# Step 1: Sync lazy.nvim plugins
echo "📦 Step 1: Syncing plugins with lazy.nvim..."
nvim --headless "+Lazy! sync" +qa 2>/dev/null
if [ $? -eq 0 ]; then
    echo -e "${GREEN}✓${NC} Plugins synced successfully"
else
    echo -e "${YELLOW}⚠${NC}  Please run :Lazy sync manually in Neovim"
fi
echo ""

# Step 2: Update Treesitter parsers
echo "🌳 Step 2: Updating Treesitter parsers..."
nvim --headless "+TSUpdateSync" +qa 2>/dev/null
if [ $? -eq 0 ]; then
    echo -e "${GREEN}✓${NC} Treesitter parsers updated"
else
    echo -e "${YELLOW}⚠${NC}  Please run :TSUpdate manually in Neovim"
fi
echo ""

# Step 3: Install vtsls (replacing ts_ls)
echo "🔧 Step 3: Installing vtsls (TypeScript LSP)..."
echo "This requires Mason to be set up first."
echo "Please run the following commands in Neovim:"
echo ""
echo -e "${YELLOW}  :MasonInstall vtsls${NC}"
echo -e "${YELLOW}  :MasonUninstall typescript-language-server  (optional)${NC}"
echo ""

# Step 4: Health check recommendations
echo "🏥 Step 4: Health Check Recommendations"
echo "Run these commands in Neovim to verify everything:"
echo ""
echo -e "  ${YELLOW}:checkhealth lazy${NC}"
echo -e "  ${YELLOW}:checkhealth mason${NC}"
echo -e "  ${YELLOW}:checkhealth nvim-treesitter${NC}"
echo -e "  ${YELLOW}:checkhealth lsp${NC}"
echo ""

# Step 5: Summary of changes
echo "📋 Step 5: Summary of Changes"
echo ""
echo -e "${GREEN}✓${NC} Removed deprecated files:"
echo "  - lua/plugins/mason-workaround.lua"
echo "  - lua/plugins/project.nvim"
echo "  - lua/plugins/nvim-treesitter-textobjects.lua"
echo "  - tmp/* (temporary files)"
echo ""
echo -e "${GREEN}✓${NC} Updated configurations:"
echo "  - lua/config/lazy.lua (removed vim.loop, disabled ShowkeysToggle)"
echo "  - lua/plugins/lsp-config.lua (migrated ts_ls → vtsls, improved diagnostics)"
echo "  - lua/plugins/which-key.lua (updated to v3 API)"
echo "  - lua/plugins/snacks.lua (enhanced dashboard)"
echo "  - lua/plugins/nvim-treesitter.lua (consolidated textobjects)"
echo ""
echo -e "${GREEN}✓${NC} New files created:"
echo "  - .gitignore"
echo "  - MIGRATION_NOTES.md (detailed migration documentation)"
echo ""

# Step 6: New keymaps
echo "⌨️  Step 6: New Keymaps Added"
echo ""
echo "Diagnostic Navigation:"
echo "  [d           → Previous diagnostic"
echo "  ]d           → Next diagnostic"
echo "  <leader>cd   → Line diagnostics (float)"
echo "  <leader>cD   → Document diagnostics (fzf)"
echo "  <leader>cw   → Workspace diagnostics (fzf)"
echo ""
echo "LSP (when available):"
echo "  <leader>th   → Toggle inlay hints"
echo ""

# Step 7: Next steps
echo "🎯 Next Steps:"
echo ""
echo "1. Open Neovim and let it install/update plugins:"
echo -e "   ${YELLOW}nvim${NC}"
echo ""
echo "2. Install vtsls for TypeScript/JavaScript:"
echo -e "   ${YELLOW}:MasonInstall vtsls${NC}"
echo ""
echo "3. Run health checks:"
echo -e "   ${YELLOW}:checkhealth${NC}"
echo ""
echo "4. Test new features:"
echo "   - Open a TypeScript file and try <leader>th for inlay hints"
echo "   - Use [d and ]d to navigate diagnostics"
echo "   - Press <leader> and see organized which-key groups"
echo ""

# Step 8: Rollback instructions
echo "🔙 Rollback Instructions (if needed):"
echo ""
echo "If something goes wrong, restore the backup:"
echo -e "   ${RED}cd ~/.config && tar -xzf nvim-backup-20250930-131358.tar.gz${NC}"
echo ""

echo "======================================"
echo -e "${GREEN}✅ Migration setup complete!${NC}"
echo ""
echo "For detailed information, see: ~/.config/nvim/MIGRATION_NOTES.md"
echo ""