using CoreApiAdoDemo.Model;
using CoreApiAdoDemo.Utility;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using CoreApiAdoDemo.Translators;
using System.Data.SqlClient;
using System.Data;

namespace CoreApiAdoDemo.Repository
{
    public class CountryDbClient
    {
        public List<CountryModel> GetAllCountries(string connString)
        {
            return SqlHelper.ExtecuteProcedureReturnData<List<CountryModel>>(connString,
                "GetCountries", r => r.TranslateAsCountriesList());
        }
    }
}
