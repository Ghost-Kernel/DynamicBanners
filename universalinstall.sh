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

# Identificar o shell padrão do sistema
SHELL_NAME=$(basename "$SHELL")

if [ "$SHELL_NAME" == "bash" ]; then
    # Diretórios de banners
    BANNER_DIRS=("bannerstartup" "bannerpictures" "bannerdocumentos" "bannerdownloads" "bannermodelos" "bannermusic" "bannervideos" "bannerpublico" "bannerdesktop")

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
BANNER_PUBLICO_DIR="$SCRIPT_DIR/bannerpublico"
BANNER_DESKTOP_DIR="$SCRIPT_DIR/bannerdesktop"
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
        "Music"|"Músicas")
            local banner_dir="$BANNER_MUSIC_DIR"
            ;;
        "Videos"|"Vídeos")
            local banner_dir="$BANNER_VIDEOS_DIR"
            ;;
            "Public"|"Público)
            local banner_dir="$BANNER_PUBLICO_DIR"
            ;;
        "Desktop"|"'Área de trabalho'")
            local banner_dir="$BANNER_DESKTOP_DIR"
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

elif [ "$SHELL_NAME" == "zsh" ]; then
    # Diretórios de banners (incluindo o de abertura de terminal)
    BANNER_DIRS=("bannerstartup" "bannerpictures" "bannerdocuments" "bannerdownloads" "bannertemplates" "bannermusic" "bannervideos" "bannerpublico" "bannerdesktop")

    # Adicionar a configuração ao .zshrc
    ZSHRC_FILE="$HOME/.zshrc"
    CONFIG_STRING='
# Configuração do DynamicBanners
SCRIPT_DIR='"$INSTALL_DIR"'
BANNER_STARTUP_DIR="$SCRIPT_DIR/bannerstartup"
BANNER_PICTURES_DIR="$SCRIPT_DIR/bannerpictures"
BANNER_DOCUMENTS_DIR="$SCRIPT_DIR/bannerdocuments"
BANNER_DOWNLOADS_DIR="$SCRIPT_DIR/bannerdownloads"
BANNER_TEMPLATES_DIR="$SCRIPT_DIR/bannertemplates"
BANNER_MUSIC_DIR="$SCRIPT_DIR/bannermusic"
BANNER_VIDEOS_DIR="$SCRIPT_DIR/bannervideos"
BANNER_PUBLICO_DIR="$SCRIPT_DIR/bannerpublico"
BANNER_DESKTOP_DIR="$SCRIPT_DIR/bannerdesktop"

# Função para exibir um banner aleatório
function display_random_banner() {
    local banner_dir=$1
    if [ -d "$banner_dir" ]; then
        local banner_file=$(ls "$banner_dir"/*.txt 2>/dev/null | shuf -n 1)
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
function chpwd() {
    local dir_name=$(basename "$PWD")
    
    case "$dir_name" in
        "Pictures")
            local banner_dir="$BANNER_PICTURES_DIR"
            ;;
        "Documents")
            local banner_dir="$BANNER_DOCUMENTS_DIR"
            ;;
        "Downloads")
            local banner_dir="$BANNER_DOWNLOADS_DIR"
            ;;
        "Templates")
            local banner_dir="$BANNER_TEMPLATES_DIR"
            ;;
        "Music")
            local banner_dir="$BANNER_MUSIC_DIR"
            ;;
        "Videos")
            local banner_dir="$BANNER_VIDEOS_DIR"
            ;;
        "Public")
            local banner_dir="$BANNER_PUBLICO_DIR"
            ;;
        "Desktop")
            local banner_dir="$BANNER_DESKTOP_DIR"
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

autoload -U add-zsh-hook
add-zsh-hook chpwd chpwd
'

    if grep -q "DynamicBanners" "$ZSHRC_FILE"; then
        echo "Configuração já existe em $ZSHRC_FILE"
    else
        echo "$CONFIG_STRING" >> "$ZSHRC_FILE"
        echo "Configuração adicionada ao $ZSHRC_FILE"
    fi

else
    echo "Shell não suportado. Apenas Bash e Zsh são suportados."
    exit 1
fi

# Criar diretórios de banners
for dir in "${BANNER_DIRS[@]}"; do
    if [ ! -d "$INSTALL_DIR/$dir" ]; then
        mkdir "$INSTALL_DIR/$dir"
        echo "Criado diretório $INSTALL_DIR/$dir"
    fi
done

echo "Obrigado por baixar DynamicBanners. Por favor, reinicie o terminal ou execute 'source ~/.bashrc' ou 'source ~/.zshrc' para aplicar as alterações."
