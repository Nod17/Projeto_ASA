# Projeto_ASA

Repositório onde vamos incluir arquivos de configuração e utilização para
criação de containers com o Docker. Utilizaremos do git no terminal, para incluir modificações, criações, etc...


PROPOSTA:

Queria que a gente visse direitinho como vai ser...


Sobre a aula do dia 31/05:

Estou adicionando aqui um arquivo "Dockerfile" com a configuração para uma imagem que podemos usar para nosso projeto e fazer configurações de DNS com o bind9.

Dicas:

- Após dar o git clone ou git pull para ter este repositório, faça:
    - docker build -t "nome_para_imagem" .
    - docker run --name "nome_para_container" -itd "nome_da_imagem"
    - docker exec -it "nome_container" /bin/bash

    - Dessa forma dá pra acessar o temrinal do ubuntu/container sendo um Linux mesmo, aí a gente pode atualiza-lo e dentro do /etc vai ter o bind, onde temos que fazer as configurações
