using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace back_end_ASP.Models
{
    public class Message
    {
        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        [Key]
        public long Id { get; set; }
        public string Content { get; set; } = null!;

        public ICollection<Translation> Translations { get; set; } = null!;

        public Message (long id, string content, ICollection<Translation> translations)
        {
            Id=id;
            Content=content;
            Translations=translations;
        }

        public Message()
        {
        }
    }
}
