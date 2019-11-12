using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace RentACar.Models
{
    public class Car
    {
        public string brand { get; set; }
        public string model { get; set; }
        public string model_year { get; set; }
        public string licensePlate { get; set; }
        public string chassisNumber { get; set; }
        public string color { get; set; }
        public string type { get; set; }
        public string amount { get; set; }
        public string amountType { get; set; }
        
    }
}