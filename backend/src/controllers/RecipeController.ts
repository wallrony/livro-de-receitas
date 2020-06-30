import { Request, Response } from 'express';
import {
  errorIdIsMissing,
  errorValueIsMissing,
  successAdded,
  successDeleted,
  successSelected,
  successUpdated,
  errorWhenUpdate,
  errorWhenDelete
} from './../utils/ResponseUtils';
import connection from './../database/Connection';

class RecipeController {
  async index(request: Request, response: Response) {
    const result = await connection('recipes')
      .select('*');

    for(const recipe of result) {
      recipe['ingredients'] = JSON.parse(recipe['ingredients']);
    }

    return response.json(successSelected(result));
  }
  async show(request: Request, response: Response) {
    const id: number = Number(request.params.id ?? 0);

    if(id < 1) {
      return response.json(errorIdIsMissing);
    }

    const result = await connection('recipes')
      .select('*')
      .where('id', '=', id);

    if(result.length)
      result[0]['ingredients'] = JSON.parse(result[0]['ingredients']);

    return response.json(successSelected(result));
  }
  async add(request: Request, response: Response) {
    const { name, prepareDescription, ingredients, time } = request.body;

    if(!name || !ingredients || !time) {
      return response.json(errorValueIsMissing);
    }

    const result = await connection('recipes')
      .insert({
        name,
        prepareDescription,
        ingredients: JSON.stringify(ingredients),
        time
      });
    
    return response.json(successAdded);
  }
  async edit(request: Request, response: Response) {
    const id: number = Number(request.params.id ?? 0);
    const { name, prepareDescription, ingredients, time } = request.body;

    if(id < 1) {
      return response.json(errorIdIsMissing);
    }
    else if(!name || !ingredients || !time) {
      return response.json(errorValueIsMissing);
    }

    const result = await connection('recipes')
      .update({
        name,
        prepareDescription,
        ingredients: JSON.stringify(ingredients),
        time
      }).where('id', '=', id);
    
    console.log(result);
    
    return response.json(result > 0 ? successUpdated : errorWhenUpdate);
  }
  async delete(request: Request, response: Response) {
    const id: number = Number(request.params.id ?? 0);

    if(id < 1) {
      return response.json(errorWhenDelete);
    }

    const result = await connection('recipes')
      .delete()
      .where('id', '=', id);
    
    return response.json(result > 0 ? successDeleted : errorWhenDelete);
  }
}

export default RecipeController;