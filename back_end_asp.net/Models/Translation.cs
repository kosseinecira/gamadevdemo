using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace back_end_ASP.Models
{
    public class Translation
    {
        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        [Key]
        public long Id { set; get; }
        [Column("message_id")]
        public long MessageId { set; get; } // Required foreign key property
        [Column("translated_content")]
        public string TranslatedContent { set; get; } = null!;

        public string Language { set; get; } = null!;
        public Message Message { set; get; } = null!;
        public Translation() { }

        public Translation(long id, string translatedContent, string language)
        {
            Id = id;
            TranslatedContent = translatedContent;
            Language = language;
        }






    }
}
