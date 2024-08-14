#!/bin/bash

# Função para exibir um banner de desinstalação
function show_uninstall_banner() {
    echo "┬┌┐┌┌─┐┌┬┐┌─┐┬  ┌─┐┌┬┐┬┌─┐┌┐┌"
    echo "││││└─┐ │ ├─┤│  ├─┤ │ ││ ││││"
    echo "┴┘└┘└─┘ ┴ ┴ ┴┴─┘┴ ┴ ┴ ┴└─┘┘└┘"
    echo "Uninstalling DynamicBanners..."
}

# Exibir o banner de desinstalação
show_uninstall_banner

# Diretório onde o script de instalação está localizado
INSTALL_DIR=$(dirname "$(realpath "$0")")

# Diretórios de banners do Zsh
ZSH_BANNER_DIRS=("bannerstartup" "bannerpictures" "bannerdocuments" "bannerdownloads" "bannertemplates" "bannermusic" "bannervideos")
# Diretórios de banners do Bash
BASH_BANNER_DIRS=("bannerstartup" "bannerpictures" "bannerdocumentos" "bannerdownloads" "bannermodelos" "bannermusic" "bannervideos")

# Arquivo .zshrc
ZSHRC_FILE="$HOME/.zshrc"
# Arquivo .bashrc
BASHRC_FILE="$HOME/.bashrc"

# Remover as entradas do DynamicBanners no .zshrc
sed -i '/# Configuração do DynamicBanners/,+34d' "$ZSHRC_FILE"
echo "Configurações do DynamicBanners removidas do $ZSHRC_FILE"

# Remover as entradas do DynamicBanners no .bashrc
sed -i '/# Configuração do DynamicBanners/,+34d' "$BASHRC_FILE"
echo "Configurações do DynamicBanners removidas do $BASHRC_FILE"

# Remover os diretórios de banners do Zsh
for dir in "${ZSH_BANNER_DIRS[@]}"; do
    if [ -d "$INSTALL_DIR/$dir" ]; then
        rm -r "$INSTALL_DIR/$dir"
        echo "Removido diretório $INSTALL_DIR/$dir (Zsh)"
    fi
done

# Remover os diretórios de banners do Bash
for dir in "${BASH_BANNER_DIRS[@]}"; do
    if [ -d "$INSTALL_DIR/$dir" ]; then
        rm -r "$INSTALL_DIR/$dir"
        echo "Removido diretório $INSTALL_DIR/$dir (Bash)"
    fi
done

echo "DynamicBanners foi desinstalado com sucesso."
