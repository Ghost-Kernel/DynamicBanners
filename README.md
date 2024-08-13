# DynamicBanners

DynamicBanners e um programa de gerenciamento de banners pra terminais zsh

desenvolvido pra ser usado em terminais linux de forma na qual possa adicionar um banner pros principais diretorios do sistema operacional, podendo ser um ou mais banners, ao adicionar mais do que um banner pra um determinado diretorio o programa escolhera de forma aleatoria, podendo tornar a aparencia do seu terminal mais dinamica e volatil, ideal pra pessoas que buscam modificaçoes vizuais ou facilitar a viuzalizaçao do diretorio atual. 

# manual

ao clonar o repositorio, deve vir com 2 programas, um de instalaçao e um de remoçao, 
pra intalar e so inicializar o instalador uzando "bash inatall" ou "./install"
ele ira adicionar os diretorios dos banners e adicionar o codigo ao zshrc.

apos a intalaçao completa, voce vai poder achar os diretorios dos banners no memso diretorio onde esta o intalador, e so adicionar os banners em formato txt em seus respectivos diretorios.

*o diretorio startup e o diretorio "bannerstartup" e o diretorio de inicializaçao do terminal, ao adicionar banners nele, ele ira executar to cat toda vez que o terminal for aberto, independente de onde voce abrir o terminal, o que evita que o banner seja gerado toda vez que entrar no diretorio home*

# desinstalar

o programa ja vem com um desinstalador automatico que pode ser executado da mesma forma do instalador de forma rapida e pratica, ele removera todos os diretorios criados, entao certifique de salvar todos os banners em outro lugar antes de utilizar o script, ele tambem devera remover o codigo injetado no zshrc, caso apos o script apareça mensagens de erro, verifique se sobrou alguma parte do codigo no final do arquivo do shell, voce pode entrar nele digitando nano ~/.zshrc  
o codigo do programa e injetado no final do arquivo do shell, 

# em desenvolvimento 

atualmente o programa foi desenvolvido pra kali linux mas e suportado por sistemas que contem o shell zsh, futuramente eu pretendo portar o programa pra bash e por um identificador de distribuiçao linux no instalador pra fazer a instalaçao correta dependendo da distru.

