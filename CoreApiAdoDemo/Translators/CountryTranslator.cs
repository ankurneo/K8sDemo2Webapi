using CoreApiAdoDemo.Model;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Threading.Tasks;
using CoreApiAdoDemo.Utility;

namespace CoreApiAdoDemo.Translators
{
    public static class CountryTranslator
    {
        public static CountryModel TranslateAsCountry(this SqlDataReader reader, bool isList = false)
        {
            if (!isList)
            {
                if (!reader.HasRows)
                    return null;
                reader.Read();
            }
            var item = new CountryModel();
            if (reader.IsColumnExists("Id"))
                item.Id = SqlHelper.GetNullableInt32(reader, "Id");

            if (reader.IsColumnExists("Name"))
                item.Name = SqlHelper.GetNullableString(reader, "Name");

            if (reader.IsColumnExists("Area"))
                item.Area = SqlHelper.GetNullableDecimal(reader, "Area");

            if (reader.IsColumnExists("Continent"))
                item.Continent = SqlHelper.GetNullableString(reader, "Continent");

            if (reader.IsColumnExists("Leader"))
                item.Leader = SqlHelper.GetNullableString(reader, "Leader");

            if (reader.IsColumnExists("IsActive"))
                item.IsActive = SqlHelper.GetBoolean(reader, "IsActive");

            return item;
        }

        public static List<CountryModel> TranslateAsCountriesList(this SqlDataReader reader)
        {
            var list = new List<CountryModel>();
            while (reader.Read())
            {
                list.Add(TranslateAsCountry(reader, true));
            }
            return list;
        }
    }
}
