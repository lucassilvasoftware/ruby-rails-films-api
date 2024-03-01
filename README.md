<h6 align="center">
    <img src="https://github.com/lucassilvasoftware/OxeanbitsRubyTest/assets/54152996/e231a5fc-6ba0-4ea7-8492-f6b47e1dd987" alt="Demo" widht="550" height="470"/>
</h6>

<h2 align="center">
    Desafio para vaga de BackEnd - Foco em Ruby On Rails
</h2>

> Status: Finished ✅


#### Objetivo do Desafio:

O objetivo deste desafio é avaliar suas habilidades no desenvolvimento com o framework Ruby On Rails, bem como quaisquer integrações necessárias, a implementação de funcionalidades que executam em segundo plano de forma síncrona, a escrita de testes e a criação de uma documentação clara.

#### Métodologia para resolver o desafio

Para começar, comecei analisando cuidadosamente os requisitos fornecidos, garantindo que entendia completamente o que precisava ser feito. Em seguida, configurei meu ambiente de desenvolvimento, garantindo que todas as tecnologias necessárias, como Ruby 3.1.4, SQLite3, Sidekiq e RSpec, estivessem devidamente instaladas e funcionando corretamente.

Com o projeto clonado e configurado, comecei a implementar as funcionalidades requeridas. Criei as rotas necessárias para importar e submeter notas em massa, garantindo que pudessem lidar com payloads JSON, o que facilitaria a integração com outros sistemas. Além disso, integrei o Sidekiq para gerenciar essas tarefas em segundo plano, garantindo que a aplicação permanecesse responsiva e escalável.

Desenvolvi um middleware personalizado para acompanhar o status dos jobs do Sidekiq, garantindo uma gestão eficiente das tarefas em segundo plano.

Além disso, adicionei um CSS básico para melhorar a apresentação visual da aplicação, proporcionando uma experiência mais agradável aos usuários.

Após a implementação das funcionalidades, concentrei-me na criação de testes abrangentes usando o RSpec. Escrevi testes para todas as rotas da API e modelos da aplicação, garantindo que todas as funcionalidades estivessem devidamente testadas e funcionando conforme o esperado.

Por fim, documentei todo o processo de configuração, instruções para execução do projeto e execução dos testes no arquivo README.md. Certifiquei-me de fornecer informações claras sobre como utilizar as novas funcionalidades implementadas, facilitando o entendimento para outros desenvolvedores.

Após revisar cuidadosamente todo o código e a documentação, enviei o projeto finalizado para avaliação, conforme as instruções fornecidas no desafio. Estou ansioso para receber feedback e continuar aprendendo e crescendo como desenvolvedor.

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
