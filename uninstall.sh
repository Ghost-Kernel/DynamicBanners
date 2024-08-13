#!/bin/bash

# Função para exibir um banner de desinstalação
function show_uninstall_banner() {
    echo "┬┌┐┌┌─┐┌┬┐┌─┐┬  ┌─┐┬ ┬┌┬┐┬┌─┐┌┐┌"
    echo "││││└─┐ │ ├─┤│  ├─┘│ │ │ ││ ││││"
    echo "┴┘└┘└─┘ ┴ ┴ ┴┴─┘┴  └─┘ ┴ ┴└─┘┘└┘"
    echo "DynamicBanners Uninstaller"
}

# Exibir o banner de desinstalação
show_uninstall_banner

# Diretório onde o script está localizado
INSTALL_DIR=$(dirname "$(realpath "$0")")

# Diretórios de banners
BANNER_DIRS=("bannerstartup" "bannerpictures" "bannerdocuments" "bannerdownloads" "bannertemplates" "bannermusic" "bannervideos")

# Remover o código do DynamicBanners do .zshrc
ZSHRC_FILE="$HOME/.zshrc"
START_LINE=$(grep -n "# Configuração do DynamicBanners" "$ZSHRC_FILE" | cut -d: -f1)

if [ -n "$START_LINE" ]; then
    END_LINE=$(($START_LINE + $(grep -A 1000 "# Configuração do DynamicBanners" "$ZSHRC_FILE" | grep -n "autoload -U add-zsh-hook" | cut -d: -f1) - 1))
    sed -i "${START_LINE},${END_LINE}d" "$ZSHRC_FILE"
    echo "Código do DynamicBanners removido de $ZSHRC_FILE"
else
    echo "Código do DynamicBanners não encontrado em $ZSHRC_FILE"
fi

# Remover os diretórios de banners
for dir in "${BANNER_DIRS[@]}"; do
    if [ -d "$INSTALL_DIR/$dir" ]; then
        rm -rf "$INSTALL_DIR/$dir"
        echo "Removido diretório $INSTALL_DIR/$dir"
    fi
done

echo "Desinstalação completa. Por favor, execute 'source ~/.zshrc' para aplicar as alterações."
