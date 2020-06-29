interface CustomResponse {
  message: string;
  data?: any;
}

export function successSelected(data: any) {
  return {
    message: 'success',
    data
  } as CustomResponse;
}

export const successAdded = {
  message: 'success - data added',
} as CustomResponse;

export const successUpdated = {
  message: 'success - data updated',
} as CustomResponse;

 export const successDeleted = {
  message: 'success - data deleted'
} as CustomResponse;

export const errorIdIsMissing = {
  message: 'error - id is missing'
} as CustomResponse;

export const errorValueIsMissing = {
  message: 'error - value is missing'
} as CustomResponse;

export const errorWhenAdd = {
  message: 'error - an error ocurres when will add a recipe'
} as CustomResponse;

export const errorWhenUpdate = {
  message: 'error - an error ocurres when will update a recipe'
} as CustomResponse;

export const errorWhenDelete = {
  message: 'error - an error ocurres when will delete a recipe'
} as CustomResponse