using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using RecipeSystem;

namespace RecipeAPI
{
    [Route("api/[controller]")]
    [ApiController]
    public class CookbookController : ControllerBase
    {
        [HttpGet]
        public List<BizCookbook> Get()
        {
            return new BizCookbook().GetList();
        }
        [HttpGet("{id:int:min(0)}")]
        public BizCookbook Get(int id)
        {
            BizCookbook c = new BizCookbook();
            c.Load(id);
            return c;
        }
        [HttpPost]
        public IActionResult Post(BizCookbook cookbook)
        {
            try
            {
                cookbook.Save();
                return Ok(cookbook);
            }
            catch (Exception ex)
            {
                cookbook.ErrorMessage = ex.Message;
                return BadRequest(cookbook);
            }
        }
        [HttpDelete]
        public IActionResult Delete(int id)
        {
            BizCookbook c = new();
            try
            {
                c.Delete(id);
                return Ok(c);
            }
            catch (Exception ex)
            {
                c.ErrorMessage = ex.Message;
                return BadRequest(c);
            }
        }
    }
}
