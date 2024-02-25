using back_end_ASP.Data;
using back_end_ASP.Models;
using Microsoft.EntityFrameworkCore;
using Newtonsoft.Json.Linq;
using NuGet.Protocol;
using Org.BouncyCastle.Asn1.Crmf;
using System.Collections;
using System.Collections.Generic;

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
             var result = await _context.Messages.Where(m => m.Id == id).Select(m => new Message()
            {
                Id = m.Id,
                Content = m.Content,
                Translations = m.Translations.ToList(),
            }).FirstOrDefaultAsync();

            return result;
        }

        public async Task <IEnumerable> GetByLanguage(long id, string lanugage)
        {
            var result = await _context.Messages.Where(m=> m.Id == id).Join(
                 _context.Translations.Where(t => t.Language == lanugage)
                , message => message.Id //primary key of the first table
                , translation => translation.MessageId // the foreign key of the second table
                , (message, translation) => new
                {
                    translated_message = translation.TranslatedContent
                }).ToListAsync();
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
