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

# Diretórios de banners (incluindo o de abertura de terminal)
BANNER_DIRS=("bannerstartup" "bannerpictures" "bannerdocuments" "bannerdownloads" "bannertemplates" "bannermusic" "bannervideos" "bannerpublic")

# Função para detectar o shell padrão
detect_shell() {
    SHELL_PATH=$(getent passwd "$USER" | cut -d: -f7)
    SHELL_NAME=$(basename "$SHELL_PATH")
    echo "$SHELL_NAME"
}

# Função para escolher o arquivo de configuração baseado no shell
select_config_file() {
    SHELL_NAME="$1"
    case "$SHELL_NAME" in
        bash)
            CONFIG_FILE="$HOME/.bashrc"
            ;;
        zsh)
            CONFIG_FILE="$HOME/.zshrc"
            ;;
        fish)
            CONFIG_FILE="$HOME/.config/fish/config.fish"
            ;;
        *)
            echo "Shell $SHELL_NAME não suportado."
            exit 1
            ;;
    esac
    echo "$CONFIG_FILE"
}

# Detectar o shell padrão do usuário
SHELL_NAME=$(detect_shell)
CONFIG_FILE=$(select_config_file "$SHELL_NAME")

# Adicionar a configuração ao arquivo de configuração do shell
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
BANNER_PUBLIC_DIR="$SCRIPT_DIR/bannerpublic"

# Função para exibir um banner aleatório
display_random_banner() {
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
chpwd() {
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
        "Public"|"Público")
            local banner_dir="$BANNER_PUBLIC_DIR"
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

# Adicionar hooks conforme o shell
case "$SHELL_NAME" in
    zsh)
        autoload -U add-zsh-hook
        add-zsh-hook chpwd chpwd
        ;;
    bash)
        PROMPT_COMMAND="chpwd; $PROMPT_COMMAND"
        export PROMPT_COMMAND
        ;;
    fish)
        function fish_prompt
            chpwd
        end
        ;;
esac
'

# Verificar se a configuração já existe no arquivo de configuração do shell
if grep -q "DynamicBanners" "$CONFIG_FILE"; then
    echo "Configuração já existe em $CONFIG_FILE"
else
    echo "$CONFIG_STRING" >> "$CONFIG_FILE"
    echo "Configuração adicionada ao $CONFIG_FILE"
fi

# Criar diretórios de banners (incluindo o de inicialização)
for dir in "${BANNER_DIRS[@]}"; do
    if [ ! -d "$INSTALL_DIR/$dir" ]; then
        mkdir "$INSTALL_DIR/$dir"
        echo "Criado diretório $INSTALL_DIR/$dir"
    fi
done

echo "Obrigado por baixar DynamicBanners. Por favor, reinicie o terminal ou execute 'source $CONFIG_FILE' para aplicar as alterações."
