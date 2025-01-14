using System.ComponentModel.DataAnnotations;

namespace API.Models
{
    public class ConvoModel
    {
        [Key]
        public int Id { get; set; }

        [Required]
        public string UserInput { get; set; }

        [Required]
        public string Response { get; set; }
    }
}
