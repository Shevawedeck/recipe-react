import { useNavigate } from "react-router-dom"
import { IRecipe } from "./DataInterfaces"

interface Props {
    recipe: IRecipe,
    // onRecipeSelectedForEdit: () => void;
}

export default function RecipeCard({ recipe }: Props) {
    const navigate = useNavigate();
    return (
        <>
            <div className="card">
                <img src={`/images/recipe-images/${recipe.recipeImage}`} className="card-img-top" alt="..." />
                <div className="card-body">
                    <h5 className="card-title">{recipe.recipeName}</h5>
                    <button onClick={() => navigate(`/recipes/edit/${recipe.recipeId}`)} className="btn btn-outline-primary">Edit</button>
                    <p className="card-text"></p>
                </div>
            </div>
        </>
    )
}
