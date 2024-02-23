using back_end_ASP.Data;
using back_end_ASP.Models;
using Microsoft.EntityFrameworkCore;
using NuGet.Protocol;

namespace back_end_ASP.DAO.MessageDAO
{
    public class MessageDAOImpl : IMessageDAO
    {
        private readonly ClickMeContext _context;

        public MessageDAOImpl(ClickMeContext context)
        {
            _context = context;
        }
        public void Delete(long id)
        {
            throw new NotImplementedException();
        }

        public async Task<IEnumerable<Message>> GetAll()
        {
            var result = await _context.Messages.Include(c => c.Translations).ToListAsync();
            return result;
        }

        public async Task<Message> GetById(long id)
        {
            var result = await _context.Messages.FindAsync(id);
            return result;
        }

        public Task<Message> Save(Message t)
        {
            throw new NotImplementedException();
        }

        public Task Update(long id)
        {
            throw new NotImplementedException();
        }
    }
}
