import { useEffect, useState } from "react";
import { ICuisine, IUsername } from "./DataInterfaces"
import { FieldValues, useForm } from "react-hook-form"
import { blankRecipe, deleteRecipe, fetchCuisines, fetchRecipeById, fetchUsernames, postRecipe } from "./DataUtil";
import { useNavigate, useParams } from "react-router-dom";


export default function RecipeEdit() {
    const { register, handleSubmit, reset, setValue } = useForm();
    const [cuisines, setCuisines] = useState<ICuisine[]>([]);
    const [usernames, setUsernames] = useState<IUsername[]>([]);
    const [errorMsg, setErrorMsg] = useState("");
    const navigate = useNavigate();

    const { recipeid } = useParams();
    const id = Number(recipeid) || 0;

    useEffect(() => {
        const fetchData = async () => {
            const data = await fetchCuisines();
            setCuisines(data);
            const datau = await fetchUsernames();
            setUsernames(datau);
            if (id) {
                const recipe = await fetchRecipeById(id);
                reset(recipe);
            } else {
                reset(blankRecipe);
                setValue("dateDrafted", new Date().toISOString().split('T')[0]);
            }
        }
        fetchData();
    }
        , [id, reset, setValue]);

    const submitForm = async (data: FieldValues) => {
        console.log(data);
        const r = await postRecipe(data);
        setErrorMsg(r.errorMessage);
        reset(r);
        if (!r.errorMessage && id === 0) {
            setValue("dateDrafted", new Date().toISOString().split('T')[0]);
        }
    };

    const handleDelete = async () => {
        const r = await deleteRecipe(id);
        setErrorMsg(r.errorMessage);
        if (r.errorMessage == "") {
            reset(blankRecipe)
        }
    }
    return (
        <>
            <div className="bg-light ">
                <div className="row">
                    <div className="col-12">
                        <h2 id="hmsg">{errorMsg}</h2>
                    </div>
                </div>
                <div className="row">
                    <div className="col-12">
                        <form onSubmit={handleSubmit(submitForm)}>
                            <div className="mb-3">
                                <label htmlFor="recipeId" className="form-label"></label>
                                <input type="hidden" {...register("recipeId")} className="form-control" required />
                            </div>

                            <div className="mb-3">
                                <label htmlFor="recipeName" className="form-label">Recipe Name:</label>
                                <input type="text" {...register("recipeName")} className="form-control" required />
                            </div>

                            <div className="mb-3">
                                <label htmlFor="cuisineId" className="form-label">Cuisine:</label>
                                <select {...register("cuisineId")} className="form-select">
                                    {cuisines.map(c => <option key={c.cuisineId} value={c.cuisineId}>{c.cuisineType}</option>)}
                                </select>
                            </div>

                            <div className="mb-3">
                                <label htmlFor="usernameId" className="form-label">Username:</label>
                                <select {...register("usernameId")} className="form-select">
                                    {usernames.map(u => <option key={u.usernameId} value={u.usernameId}>{u.usernameName}</option>)}
                                </select>
                            </div>

                            <div className="mb-3">
                                <label htmlFor="calories" className="form-label">Calories:</label>
                                <input type="number" {...register("calories")} className="form-control" required />
                            </div>

                            <div className="mb-3">
                                <label htmlFor="dateDrafted" className="form-label">Date Drafted:</label>
                                <input type="string" {...register("dateDrafted")} className="form-control" readOnly />
                            </div>

                            <button type="submit" className="btn btn-primary">Submit</button>
                            <button onClick={handleDelete} type="button" id="btndelete" className="btn btn-danger">Delete</button>
                            <button onClick={() => navigate("/recipes")} type="button" className="btn btn-secondary">Back</button>
                        </form>
                    </div>
                </div>
            </div>
        </>
    )
}


