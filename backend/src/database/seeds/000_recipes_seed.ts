import Knex from 'knex';

export function seed(knex: Knex) {
  return knex.table('recipes').insert([
    {
      name: 'Suco Meio-a-Meio',
      prepareDescription: 'Descasque os limões, corte eles ao meio. Em seguida corte também a linha que une o começo dos gomos (lá tem algumas pequenas sementes que acabam amargando o suco, então é necessário retirar). Após isso, os coloque no copo do liquidificador.\nAgora corte os maracujás e coloque os seus miolos dentro do copo do liquidificador.\nComo última etapa, jogue as acerolas no copo do liquidificador.\n\nAgora coloque água e açúcar à gosto. Com isso, ligue o liquidificador e bata o suco, e de pois coe o suco.',
      time: '20 min.',
      ingredients: JSON.stringify([
        { name: 'acerola', quantity: '20 unidades.' },
        { name: 'limão', quantity: '2 unidades.' },
        { name: 'maracujá', quantity: '2 unidades.' },
      ]),
    },
    {
      name: 'Arroz Arrumado',
      prepareDescription: 'Enxague o arroz com água e o deixe pronto. Rale cenoura e corte coentro e deixe pronto. Também deixe um litro de água pronto.\nRefogue a cebola em uma panela com óleo: mexa e espere a cebola dourar. Com isso, retire a cebola e coloque o arroz. Mexa sem deixar que o arroz grude na panela até ver que o arroz todo está brilhando por causa do óleo. Assim, jogue a cenoura e o coentro no arroz e mexa até o arroz ficar dourado e coloque o litro de água, e depois mais meio litro de água. Então, coloque sal e tempeiro à gosto. De 10 em 10 minutos mexa o arroz completamenta para misturar mais e mais a cenoura e o coentro no arroz, e também para identificar se o arroz não está prendendo na panela. Feche o fogo antes que ele grude na panela e pronto.',
      time: '45 min.',
      ingredients: JSON.stringify([
        { name: 'Arroz', quantity: '80% (4/5) de uma xícara por pessoa.' },
        { name: 'Cenoura', quantity: '1 x quantidade de xícaras / 5 de uma cenoura completa.' },
        { name: 'Coentro', quantity: '1/4 de um molho.' }
      ]),
    }
  ]);
}