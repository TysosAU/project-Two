using API.Database;
using Microsoft.EntityFrameworkCore;
using Microsoft.ML;

namespace API.Chatbot
{
    public class Bot
    {
        private readonly DatabaseContext _dbContext;
        private PredictionEngine<Convo, Prediction> _predictionEngine;
        private bool _isModelLoaded = false;

        public Bot(DatabaseContext dbContext)
        {
            _dbContext = dbContext;
        }

        public async Task InitializeModelAsync()
        {
            if (_isModelLoaded) return;
            await LoadModelAsync();
        }

        public async Task LoadModelAsync()
        {
            //first of all checks if the chatbot's model has already been loaded, if it has already been loaded, return and skip the rest of the code in this method.
            if (_isModelLoaded) return;
            var mlContext = new MLContext();
            //fetches data from the database
            var conversationData = await _dbContext.ChatbotData.ToListAsync();
            //converts the data fetched into an IDataView to help put the data into a suitable format for training the chatbot's model.
            var data = mlContext.Data.LoadFromEnumerable(conversationData);
            //pipline of transformations and training steps for the chatbot's model.
            var pipeline = mlContext.Transforms.Conversion.MapValueToKey(nameof(Convo.Response))
                .Append(mlContext.Transforms.Text.FeaturizeText("Features", nameof(Convo.UserInput)))
                .Append(mlContext.MulticlassClassification.Trainers.SdcaMaximumEntropy(labelColumnName: nameof(Convo.Response), maximumNumberOfIterations: 100))
                .Append(mlContext.Transforms.Conversion.MapKeyToValue("PredictedLabel"));
            //trains the model using the data and the pipeline.
            var model = pipeline.Fit(data);
            //creates a prediction engine from the trained model to help predict responses etc.
            _predictionEngine = mlContext.Model.CreatePredictionEngine<Convo, Prediction>(model);
            _isModelLoaded = true; //Marks the chatbot's model as loaded.
        }

        public async Task<string> PredictResponseAsync(string userInput)
        {
            await InitializeModelAsync();
            if (!_isModelLoaded)
                throw new InvalidOperationException("Chatbot not initialized.");
            var prediction = _predictionEngine.Predict(new Convo { UserInput = userInput });
            return prediction.PredictedResponse;
        }
    }
}
