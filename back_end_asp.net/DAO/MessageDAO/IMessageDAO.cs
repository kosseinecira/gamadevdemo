using back_end_ASP.DAO;
using back_end_ASP.Models;
using System.Collections;

namespace back_end_ASP.DAO.MessageDAO
{
    public interface IMessageDAO : IDAO<Message>
    {
        public Task<IEnumerable> GetByLanguage(long id, string lanugage);
    }
}
