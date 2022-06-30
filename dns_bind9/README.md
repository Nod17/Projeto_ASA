# DNS usando Bind9 e com automatização

- Scripts para automatização, passando apenas no momento da execução, como <$1> o IP do primário e como <$2> o IP do secundário.
    - Caso não passe um IP para secundário, ficará como default o IP 127.0.0.1
    - Caso não se passe nenhum IP, o script não é executado
    
    Exemplo de como executar:
    - ./exec_service_general.sh 192.168.0.2 192.168.0.3
    - O IP <192.168.0.2> será o primário e o IP <192.168.0.3> será o secundário
    - Na mesma máquina isso não adianta de nada, mas para testes, melhor que passe neste caso o mesmo IP do host para $1 e $2, ou nada para $2

- Além deste script geral, para se executar em uma única máquina, tem os individuais, um para o primário e outro para o secundário.
    - O procedimento é o mesmo, $1 para o IP do primário e $2 para o IP do secundário
    - Em ambos os hosts segue-se essa regra, no momento da execução, passando o $1 e o $2 como IP primário e secundário, respectivamente

- Há também por fim um script para administração dos mesmos e indo um pouco mais além.
    - Para este, basta executar:
        - ./adm_service.sh 
    - Lá mesmo, mostrará as opções das funcionalidades.