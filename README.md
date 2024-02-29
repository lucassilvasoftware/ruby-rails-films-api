### Desafio para vaga de BackEnd - Foco em Ruby On Rails

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
- Rota para criar filmes em massa (Sidekiq)
- Rota para dar nota aos filmes em massa (Sidekiq)
- Rota para excluir filmes e massa (Sidekiq)
- Exibi a média das notas de cada filme

#### Para rodar o código:


#### Desafio:
