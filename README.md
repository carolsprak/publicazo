# description:

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

## 1. Instalar o Rails \(Simplificado\)

#### Passo 1: Faça o download do instalador de Rails

Windows : [Rails 5.0 - RailsInstaller para Windows](https://s3.amazonaws.com/railsinstaller/Windows/railsinstaller-3.3.0.exe) \(104 MB\)  
Mac OSX: [Rails 4.1 - RailsInstaller para Mac OSX](https://s3.amazonaws.com/railsinstaller/OSX/RailsInstaller-1.0.4-osx-10.7.app.tgz) \(320 MB\)

#### Passo 2: Instale o arquivo após o download

Quando ele estiver disponível em sua máquina, clique duas vezes e siga as instruções.

#### Passo 3: Verifique se ele foi instalado corretamente

Execute o comando abaixo em um terminal e verifique se o Rails foi instalado corretamente.

Por exemplo:

```ruby
$ rails -v
# Rails 4.1.6
```

#### Passo 2: Instalar a Ferramenta Sqlite

Instalar o Sqlite, baixando os arquivos binários pré-compilados para Windows em: [https://sqlitebrowser.org/](https://sqlitebrowser.org/)   
Após o download, instalar.

#### Passo 3: Instalar a DLL do Sqlite para Windows

Windows x86: [sqlite-dll-win32-x86-3200100.zip](https://www.sqlite.org/2017/sqlite-dll-win32-x86-3200100.zip) \(435 KB\)  
Windows x64: [sqlite-dll-win64-x64-3200100.zip](https://www.sqlite.org/2017/sqlite-dll-win64-x64-3200100.zip) \(722 KB\)  
  
Após o download, descompactar e colocar as DLLs na pasta do \bin do C:\Ruby22-x64\bin instalado anteriormente.

#### Passo 4: Instalar a Gem para Sqlite3

Instalar a gem para SQLite3, no terminal:

```ruby
$ gem install sqlite3 -v 1.3.12
```

 Pesquisar pela versão mais atual em [https://rubygems.org/gems/sqlite3/versions](http://v/)

```ruby
$ gem install --version 1.3.3 sqlite3-ruby
```

 Pesquisar pela versão mais atual em [https://rubygems.org/gems/sqlite3-ruby](https://rubygems.org/gems/sqlite3-ruby)  
  
Dica: Para quem usar firefox é instalar o SQLite Manager para gerenciar sua base de dados.

#### Passo 5: Instalar a RubyGem

Acessar a página [https://rubygems.org/pages/download](https://rubygems.org/pages/download) e fazer download do ZIP.  
  
Descompactar o arquivo baixado em C:\  
  
Por exemplo:

```text
C:\rubygems-2.6.13
```

 No terminal acessar a pasta acima e executar o seguinte comando:  
  
Por exemplo:

```text
C:\rubygems-2.6.13>ruby setup.rb
```

#### Passo 6: Instalar a Gem Bundler

Bundler é uma RubyGem que é utilizada para gerenciar as dependências do projeto com outras Gems.  
  
No terminal acessar a pasta abaixo e executar o seguinte comando:  
  
Por exemplo:

```text
C:\rubygems-2.6.13>gem install bundler
```

#### Passo 7: Instalar a Gem Rails

Rails é o framework para construção de aplicações WEB utilizando a linguagem Ruby.  
  
No terminal acessar a pasta abaixo e executar o seguinte comando:  
  
Por exemplo:

```text
C:\rubygems-2.6.13>gem install rails -v4.2.9
```

Pesquisar pela versão mais atual em [http://guides.rubyonrails.org](http://guides.rubyonrails.org/)  
  
Execute o comando abaixo em um terminal e verifique se o Rails foi instalado corretamente.  
  
Por exemplo:

```ruby
$ rails -v
# Rails 4.2.9
```

## Controle de Versão
Utilizamos o git para controle de versão. Cheque as [tags nesse repositório](https://github.com/carolsprak/publicazo/tags) para ver as versões disponíveis.

## Autora
* **Anne Caroline Rocha**

## Licença
Este projeto está licenciado sob a Licença MIT - veja [LICENSE](LICENSE)
