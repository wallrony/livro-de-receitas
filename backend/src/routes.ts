import express from 'express';
import RecipeController from './controllers/RecipeController';

const router = express.Router();

const recipeController: RecipeController = new RecipeController();

router.get('/recipes', recipeController.index);
router.get('/recipes/:id', recipeController.show);

router.post('/recipes', recipeController.add);

router.put('/recipes/:id', recipeController.edit);

router.delete('/recipes/:id', recipeController.delete);

export default router;