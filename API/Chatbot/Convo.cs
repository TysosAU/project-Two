using Microsoft.ML.Data;

namespace API.Chatbot
{
    public class Convo
    {
        [LoadColumn(0)]
        public string UserInput { get; set; }

        [LoadColumn(1)]
        public string Response { get; set; }
    }
}
