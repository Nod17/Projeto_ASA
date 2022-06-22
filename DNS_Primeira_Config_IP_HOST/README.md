# Configuração básica Bind9
Nesta pasta contém uma forma de configuração em que deve ser possível utilizar o Bind9 como servidor DNS.
Nesta forma de configuração, se usa o IPs do Host hospedeiro do container nos arquivos do Bind9.

É preciso modificar o IPs, já que não temos IP Estatico.

Os IPs que estão atualmente nos arquivos foram os registrados no mesmo dia dos comandos abaixo.

E os comandos são os gerais do README.md do repositório geral no dia 21/06/2022, como a seguir:

* docker build -t "nome-para-imagem" .
* docker run --name "nome-para-container" --hostname "nome-para-bash" -d -p 0.0.0.0:53:53/udp -p 0.0.0.0:53:53/tcp --dns "IP-referente" "nome-dada-a-imagem"

- O primário deve funcionar a partir dos IPs corretos
- O secundário está incompleto e não há ainda linkagem do primário para o secundário