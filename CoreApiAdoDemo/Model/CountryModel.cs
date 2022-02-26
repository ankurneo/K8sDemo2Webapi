using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.Threading.Tasks;

namespace CoreApiAdoDemo.Model
{

    [DataContract]
    public class CountryModel
    {
        [DataMember(Name = "Id")]
        public int Id { get; set; }

        [DataMember(Name = "Name")]
        public string Name { get; set; }

        [DataMember(Name = "Area")]
        public Decimal Area { get; set; }

        [DataMember(Name = "Continent")]
        public string Continent { get; set; }

        [DataMember(Name = "Leader")]
        public string Leader { get; set; }


        [DataMember(Name = "IsActive")]
        public bool IsActive { get; set; }
    }
}
