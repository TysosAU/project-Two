using Microsoft.ML.Data;

namespace API.Chatbot
{
    public class Prediction
    {
        [ColumnName("PredictedLabel")]
        public string PredictedResponse { get; set; }
    }
}
