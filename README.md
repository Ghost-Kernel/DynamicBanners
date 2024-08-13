#DynamicBanners

DynamicBanners is a banner management program for Zsh terminals, designed to add banners to the main directories of the Linux operating system. The program allows you to add one or more banners to each directory and randomly chooses which banner to display, providing a dynamic and variable appearance to your terminal. It is ideal for those looking for visual modifications or to make it easier to view the current directory.

#Manual

After cloning the repository, you will find two scripts: one for installation and one for removal.

To install the program, run the installer with one of the following commands:

bash install.sh

or

./install.sh

The installation script will create the necessary directories for the banners and add the necessary code to your .zshrc file.

After installation, the banner directories will be located in the same directory where the installer was run. Add the banners in the format of .txt files in the corresponding directories.

The bannerstartup directory is the terminal startup directory. By adding banners to this directory, they will be displayed every time the terminal is opened, regardless of the current directory. This prevents the banner from being generated every time you enter the home directory.

#Uninstallation

The program includes an automatic uninstaller that can be run in the same way as the installer. The uninstaller will remove all created directories. Make sure to save all banners to another location before using the uninstall script. The uninstaller will also remove the code added to the .zshrc. If you get error messages after uninstalling, check for leftover code at the end of the .zshrc file by typing:

nano ~/.zshrc

The program code is added to the end of this file.

#In Development

Currently, the program is developed for Kali Linux, but it is compatible with systems using the Zsh shell. In the future, I plan to port the program to Bash and add a Linux distribution identifier to the installer to ensure correct installation on different distributions.


#portugues
#DynamicBanners 


DynamicBanners é um programa de gerenciamento de banners para terminais Zsh, desenvolvido para adicionar banners aos principais diretórios do sistema operacional Linux. O programa permite adicionar um ou mais banners a cada diretório e escolhe aleatoriamente qual banner exibir, proporcionando uma aparência dinâmica e variável ao seu terminal. É ideal para quem busca modificações visuais ou para facilitar a visualização do diretório atual.

#Manual


Após clonar o repositório, você encontrará dois scripts: um para instalação e outro para remoção.

Para instalar o programa, execute o instalador com um dos seguintes comandos:


bash install.sh

ou

./install.sh

O script de instalação criará os diretórios necessários para os banners e adicionará o código necessário ao seu arquivo .zshrc.

Após a instalação, os diretórios de banners estarão localizados no mesmo diretório onde o instalador foi executado. Adicione os banners no formato de arquivos .txt nos diretórios correspondentes.

O diretório bannerstartup é o diretório de inicialização do terminal. Ao adicionar banners neste diretório, eles serão exibidos toda vez que o terminal for aberto, independentemente do diretório atual. Isso evita que o banner seja gerado toda vez que você entra no diretório home.

#Desinstalação


O programa inclui um desinstalador automático que pode ser executado da mesma forma que o instalador. O desinstalador removerá todos os diretórios criados. Certifique-se de salvar todos os banners em outro local antes de usar o script de desinstalação. O desinstalador também removerá o código adicionado ao .zshrc. Caso apareçam mensagens de erro após a desinstalação, verifique se há restos de código no final do arquivo .zshrc digitando:

nano ~/.zshrc

O código do programa é adicionado ao final deste arquivo.

#Em Desenvolvimento


Atualmente, o programa foi desenvolvido para Kali Linux, mas é compatível com sistemas que utilizam o shell Zsh. No futuro, pretendo portar o programa para Bash e adicionar um identificador de distribuição Linux no instalador para garantir a instalação correta em diferentes distribuições.
