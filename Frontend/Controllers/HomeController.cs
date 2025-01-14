using Frontend.Models;
using Microsoft.AspNetCore.Mvc;
using System.Diagnostics;
using Newtonsoft.Json;
using System.Net.Http;
using System.Text;
using System.Threading.Tasks;

namespace Frontend.Controllers
{
    public class HomeController : Controller
    {
        private readonly ILogger<HomeController> _logger;
        private readonly IHttpClientFactory _httpClientFactory;

        public HomeController(ILogger<HomeController> logger, IHttpClientFactory httpClientFactory)
        {
            _logger = logger;
            _httpClientFactory = httpClientFactory;
        }

        [HttpGet]
        public IActionResult Chatbot()
        {
            return View(new Convo());
        }

        [HttpPost]
        public async Task<IActionResult> Chatbot(Convo convo)
        {
            if (string.IsNullOrWhiteSpace(convo.userInput))
            {
                ViewBag.ErrorMessage = "Input cannot be empty.";
                return View(convo);
            }
            var httpClient = _httpClientFactory.CreateClient();
            var response = await httpClient.PostAsync("https://localhost:7177/api/Chatbot/convo",
                new StringContent($"\"{convo.userInput}\"", Encoding.UTF8, "application/json"));
            var apiResponse = await response.Content.ReadAsStringAsync();
            if (!response.IsSuccessStatusCode)
            {
                ViewBag.ErrorMessage = $"Error: {apiResponse}";
                return View(convo);
            }
            try
            {
                var json = JsonConvert.DeserializeObject<dynamic>(apiResponse);
                ViewBag.ChatbotMessage = json.response?.ToString();
            }
            catch
            {
                ViewBag.ChatbotMessage = "An error occurred while parsing the chatbot's response.";
            }
            return View(convo);
        }

        public IActionResult Index()
        {
            return View();
        }

        public IActionResult Privacy()
        {
            return View();
        }

        [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
        public IActionResult Error()
        {
            return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
        }
    }
}
