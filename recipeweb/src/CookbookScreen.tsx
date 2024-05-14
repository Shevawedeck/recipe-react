import { useEffect, useState } from "react";
import { useNavigate } from "react-router-dom"
import { ICookbook } from "./DataInterfaces";
import CookbookCard from "./CookbookCard";
import { fetchCookbooks } from "./DataUtil";

export default function CookbookScreen() {
    const [cookbookList, setCookbookList] = useState<ICookbook[]>([]);
    const navigate = useNavigate();
    const [isLoading, setIsLoading] = useState(false);

    useEffect(() => {
        setIsLoading(true);
        const fetchData = async () => {
            const data = await fetchCookbooks();
            setCookbookList(data);
            setIsLoading(false);
        };
        fetchData();
    }, []);

    return (
        <>
            <div className="row">
                <div className={isLoading ? "placeholder-glow" : ""}>
                    <h2 className="mt-2 bg-light">
                        <span className={isLoading ? "placeholder-glow" : ""}>{cookbookList.length} Cookbooks</span>
                    </h2>
                </div>
            </div>
            <div className="row mt-2">
                <div className="col-3">
                    <button className="btn btn-primary" onClick={() => navigate("/cookbooks/edit/0")}>Create New Cookbook</button>
                </div>
            </div>
            <div className="row mt-4">
                {cookbookList.map(c =>
                    <div key={c.cookbookId} className="col-md-6 col-lg-3 mb-2">
                        <CookbookCard cookbook={c} />
                    </div>
                )
                }
            </div>
        </>
    )
}
