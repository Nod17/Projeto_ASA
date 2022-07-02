## HTML - NGINX  :bookmark_tabs:

Para esta pasta há apenas um Dockerfile, um simples html e um simples css.

Siga os passos destacados abaixo e suba o container:

```shell
docker build -t nx .

docker run -d -p 80:80 nx
```

E pronto, com isso você já subiu um container a partir de uma determinada imagem construída com o nome _nx_.

Ele estará executando na porta 80, ou seja, a padrão do navegador para o protocolo HTTP.

É possível acessa-lo digitando _localhost_ no navegador do host hospedeiro, ou _127.0.0.1_ ou o _IP_ do mesmo.
