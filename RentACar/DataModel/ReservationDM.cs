using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataModel
{
    public class ReservationDM
    {
        public int ID { get; set; }
        public DateTime Date { get; set; }
        public int Day { get; set; }
        public DateTime EndDate { get; set; }
        public int Amount { get; set; }
        public string Customer { get; set; }
        public string Car { get; set; }
        public string Marka { get; set; }
        public string Model { get; set; }
        public string CustomerName { get; set; }
        public string CustomerSurname { get; set; }
        public string CustomerPhone { get; set; }
        public string LicensePlate { get; set; }
        public string ChassisNumber { get; set; }
    }
}
