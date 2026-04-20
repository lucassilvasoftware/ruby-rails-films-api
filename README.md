# API de filmes — Ruby on Rails

Aplicação **Rails 7** com API e interface web para cadastro de filmes e usuários, atribuição de notas e médias. Inclui operações em massa executadas de forma assíncrona com **Sidekiq** e **Redis**, acompanhamento de jobs via `sidekiq-status` e suíte de testes com **RSpec**.

## Stack

| Componente | Observação |
|------------|------------|
| Ruby / Rails | Conforme `Gemfile` (Rails ~> 7.1) |
| SQLite | Banco de desenvolvimento |
| Redis | Filas Sidekiq |
| Sidekiq / sidekiq-status | Jobs em background e status |
| RSpec | Testes |

## Preparação

```bash
bundle install
rails db:migrate
rails db:seed
```

Após o seed, existe usuário padrão (por exemplo `admin@rotten` / `admin`, conforme implementação).

## Execução (ordem recomendada)

1. Subir o **Redis** (ex.: `redis-server`).
2. Em um terminal: `sidekiq` (na raiz do projeto Rails).
3. Em outro: `rails s` (servidor Puma).
4. Testes: `rspec`.

## Dados de exemplo

Na raiz há o arquivo **`Example.json`** para exercitar manualmente rotas de importação ou notas em massa, conforme as rotas definidas na aplicação.

## Testes

```bash
rspec
```

Certifique-se de que Redis e, se necessário, o banco estão configurados antes de rodar a suíte completa.
