import knex from 'knex';

const connection = knex({
  client: 'pg',
  connection: {
    database: 'my_db_recipes',
    user: 'postgres',
    password: '123456'
  },
  useNullAsDefault: true
});

export default connection;