import { useEffect, useState } from "react"
import { IRecipe } from "./DataInterfaces"
import RecipeCard from './RecipeCard'
import { blankRecipe, fetchRecipes } from "./DataUtil";
import { Link, useNavigate } from "react-router-dom"
import RecipeEdit from "./RecipeEdit";

interface Props {
    onEdit: (recipe: IRecipe) => void;
}

export default function RecipeScreen() {
    const [recipeList, setRecipeList] = useState<IRecipe[]>([]);
    const [isLoading, setIsLoading] = useState(false);

    //const [recipeForEdit, setRecipeForEdit] = useState(blankRecipe);

    const navigate = useNavigate();

    useEffect(() => {
        setIsLoading(true);
        const fetchData = async () => {
            const data = await fetchRecipes();
            setRecipeList(data);
            setIsLoading(false);
        };
        fetchData();
    }
        , []);


    return (
        <>
            <div className="row">
                <div className={isLoading ? "placeholder-glow" : ""}>
                    <h2 className="mt-2 bg-light">
                        <span className={isLoading ? "placeholder-glow" : ""}>{recipeList.length} Recipes</span>
                    </h2>
                </div>
            </div>
            <div className="row mt-2">
                <div className="col-3">
                    <button className="btn btn-primary" onClick={() => navigate("/recipes/edit/0")}>Create New Recipe</button>
                </div>
            </div>
            <div className="row mt-4">
                {recipeList.map(r =>
                    <div key={r.recipeId} className="col-md-6 col-lg-3 mb-2">
                        <RecipeCard recipe={r} />
                    </div>
                )
                }
            </div>
        </>
    )
}