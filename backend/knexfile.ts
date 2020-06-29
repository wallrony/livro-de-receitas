import path from 'path';

module.exports = {

  development: {
    client: 'pg',
    connection: {
      database: 'my_db_recipes',
      user: 'postgres',
      password: '123456'
    },
    migrations: {
      directory: path.resolve(__dirname, 'src', 'database', 'migrations'),
    },
    seeds: {
      directory: path.resolve(__dirname, 'src', 'database', 'seeds'),
    },
    useNullAsDefault: true
  },

};
