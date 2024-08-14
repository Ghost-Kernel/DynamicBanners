#!/bin/bash

# Função para exibir um banner
function show_banner() {
    echo "┬┌┐┌┌─┐┌┬┐┌─┐┬  ┌─┐┌┬┐┬┌─┐┌┐┌"
    echo "││││└─┐ │ ├─┤│  ├─┤ │ ││ ││││"
    echo "┴┘└┘└─┘ ┴ ┴ ┴┴─┘┴ ┴ ┴ ┴└─┘┘└┘"
    echo "by ghostkernel"
}

# Exibir o banner de instalação
show_banner

# Diretório onde o script está localizado
INSTALL_DIR=$(dirname "$(realpath "$0")")

# Diretórios de banners
BANNER_DIRS=("bannerstartup" "bannerpictures" "bannerdocumentos" "bannerdownloads" "bannermodelos" "bannermusic" "bannervideos")

# Adicionar a configuração ao .bashrc
BASHRC_FILE="$HOME/.bashrc"
CONFIG_STRING='
# Configuração do DynamicBanners
SCRIPT_DIR='"$INSTALL_DIR"'
BANNER_STARTUP_DIR="$SCRIPT_DIR/bannerstartup"
BANNER_PICTURES_DIR="$SCRIPT_DIR/bannerpictures"
BANNER_DOCUMENTS_DIR="$SCRIPT_DIR/bannerdocumentos"
BANNER_DOWNLOADS_DIR="$SCRIPT_DIR/bannerdownloads"
BANNER_TEMPLATES_DIR="$SCRIPT_DIR/bannermodelos"
BANNER_MUSIC_DIR="$SCRIPT_DIR/bannermusic"
BANNER_VIDEOS_DIR="$SCRIPT_DIR/bannervideos"

# Inicializar LAST_DIR e BANNER_SHOWN
export LAST_DIR=""
export BANNER_SHOWN=""

# Função para exibir um banner aleatório
function display_random_banner() {
    local banner_dir=$1
    if [ -d "$banner_dir" ]; then
        local banner_file=$(find "$banner_dir" -type f -name "*.txt" 2>/dev/null | shuf -n 1)
        if [ -n "$banner_file" ]; then
            cat "$banner_file"
        fi
    fi
}

# Exibir um banner ao iniciar o terminal, apenas na primeira vez
if [ -z "$BANNER_SHOWN" ]; then
    display_random_banner "$BANNER_STARTUP_DIR"
    export BANNER_SHOWN=true
fi

# Função para exibir banners ao mudar de diretório
function check_directory() {
    local dir_name=$(basename "$PWD")
    
    case "$dir_name" in
        "Pictures"|"Imagens")
            local banner_dir="$BANNER_PICTURES_DIR"
            ;;
        "Documents"|"Documentos")
            local banner_dir="$BANNER_DOCUMENTS_DIR"
            ;;
        "Downloads")
            local banner_dir="$BANNER_DOWNLOADS_DIR"
            ;;
        "Templates"|"Modelos")
            local banner_dir="$BANNER_TEMPLATES_DIR"
            ;;
        "Music"|"Música")
            local banner_dir="$BANNER_MUSIC_DIR"
            ;;
        "Videos"|"Vídeos")
            local banner_dir="$BANNER_VIDEOS_DIR"
            ;;
        *)
            return
            ;;
    esac
    
    if [ -n "$banner_dir" ] && [ "$LAST_DIR" != "$PWD" ]; then
        display_random_banner "$banner_dir"
        LAST_DIR="$PWD"
    fi
}

export PROMPT_COMMAND="check_directory; $PROMPT_COMMAND"
'

if grep -q "DynamicBanners" "$BASHRC_FILE"; then
    echo "Configuração já existe em $BASHRC_FILE"
else
    echo "$CONFIG_STRING" >> "$BASHRC_FILE"
    echo "Configuração adicionada ao $BASHRC_FILE"
fi

# Criar diretórios de banners
for dir in "${BANNER_DIRS[@]}"; do
    if [ ! -d "$INSTALL_DIR/$dir" ]; then
        mkdir "$INSTALL_DIR/$dir"
        echo "Criado diretório $INSTALL_DIR/$dir"
    fi
done

echo "Obrigado por baixar DynamicBanners. Por favor, reinicie o terminal ou execute 'source ~/.bashrc' para aplicar as alterações."
