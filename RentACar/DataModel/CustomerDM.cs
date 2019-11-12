using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataModel
{
    public class CustomerDM
    {
        public int ID { get; set; }
        public string Name { get; set; }
        public string Surname { get; set; }
        public string Title { get; set; }
        public string Gender { get; set; }
        public DateTime DateOfBirth { get; set; }
        public string TCNo { get; set; }
        public string TaxNo { get; set; }
        public string TaxAdministration { get; set; }
        public string City { get; set; }
        public string Town { get; set; }
        public string Address { get; set; }
        public string HomePhone { get; set; }
        public string BusinessPhone { get; set; }
        public string CepPhone { get; set; }
    }
}
