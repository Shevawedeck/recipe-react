import { FieldValues, useForm } from "react-hook-form"
import { useEffect, useState } from "react";
import { IUsername } from "./DataInterfaces"
import { useNavigate, useParams } from "react-router-dom";
import { blankCookbook, deleteCookbook, fetchCookbookById, fetchUsernames, postCookbook } from "./DataUtil";


export default function CookbookEdit() {
    const { register, handleSubmit, reset, setValue } = useForm();
    const [usernames, setUsernames] = useState<IUsername[]>([]);
    const [errorMsg, setErrorMsg] = useState("");
    const navigate = useNavigate();
    const { cookbookid } = useParams();
    const id = Number(cookbookid) || 0;

    useEffect(() => {
        const fetchData = async () => {
            const data = await fetchUsernames();
            setUsernames(data);
            if (id) {
                const cookbook = await fetchCookbookById(id);
                reset(cookbook);
            } else {
                reset(blankCookbook);
                setValue("dateCreated", new Date().toISOString().split('T')[0]);
            }
        }
        fetchData();
    }, [id, reset])

    const submitForm = async (data: FieldValues) => {
        console.log(data);
        const c = await postCookbook(data);
        setErrorMsg(c.errorMessage);
        reset(c);
    };

    const handleDelete = async () => {
        const c = await deleteCookbook(id);
        setErrorMsg(c.errorMessage);
        if (c.errorMessage == "") {
            reset(blankCookbook)
        }
    }
    return (
        <>
            <div className="bg-light">
                <div className="row">
                    <div className="col-12">
                        <h2 id="hmsg">{errorMsg}</h2>
                    </div>
                </div>
                <div className="row">
                    <div className="col-12">
                        <form onSubmit={handleSubmit(submitForm)}>
                            <div className="mb-3">
                                <label htmlFor="cookbookId" className="form-label"></label>
                                <input type="hidden" {...register("cookbookId")} className="form-control" required />
                            </div>

                            <div className="mb-3">
                                <label htmlFor="cookbookName" className="form-label">Cookbook Name:</label>
                                <input type="text" {...register("cookbookName")} className="form-control" required />
                            </div>

                            <div className="mb-3">
                                <label htmlFor="usernameId" className="form-label">Username:</label>
                                <select {...register("usernameId")} className="form-select">
                                    {usernames.map(u => <option key={u.usernameId} value={u.usernameId}>{u.usernameName}</option>)}
                                </select>
                            </div>

                            <div className="mb-3">
                                <label htmlFor="price" className="form-label">Price:</label>
                                <input type="number" {...register("price")} className="form-control" required />
                            </div>

                            <div className="mb-3">
                                <label htmlFor="dateCreated" className="form-label">Date Created:</label>
                                <input type="string" {...register("dateCreated")} className="form-control" readOnly />
                            </div>

                            <button type="submit" className="btn btn-primary">Submit</button>
                            <button onClick={handleDelete} type="button" id="btndelete" className="btn btn-danger">Delete</button>
                            <button onClick={() => navigate("/cookbooks")} type="button" className="btn btn-secondary">Back</button>
                        </form>
                    </div>
                </div>
            </div>
        </>
    )
}
