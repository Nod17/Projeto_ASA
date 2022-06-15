# Outra configuração para o Bind9

- Ainda sim, incompleta e não funciona de externamente para internamente do container

- É preciso mudar os IPs nos arquivos de configuração do bind9 se for necessário, a depender de sua rede
- É preciso mudar o arquivo /etc/resolv.conf e colocar o IP do próprio container
- É preciso restartar o bind9 com: /etc/init.d/named restart
