#!/bin/bash

# Função para exibir um banner
function show_uninstall_banner() {
    echo "┬┌┐┌┌─┐┌┬┐┌─┐┬  ┌─┐┌┬┐┬┌─┐┌┐┌"
    echo "││││└─┐ │ ├─┤│  ├─┤ │ ││ ││││"
    echo "┴┘└┘└─┘ ┴ ┴ ┴┴─┘┴ ┴ ┴ ┴└─┘┘└┘"
    echo "DynamicBanners - Uninstaller"
}

# Exibir o banner de desinstalação
show_uninstall_banner

# Diretório onde o script de instalação foi localizado
INSTALL_DIR=$(dirname "$(realpath "$0")")

# Diretórios de banners
BANNER_DIRS=("bannerstartup" "bannerpictures" "bannerdocumentos" "bannerdownloads" "bannermodelos" "bannermusic" "bannervideos")

# Arquivo de configuração do Bash
BASHRC_FILE="$HOME/.bashrc"

# Remover a configuração do DynamicBanners do .bashrc
if grep -q "DynamicBanners" "$BASHRC_FILE"; then
    sed -i '/# Configuração do DynamicBanners/,/fi/d' "$BASHRC_FILE"
    echo "Configuração do DynamicBanners removida de $BASHRC_FILE"
else
    echo "Nenhuma configuração do DynamicBanners encontrada em $BASHRC_FILE"
fi

# Remover diretórios de banners
for dir in "${BANNER_DIRS[@]}"; do
    if [ -d "$INSTALL_DIR/$dir" ]; then
        rm -rf "$INSTALL_DIR/$dir"
        echo "Removido diretório $INSTALL_DIR/$dir"
    else
        echo "Diretório $INSTALL_DIR/$dir não encontrado"
    fi
done

echo "Desinstalação completa. Por favor, reinicie o terminal ou execute 'source ~/.bashrc' para aplicar as alterações."
