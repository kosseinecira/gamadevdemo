using back_end_ASP.DAO.MessageDAO;
using back_end_ASP.Data;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace back_end_ASP.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class MessageController : ControllerBase
    {
        private readonly IMessageDAO messageDAOImpl;

        public MessageController(IMessageDAO messageDAOImpl)
        {
            this.messageDAOImpl = messageDAOImpl;
        }
        [HttpGet]
        public async Task<IActionResult> GetAllMessages()
        {
            var result = await messageDAOImpl.GetAll();
            if (result == null)
            {
                return NotFound();
            }

            return Ok(result);
        }
        
    }
}
