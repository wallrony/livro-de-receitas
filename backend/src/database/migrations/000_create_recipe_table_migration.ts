import Knex from 'knex';

export function up(knex: Knex) {
  return knex.schema.createTable('recipes', table => {
    table.increments('id').primary().notNullable();
    table.string('name').notNullable();
    table.text('prepareDescription').notNullable();
    table.string('ingredients').notNullable();
    table.string('time').notNullable();
  });
}

export function down(knex: Knex) {
  return knex.schema.dropTableIfExists('recipes');
}