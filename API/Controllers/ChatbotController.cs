using Microsoft.AspNetCore.Mvc;
using API.Chatbot;
using API.Database;

namespace API.Controllers
{
    [ApiVersion("1.0")]
    [Route("api/[controller]")]
    [ApiController]
    public class ChatbotController : ControllerBase
    {
        private readonly Bot _chatbot;
        private readonly DatabaseContext _databaseContext;

        public ChatbotController(Bot Chatbot, DatabaseContext databaseContext)
        {
            _chatbot = Chatbot;
            _databaseContext = databaseContext;
        }

        [HttpPost("convo")]
        public async Task<IActionResult> Predict([FromBody] string userInput)
        {
            if (string.IsNullOrEmpty(userInput))
            {
                return BadRequest("Input cannot be empty.");
            }
            try
            {
                var response = await _chatbot.PredictResponseAsync(userInput);
                if (response == null)
                {
                    return StatusCode(500, "Prediction failed due to model not being initialized or other internal issues.");
                }

                return Ok(new { response });
            }
            catch (InvalidOperationException ex)
            {
                return StatusCode(500, $"Prediction failed: {ex.Message}");
            }
            catch (Exception ex)
            {
                return StatusCode(500, $"Internal server error: {ex.Message}");
            }
        }
    }
}
