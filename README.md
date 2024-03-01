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

Tecnologia    | Versão
------------- | -------------
ruby          | 3.1.4
sqlite3       | 1.4.0
redis         | 6.2+
sidekiq       | 7.0.3
sidekiq-status| 3.0.0
rspec         | 6.1.0

Se você estiver utilizando linux, será necessário instalar também o pacote redis-server

Foi criado um middleware para trabalhar com sidekiq-status e acompanhar o job até sua conclusão.

Clone o projeto e ao executar:

```ruby
bundle install
rails db:migrate
rails db:seed
```
Será configurado uma aplicação rails contando com as seguintes funcionalidades:
- [x] Usuário padrão admin@rotten e senha admin
- [x] Página de login
- [x] Rota para criação de novos usuários
- [x] Rota para cadastrar novo filme
- [x] Rotas para dar nota nos filmes
- [x] Exibi a média das notas de cada filme
- [x] Rota para criar filmes em massa (Sidekiq)
- [x] Rota para dar nota aos filmes em massa (Sidekiq)
- [x] Rota para excluir filmes e massa (Sidekiq)
- [x] Executar todas as rotas em segundo plano

#### Para rodar o código:

1. Inicie o servidor Redis para que a conexão com o Sidekiq funcione corretamente. (Execute o comando `redis-server`).
2. Inicie o Sidekiq para habilitar os workers de segundo plano. (Execute o comando `sidekiq`).
3. Inicie o servidor Rails executando o comando `rails s`.
4. Execute os testes de rota executando o comando `rspec`.

Certifique-se de seguir esses passos na ordem fornecida para garantir que sua aplicação Rails esteja funcionando corretamente.

#### Desafio Concluído:

Implementei rotas para importar e submeter notas de filmes em massa, utilizando Sidekiq para execução assíncrona. As rotas suportam payloads JSON para facilitar a integração e garantir uma experiência eficiente aos usuários. Os testes foram escritos com RSpec, garantindo o funcionamento correto das funcionalidades.
