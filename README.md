# Livro de Receitas

Este é um projeto bem simples que tem como intuito gerenciar receitas, parecendo um livro de receitas.

Este é um projeto bem simples para portfolio.

Aplicações desenvolvidas: backend (nodeJS).
Aplicações não desenvolvidas: mobile (Flutter).

# Backend

A aplicação backend deste projeto foi desenvolvida utilizando a versão 12.18.0 do nodeJS, então essa será a versão mais confortávele é a que recomendo a ser utilizada para execução dessa aplicação.

Para executá-la de forma local, siga os passos abaixo:

Obs.: O passo a passo a seguir considera a exata configuração abordada nos arquivos já existentes. Em caso de alteração, essa lista pode não ser exatamente da mesma maneira a ser seguida.

<li>Crie o banco de dados "my_db_recipes" com o postgresql (se não o tiver instalado, irá precisa ao menos para a criação do database, assim, recomendo seguir o tutorial de instalação oficial do postgresql na sua máquina);</li>
<li>Entre na pasta "backend" com o seu terminal;</li>
<li>Execute "yarn knex:migrate" ou "npm knex:migrate" para executar as migrations do banco de dados (a criação da tabela recipes);</li>
<li>Execute "yarn knex:seed" ou "npm knex:seed" para criar registros padrões ao banco de dados, como as duas receitas básicas;</li>
<li>Execute "yarn dev" ou "npm dev" para executar o servidor.</li>

E pronto, o servidor backend já está executando de forma local na sua máquina, na porta 3333.

# Mobile

A aplicação mobile deste projeto ainda está em desenvolvimento.