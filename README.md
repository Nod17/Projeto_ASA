# Projeto_ASA

** OBS: Para nós contruibuidores, sempre dê um "git pull" antes de modificar, criar, mudar algo. Pois o outro pode ter feito modifcações antes de você.

Repositório onde vamos incluir arquivos de configuração e utilização para
criação de containers com o Docker. Utilizaremos do git no terminal, para incluir modificações, criações, etc...


PROPOSTA:

Queria que a gente visse direitinho como vai ser...


SOBRE A AULA DO DIA 31/05:

Estou adicionando aqui um arquivo "Dockerfile" com a configuração para uma imagem que podemos usar para nosso projeto e fazer configurações de DNS com o bind9.

Dicas:

- Após dar o git clone ou git pull para ter este repositório, faça:
    - docker build -t "nome_para_imagem" .
    - docker run --name "nome_para_container" -d -p 30053:53 "nome_da_imagem"
    - docker exec -it "nome_container" /bin/bash

    - Dessa forma dá pra acessar o temrinal do ubuntu/container sendo um Linux mesmo, aí a gente pode atualiza-lo e dentro do /etc vai ter o bind, onde temos que fazer as configurações

SOBRE A AULA DO DIA 07/06/2022:

- Configurar arquivos para o DNS, de acordo com o nosso domínio (ac.asa.br)
- Usar o bind9 para isso, a imagem de acordo com o Dockerfile
- Configurar o nosso Dockerfile para executar tudo automaticamente na hora do build, faltando apenas subir o container
- Obs: Ainda está incompleto

SOBRE A AULA DO DIA 14/06/2022:

- Aprimoramento de configurações dos DNS e melhor entendimento sobre o mesmo
- Melhor configuração do Dockerfile
- Tentativas de testes do DNS com outro container usando nginx para uma página HTML
- Obs: Ainda está incompleto. Não funciona!
