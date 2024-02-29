<h6 align="center">
    <img src="https://github.com/lucassilvasoftware/OxeanbitsRubyTest/assets/54152996/e231a5fc-6ba0-4ea7-8492-f6b47e1dd987" alt="Demo" widht="550" height="470"/>
</h6>

<h2 align="center">
    Desafio para vaga de BackEnd - Foco em Ruby On Rails
</h2>

> Status: Finished ✅


Objetivo do Desafio:

O objetivo deste desafio é avaliar suas habilidades no desenvolvimento com o framework Ruby On Rails, bem como quaisquer integrações necessárias, a implementação de funcionalidades que executam em segundo plano de forma síncrona, a escrita de testes e a criação de uma documentação clara.

#### Requisitos:

- ruby-3.1.4
- sqlite3
- redis-server (pré requisito para rodar o sidekiq) 

Clone o projeto e ao executar:

```ruby
bundle install
rails db:migrate
rails db:seed
```
Será configurado uma aplicação rails contando com as seguintes funcionalidades:
- Usuário padrão admin@rotten e senha admin
- Página de login
- Rota para criação de novos usuários
- Rota para cadastrar novo filme
- Rotas para dar nota nos filmes
- Exibi a média das notas de cada filme
- [x] Rota para criar filmes em massa (Sidekiq)
- [x] Rota para dar nota aos filmes em massa (Sidekiq)
- [x] Rota para excluir filmes e massa (Sidekiq)
- [x] Executar todas as rotas em segundo plano

#### Para rodar o código:

1. Inicie o servidor Redis para que a conexão com o Sidekiq funcione corretamente. (Você pode fazer isso executando o comando `redis-server`).
2. Inicie o Sidekiq para habilitar os workers de segundo plano. (Você pode fazer isso executando o comando `sidekiq`).
3. Inicie o servidor Rails executando o comando `rails s`.
4. Execute os testes de rota executando o comando `rspec`.

Certifique-se de seguir esses passos na ordem fornecida para garantir que sua aplicação Rails esteja funcionando corretamente.

#### Desafio Concluído:

Implementei rotas para importar e submeter notas de filmes em massa, utilizando Sidekiq para execução assíncrona. As rotas suportam payloads JSON para facilitar a integração e garantir uma experiência eficiente aos usuários. Os testes foram escritos com RSpec, garantindo o funcionamento correto das funcionalidades.
