
import NavBar from './NavBar'
import './App.css'
import './assets/css/bootstrap.min.css'
import { Outlet } from 'react-router-dom'

function App() {


  return (
    <>
      <div className="container">
        <div className="row">
          <div className="col-12 px-0">
            <NavBar />
          </div>
        </div>
        <div className="row">
          <div className="">
            {/* {isRecipeEdit ? <RecipeEdit /> : <RecipeScreen />} */}
            <hr />
            <Outlet />
          </div>
        </div>
      </div>
    </>
  )
}

export default App
