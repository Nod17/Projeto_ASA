# Projeto_ASA

OBS: Para quem deu um git clone anteriormente, use "git pull" antes de modificar, criar, mudar algo. Pois haver modifcações.

FINALIDADE:
    Repositório onde vamos incluir arquivos de configuração e utilização para criação de containers com o Docker, pela disciplina ASA.

BIND9:
- Atualmente no processo do projeto, temos apenas um dns primário com docker funcionando perfeitamente e um secundário que está aprensentando "REFUSED" ao contatar o primário. 

- Para contruir tal imagem e tal container, foram criados scripts em Shell, automatizando o processo, desde o build à execução do container
    - Basta que no momento de chamada do script, utilize como $1 o IP para o primário, ou seja, o do host e como $2 o IP do secundário,
      ou seja, o IP do host que vai executar o secundário.

HTML:
- Há uma pasta com html simples, apenas para ter os resultados apresentados no README.md daquela pasta.