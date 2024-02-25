using back_end_ASP.DAO.MessageDAO;
using back_end_ASP.Data;
using back_end_ASP.Models;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using NuGet.Protocol;

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
        [HttpGet("{id:long}")]
        public async Task<IActionResult> GetByMessageById(long id) {
            var result = await messageDAOImpl.GetById(id);
            if(result == null)
            {
                return NotFound();
            }
            return Ok(result);
        }


        [HttpGet("{id:long}/{language}")]
        public async Task<IActionResult> GetByTranslation(long id,String language)
        {
            var result = await messageDAOImpl.GetByLanguage(id,language);
            if (result == null)
            {
                return NotFound();
            }
            return Ok(result);
        }

    }
}
