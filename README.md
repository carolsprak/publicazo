# Description:

Sistema desenvolvido para fins acadêmicos, que publica serviços gerais, realiza agendamentos e avalia clientes e serviços oferecidos.
- Acessar a aplicação: http://publicazo.insprak.com/

# 1. Instalação usando Docker do projeto

```bash
# Primeira vez que for iniciar o projeto no docker
$ sudo docker-compose build
```
```bash
# Iniciar o servidor de aplicação do docker
$ sudo docker-compose up
```
```bash
# Em caso de mudanças na aplicação, para reiniciar o servidor.
$ Ctrl + c
$ sudo docker-compose up --build
```

# 2. Instalação necessária para Ruby on Rails

Acessar tutorial, apenas para fins acadêmicos, sobre instalação de Ruby on Rails: 
- https://carolsprak.gitbook.io/ruby-on-rails-para-iniciantes/

Versão Atual do Rails no site ofical:
- https://rubyonrails.org/

## 1. Instalar o Rails 

### Passo 1: Faça a instalação para o seu sistema operacional

Acessar a página de instalação do rails e siga as instruções para cada sistema (Mac, Windows, Linux):
- http://installrails.com

### Passo 2: Verifique se ele foi instalado corretamente

Execute o comando abaixo em um terminal e verifique se o Rails foi instalado corretamente.
Por exemplo:

```bash
$ rails -v
# Rails 7.0.0
```

## Controle de Versão
Utilizamos o git para controle de versão. Cheque as [tags nesse repositório](https://github.com/carolsprak/publicazo/tags) para ver as versões disponíveis.

## Autora
* **Anne Caroline Rocha**

## Licença
Este projeto está licenciado sob a Licença MIT - veja [LICENSE](LICENSE)
