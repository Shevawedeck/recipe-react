import { createBrowserRouter } from "react-router-dom";
import RecipeScreen from "./RecipeScreen";
import App from "./App";
import RecipeEdit from "./RecipeEdit";
import CookbookScreen from "./CookbookScreen";
import CookbookEdit from "./CookbookEdit";


const router = createBrowserRouter([
    {
        path: "/", element: <App />, children: [
            { path: "/recipes", element: <RecipeScreen /> },
            { path: "/cookbooks", element: <CookbookScreen /> },
            { path: "/recipes/edit/:recipeid?", element: <RecipeEdit /> },
            { path: "/cookbooks/edit/:cookbookid?", element: <CookbookEdit /> }
        ]
    },
]);

export default router;