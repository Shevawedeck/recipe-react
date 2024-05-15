using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using RecipeSystem;

namespace RecipeAPI
{
    [Route("api/[controller]")]
    [ApiController]
    public class CuisineController : ControllerBase
    {
        [HttpGet]
        public List<BizCuisine> Get()
        {
            return new BizCuisine().GetList();
        }
        [HttpGet("{id:int:min(0)}")]
        public BizCuisine Get(int id)
        {
            BizCuisine c = new BizCuisine();
            c.Load(id);
            return c;
        }
    }
}
