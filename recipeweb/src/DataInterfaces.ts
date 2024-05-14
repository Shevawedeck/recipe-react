export interface ICuisine {
    cuisineId: number;
    cuisineType: string;
}

export interface IRecipe {
    recipeId: number;
    usernameId: number;
    cuisineId: number;
    recipeName: string;
    calories: number;
    dateDrafted: string;
    datePublished: Date | null;
    dateArchived: Date | null;
    vegan: string;
    recipeStatus: string;
    usernameName: string;
    numIngredients: number;
    recipeImage: string;
    errorMessage: string;
}

export interface ICookbook {
    cookbookId: number;
    usernameId: number;
    cookbookName: string;
    price: number;
    skillDesc: string;
    dateCreated: string;
    author: string;
    cookbookImage: string;
    errorMessage: string;
}

export interface IUsername {
    usernameId: number;
    usernameName: string;
    lastname: string;
    firstName: string;
    errorMessage: string;
}