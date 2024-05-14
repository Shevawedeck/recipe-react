import { ICookbook } from "./DataInterfaces"
import { useNavigate } from "react-router-dom";

interface Props {
    cookbook: ICookbook
}

export default function CookbookCard({ cookbook }: Props) {
    const navigate = useNavigate();

    return (
        <>
            <div className="card">
                <img src={`/images/cookbook-images/${cookbook.cookbookImage}`} className="card-img-top" alt="..." />
                <div className="card-body">
                    <h5 className="card-title">{cookbook.cookbookName}</h5>
                    <button onClick={() => navigate(`/cookbooks/edit/${cookbook.cookbookId}`)} className="btn btn-outline-primary">Edit</button>
                    <p className="card-text"></p>
                </div>
            </div>
        </>
    )
}
