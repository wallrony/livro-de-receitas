import Knex from 'knex';

export function seed(knex: Knex) {
  return knex.table('recipes').insert([
    {
      name: 'Suco Meio-a-Meio',
      time: '20 min.',
      ingredients: JSON.stringify([
        { name: 'acerola', quantity: '20 unidades.' },
        { name: 'limão', quantity: '2 unidades.' },
        { name: 'maracujá', quantity: '2 unidades.' },
      ]),
    },
    {
      name: 'Arroz Arrumado',
      time: '45 min.',
      ingredients: JSON.stringify([
        { name: 'Arroz', quantity: '80% (4/5) de uma xícara por pessoa.' },
        { name: 'Cenoura', quantity: '1 x quantidade de xícaras / 5 de uma cenoura completa.' },
        { name: 'Coentro', quantity: '1/4 de um molho.' }
      ]),
    }
  ]);
}