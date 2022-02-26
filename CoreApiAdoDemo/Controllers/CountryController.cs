using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using CoreApiAdoDemo.Model;
using CoreApiAdoDemo.Repository;
using CoreApiAdoDemo.Utility;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Options;

namespace CoreApiAdoDemo.Controllers
{
    [Produces("application/json")]
    [Route("api/Country")]
    [Microsoft.AspNetCore.Cors.EnableCors("AllowOrigin")]
    public class CountryController : Controller
    {
        private readonly IOptions<MySettingsModel> appSettings;

        public CountryController(IOptions<MySettingsModel> app)
        {
            appSettings = app;
        }

        [HttpGet]
        [Route("GetCountriesList")]
        public IActionResult GetCountriesList()
        {
            var data = DbClientFactory<CountryDbClient>.Instance.GetAllCountries(appSettings.Value.DbConn);
            return Ok(data);
        }
    }
}
