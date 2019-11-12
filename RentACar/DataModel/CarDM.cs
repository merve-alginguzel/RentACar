using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataModel
{
    public class CarDM
    {
        public int ID { get; set; }
        public string brand { get; set; }
        public string model { get; set; }
        public string model_year { get; set; }
        public string licensePlate { get; set; }
        public string chassisNumber { get; set; }
        public string color { get; set; }
        public string type { get; set; }
        public string status { get; set; }
        public string amount { get; set; }
        public string amountType { get; set; }
    }
}
