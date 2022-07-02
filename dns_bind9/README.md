## DNS - BIND9  :globe_with_meridians:

Nesta pasta está alocado os arquivos de configuração para o dns primário e secundário. Nosso domínio é __ac.asa.br__

Também foram criados scripts em Shell para automatização de processos, desde o build da imagem a execução do container com Docker, a partir de um único Dockerfile. Existem 4 scrips de automatização, cada um com sua finalidade.

---

### Instruções de uso:

#### Ambiente de teste único host

O script __*exec_service_general.sh*__ é mais útil para testes, pois ele colocará em execução 2 containers com dns, mas isso num host único, não é de boa útilidade.

Ele deve ser executado passando como ``$1`` o IP do primário, ou seja, do host, e como ``$2`` o IP do secundário. Para este caso, use ou o mesmo IP, ou deixe sem parâmetro, porque dessa forma automaticamente ele assumirá o IP 127.0.0.1.

Exemplos:

```shell
./exec_service_general.sh 192.168.0.10

./exec_service_general.sh 192.168.0.10 192.168.0.10

./exec_service_general.sh 192.168.0.10 127.0.0.1
```

#### Ambiente para host primário

O script __*exec_service_primary.sh*__ será usado para execução do dns primário, onde se levantará um container para o dns.

Ele deve ser executado passando como ``$1`` o IP do primário, ou seja, o IP do host, e como ``$2`` o IP do secundário, ou seja, o IP do host onde se levantará um outro container para o dns secundário.

Exemplo:

```shell
./exec_service_primary.sh 192.168.0.10 192.168.0.11
```

#### Ambiente para host secundário

O script __*exec_service_secondary.sh*__ será usado para execução do dns secundário, onde se levantará um container para o dns, que terá de fazer uma busca de dados no dns primário. Só é útil executá-lo após o primário ter sido executado.

Ele deve ser executado passando como ``$1`` o IP do primário, ou seja, o IP onde foi levantado o dns primário, e como ``$2`` o IP do secundário, ou seja, o IP do host que se executará este script.

Exemplo:

```shell
./exec_service_secondary.sh 192.168.0.10 192.168.0.11
```

#### Ambiente independente do host

O script __*adm_service.sh*__ é útil para administração dos containers, especialmente voltado aos dos dns, ns1 e ns2. Ele traz algumas funcionalidades que agiliza principalmente nos momentos dos testes e, você pode executá-lo tanto no host do primário como no host do secunário.

As funcionalidades do script a seguir:

```tex
0 - Stop script
1 - List Containers in execution
2 - List All Containers
3 - Stop, Restart, Start bind9 in ns1 and/or ns2 with <exec>
4 - Delete container ns1 and/or ns2
5 - View Logs ns1 or ns2
6 - Inspect Container
7 - Delete image
8 - Delete volumes not in use
9 - Delete other container
```

_OBS:_ Ao usar o script, cuidado no momento de apagar algo, pois ele está sempre com o parâmetro *-f*, justamente porque entende que é exatamente o que deseja ser feito, então mesmo que esteja em em uso, ele força a remoção.

---

#### Demais dicas: :left_speech_bubble:

- Caso os scripts estiverem dando algum problema de execução, pode ser apenas pelo pulo de linha. O Linux usa um padrão chamado de LF e quando direciono os Updates para o repositório, ele transforma o pulo de linha em CRFL normalmente, basta mudar isso, no VsCode por exemplo, lá em baixo é possível enxergar esta opção e mudar.


- No Linux você pode usar o *dig* ou o *nslookup* para testar a resolução de nomes do dns, estando no terminal host hospedeiro, tendo o IP 192.168.0.10 como exemplo, faça da seguinte forma:
  
  ```shell
  Com dig
  dig @192.168.0.10 ns1.ac.asa.br
  dig @192.168.0.10 ns2.ac.asa.br
  dig @192.168.0.10 ac.asa.br
  
  -------------------------------------------------------------------------------------------------------------
  Com nslookup
  nslookup - 192.168.0.10
  
  > ns1.ac.asa.br
  
  > ns2.ac.asa.br
  
  > ac.asa.br
  ```

- No Windows use o _nslookup_, da mesma forma, tendo o IP 192.168.0.10 como exemplo, seria assim:
  
  ```shell
  nslookup - 192.168.0.10
  
  > ns1.ac.asa.br
  
  > ns2.ac.asa.br
  
  > ac.asa.br
  ```

- Por fim, na sua máquina, com o dns rodando, condigure para usar o IP do primário e refaça o teste, agora sem passar IPs, apenas nomes:
  
  ```shell
  Com dig
  dig ns1.ac.asa.br
  dig ns2.ac.asa.br
  dig ac.asa.br
  
  -------------------------------------------------------------------------------------------------------------
  Com nslookup
  nslookup ns1.ac.asa.br
  nslookup ns2.ac.asa.br
  nslookup ac.asa.br
  ```

Você também poderá usa-lo como dns pela internet, coo o IP setado na máquina, tente navegar na internet, certamente funcionará tudo ok, pois há todo um encaminhamento para a resolução de nomes.
