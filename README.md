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
