#!/bin/bash
# ============================================================
#  setup.sh — Bootstrap Oh-My-Bash fork + dotfiles
#  Portátil: funciona en cualquier máquina (Arch, Debian, macOS)
# ============================================================
#  Uso:
#    curl -fsSL https://raw.githubusercontent.com/CesarGuzmanLopez/.bash/main/setup.sh | bash
#  O:
#    git clone https://github.com/CesarGuzmanLopez/.bash ~/.bash_vim
#    bash ~/.bash_vim/setup.sh
# ============================================================

set -euo pipefail

DOTFILES="${DOTFILES:-$HOME/.bash_vim}"
OSH_DIR="${OSH_DIR:-$HOME/oh-my-bash-fork}"
BASH_REPO="https://github.com/CesarGuzmanLopez/.bash"
OSH_REPO="https://github.com/CesarGuzmanLopez/oh-my-bash"

BOLD='\033[1m'
GREEN='\033[0;32m'
CYAN='\033[0;36m'
NC='\033[0m'

info()  { printf "${CYAN}%s${NC}\n" "  → $1"; }
ok()    { printf "${GREEN}%s${NC}\n" "  ✓ $1"; }
title() { printf "\n${BOLD}%s${NC}\n" "$1"; }

# ── 1. Clonar dotfiles ──
title "📁 Dotfiles"
if [ ! -d "$DOTFILES/.git" ]; then
    info "Clonando dotfiles en $DOTFILES …"
    git clone --depth=1 "$BASH_REPO" "$DOTFILES"
    ok "Dotfiles clonados"
else
    ok "Dotfiles ya existen en $DOTFILES"
fi

# ── 2. Clonar Oh-My-Bash fork ──
title "🌀 Oh-My-Bash fork"
if [ ! -d "$OSH_DIR/.git" ]; then
    info "Clonando oh-my-bash fork en $OSH_DIR …"
    git clone --depth=1 "$OSH_REPO" "$OSH_DIR"
    ok "Oh-My-Bash fork clonado"
else
    ok "Oh-My-Bash fork ya existe en $OSH_DIR"
fi

# ── 3. Symlink .bashrc ──
title "🔗 .bashrc"
if [ -f "$HOME/.bashrc" ] && [ ! -L "$HOME/.bashrc" ]; then
    info "Respaldando .bashrc existente → $HOME/.bashrc.bak"
    mv "$HOME/.bashrc" "$HOME/.bashrc.bak"
fi
if [ ! -L "$HOME/.bashrc" ]; then
    ln -sf "$DOTFILES/.bashrc" "$HOME/.bashrc"
    ok "Symlink creado: ~/.bashrc → $DOTFILES/.bashrc"
else
    ok "Symlink ya existe"
fi

# ── 4. Crear .env ──
title "🔐 .env"
if [ ! -f "$DOTFILES/.env" ]; then
    cat > "$DOTFILES/.env" <<- EOF
# Tokens personales — editar según cada máquina
export TOKEN_telegram=
export TOKEN_USER_telegram=
EOF
    ok ".env creado (editar tokens si es necesario)"
else
    ok ".env ya existe"
fi

# ── 5. Dependencias (solo Linux con pacman/apt) ──
title "📦 Dependencias"
if command -v pacman &>/dev/null; then
    info "Arch Linux detectado"
    pkgs=(eza bottom tldr zoxide bat fd ripgrep fzf)
    missing=()
    for pkg in "${pkgs[@]}"; do
        if ! pacman -Qi "$pkg" &>/dev/null 2>&1; then
            missing+=("$pkg")
        fi
    done
    if [ ${#missing[@]} -gt 0 ]; then
        info "Instalando: ${missing[*]}"
        sudo pacman -S --noconfirm "${missing[@]}"
        ok "Dependencias instaladas"
    else
        ok "Todas las dependencias ya están instaladas"
    fi
elif command -v apt &>/dev/null; then
    info "Debian/Ubuntu detectado"
    info "Instalando dependencias… (puede pedir contraseña)"
    sudo apt update
    sudo apt install -y bat ripgrep fzf zoxide
    # eza, bottom, tldr quizás no están en repos viejos
    info "Nota: eza, bottom, tldr pueden requerir instalación manual en Debian/Ubuntu"
else
    info "Sistema no reconocido. Instala manualmente: eza, bottom, tldr, zoxide"
fi

# ── 6. Verificar ──
title "✅ Verificación"
for cmd in eza btm tldr zoxide bat rg fzf; do
    if command -v "$cmd" &>/dev/null; then
        ok "$cmd disponible"
    else
        info "$cmd no encontrado (puedes instalarlo después)"
    fi
done

# ── 7. ¡Listo! ──
title "🎉 ¡Todo listo!"
echo ""
echo "   Abre UNA NUEVA terminal o ejecuta:"
echo ""
echo "       source ~/.bashrc"
echo ""
echo "   Atajos disponibles:"
echo "     Ctrl+G  →  TARDIS (info del sistema)"
echo "     Ctrl+F  →  Buscar archivos con fzf"
echo "     Ctrl+T  →  Insertar texto con fzf"
echo "     z <dir> →  Navegación inteligente (zoxide)"
echo ""
