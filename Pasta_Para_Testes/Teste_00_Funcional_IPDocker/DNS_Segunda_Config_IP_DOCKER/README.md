# Pasta com configurações a partir de repoitório sugerido
Pasta que contem traços de configurações do repositório: https://github.com/labbsr0x/docker-dns-bind9
E do repositório: https://github.com/CostaPauloEdu/dns-bind9

- A configuração do Primário, deve funcionar com os seguintes passos:
    * docker build -t "nome-imagem" .
    * docker run -d --name "nome-para-container" --hostname "nome-do-host-do-container --ip 172.17.0.2 --dns 172.17.0.2 -p 0.0.0.0:53:53/udp -p 0.0.0.0:53:53/tcp "nome-imagem"

* POR ENQUANTO A CONFIGURAÇÃO DO SECUNDÁRIO NÃO É FUNCIONAL E NO PRIMÁRIO NÃO O USA

;- A configuração do Secundário, deve funcionar com os seguintes passos:
;   * docker build -t "nome-imagem" .