using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using RecipeSystem;

namespace RecipeAPI
{
    [Route("api/[controller]")]
    [ApiController]
    public class MealController : ControllerBase
    {
        [HttpGet]
        public List<BizMeal> Get()
        {
            return new BizMeal().GetList();
        }
        [HttpGet("{id:int:min(0)}")]
        public BizMeal Get(int id)
        {
            BizMeal m = new BizMeal();
            m.Load(id);
            return m;
        }
    }
}
