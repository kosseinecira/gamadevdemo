namespace back_end_ASP.DAO
{
    public interface IDAO<T>
    {
        Task<T> GetById(long id);
        Task<IEnumerable<T>> GetAll();
        Task<T> Save(T t);
        Task Update(long id);
        void Delete(long id);
    }
}
