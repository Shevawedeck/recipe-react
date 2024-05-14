import { FieldValues } from "react-hook-form";
import { ICookbook, ICuisine, IRecipe, IUsername } from "./DataInterfaces";

let baseurl = import.meta.env.VITE_API_URL;

async function fetchData<T>(url: string): Promise<T> {
    url = baseurl + url;
    const r = await fetch(url);
    const data = await r.json();
    return data;
}

async function deleteData<T>(url: string): Promise<T> {
    url = baseurl + url;
    const r = await fetch(url, { method: "DELETE" });
    const data = await r.json();
    return data;
}

async function postData<T>(url: string, form: FieldValues): Promise<T> {
    url = baseurl + url;
    const r = await fetch(url, {
        method: "POST",
        body: JSON.stringify(form),
        headers: {
            "Content-Type": "application/json"
        }
    });
    const data = await r.json();
    return data;
}

export async function fetchRecipes() {
    return await fetchData<IRecipe[]>("recipe");
}

export async function fetchRecipeById(recipeId: number) {
    return await fetchData<IRecipe[]>(`recipe/${recipeId}`);
}

export async function fetchCuisines() {
    return await fetchData<ICuisine[]>("recipe/cuisines");
}

export async function fetchUsernames() {
    return await fetchData<IUsername[]>("recipe/usernames");
}

export async function fetchCookbooks() {
    return await fetchData<ICookbook[]>("cookbook");
}

export async function fetchCookbookById(cookbookId: number) {
    return await fetchData<ICookbook[]>(`cookbook/${cookbookId}`);
}

export async function postRecipe(form: FieldValues) {
    return postData<IRecipe>("recipe", form);
}

export async function deleteRecipe(recipeId: number) {
    return deleteData<IRecipe>(`recipe?id=${recipeId}`);
}

export async function postCookbook(form: FieldValues) {
    return postData<ICookbook>("cookbook", form);
}

export async function deleteCookbook(cookbookId: number) {
    return deleteData<ICookbook>(`cookbook?id=${cookbookId}`);
}

export const blankRecipe: IRecipe = {
    recipeId: 0,
    usernameId: 0,
    cuisineId: 0,
    recipeName: "",
    calories: 0,
    dateDrafted: "",
    datePublished: null,
    dateArchived: null,
    vegan: "",
    recipeStatus: "",
    usernameName: "",
    numIngredients: 0,
    recipeImage: "",
    errorMessage: ""
};

export const blankCookbook: ICookbook = {
    cookbookId: 0,
    usernameId: 0,
    cookbookName: "",
    price: 0,
    skillDesc: "",
    author: "",
    cookbookImage: "",
    errorMessage: "",
    dateCreated: ""
}