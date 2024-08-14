#!/bin/bash

# Identifica o shell padrão do sistema
default_shell=$(basename "$SHELL")

# Função para instalar e remover arquivos
install_and_cleanup() {
    local installer=$1
    local uninstaller=$2
    local other_installer=$3
    local other_uninstaller=$4

    # Executa o instalador correspondente
    bash "$installer"

    # Remove o instalador e desinstalador que não são usados
    rm -f "$other_installer" "$other_uninstaller"
}

# Verifica qual é o shell padrão e executa o instalador correspondente
case "$default_shell" in
    bash)
        install_and_cleanup "ibash.sh" "uninstall_bash.sh" "izsh.sh" "uninstall_zsh.sh"
        ;;
    zsh)
        install_and_cleanup "izsh.sh" "uninstall_zsh.sh" "ibash.sh" "uninstall_bash.sh"
        ;;
    *)
        echo "Shell não suportado: $default_shell"
        exit 1
        ;;
esac

echo "Instalação concluída e arquivos desnecessários removidos."
