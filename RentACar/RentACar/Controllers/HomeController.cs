using DataAccess;
using DataModel;
using RentACar.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace RentACar.Controllers
{
    public class HomeController : Controller
    {
        public ActionResult Index()
        {
            return View();
        }
        
        
        public ActionResult LoginControl(string Username, string Password)
        {
            UserDA uda = new UserDA();
            UserDM udm = new UserDM();
            if (Username != null && Password != null)
            {
                udm = uda.LoginControl(Username, Password);
                Session["UserID"] = udm.ID;
                Session["UserName"] = udm.Username;

                if (udm.Username==null)
                {
                    Session["UserName"] = "Hata";
                    return RedirectToAction("Index");
                }
               
                return RedirectToAction("Reservation");
            }
            else
            {
                
                return RedirectToAction("Index");
            }
            
        }

        public ActionResult CarRecord()
        {
            if (Session["UserID"] == null)
            {
                return RedirectToAction("Login");
            }
            return View();
        }


        public JsonResult getBrands()
        {

            BrandDA bda = new BrandDA();
            return Json(bda.getBrandList());

        }

        public JsonResult getModel(string ID)
        {

            BrandDA bda = new BrandDA();
            return Json(bda.getModelList(ID));

        }

        [HttpPost]
        public ActionResult CarRecord(CarDM car)
        {
            CarDA cda = new CarDA();
            cda.AddCar(car);
            return RedirectToAction("CarRecord");

            
        }

        public ActionResult Customer()
        {
            if (Session["UserID"] == null)
            {
                return RedirectToAction("Login");
            }
            return View();
        }

        public ActionResult AddCustomer(CustomerDM customer)
        {

            CustomerDA cda = new CustomerDA();
            cda.AddCustomer(customer);
            return RedirectToAction("Customer");
        }


        public JsonResult getCity()
        {

            CustomerDA cda = new CustomerDA();
            return Json(cda.getCityList());

        }


        public JsonResult getTown(string ID)
        {

            CustomerDA cda = new CustomerDA();
            return Json(cda.getTownList(ID));

        }

        public ActionResult Reservation()
        {
            if (Session["UserID"] == null)
            {
                return RedirectToAction("Login");
            }
            ReservationDA rda = new ReservationDA();
            List<ReservationDM> rdm = rda.GetReservationList();
            return View(rdm);
        }

        public ActionResult ReservationAdd()
        {
            if (Session["UserID"] == null)
            {
                return RedirectToAction("Login");
            }
            return View();
        }

        public ActionResult AddReservation(ReservationDM reservation)
        {

            ReservationDA rda = new ReservationDA();
            rda.AddReservation(reservation);
            return RedirectToAction("Reservation");
        }



        public JsonResult getCustomer()
        {

            CustomerDA cda = new CustomerDA();
            return Json(cda.getCustomerList());

        }


        public JsonResult getCar()
        {

            CarDA cda = new CarDA();
            return Json(cda.getCarList());

        }

        public ActionResult getByDateCar()
        {
            if (Session["UserID"] == null)
            {
                return RedirectToAction("Login");
            }
            CarDA rda = new CarDA();
            List<CarDM> rdm = rda.getCarList();
            return View(rdm);
        }

        public JsonResult GetDateCar(string StartDate, string EndDate)
        {
            DateTime StDate = Convert.ToDateTime(StartDate);
            DateTime EDate = Convert.ToDateTime(EndDate);
            CarDA cda = new CarDA();
            return Json(cda.getByDateCarList(StDate, EDate));

        }


        public ActionResult PopulerCar()
        {
            if (Session["UserID"] == null)
            {
                return RedirectToAction("Login");
            }
            CarDA rda = new CarDA();
            List<CarDM> rdm = rda.popCar();
            return View(rdm);
        }

        public JsonResult getStatusControl(string ID,string StartDate,string EndDate)
        {
            int CarID = Convert.ToInt32(ID);
            DateTime StDate = Convert.ToDateTime(StartDate);
            DateTime EnDate = Convert.ToDateTime(EndDate);
            ReservationDA cda = new ReservationDA();
            return Json(cda.getStatusControlCar(CarID,StDate,EnDate));

        }

        
        public ActionResult ReservationDetail(string ID)
        {
            if (Session["UserID"] == null)
            {
                return RedirectToAction("Login");
            }
            int ReservationID = Convert.ToInt32(ID);
            ReservationDA cda = new ReservationDA();
            List<ReservationDM> rdm = cda.ReservationDetail(ReservationID);
            return View(rdm);
        }

        public ActionResult DeleteReservation(string ID)
        {
            if (Session["UserID"] == null)
            {
                return RedirectToAction("Login");
            }
            int ReservationID = Convert.ToInt32(ID);
            ReservationDA cda = new ReservationDA();
            cda.DeleteReservation(ReservationID);
            return RedirectToAction("Reservation");
        }


        public ActionResult About()
        {
            ViewBag.Message = "Your application description page.";

            return View();
        }

        public ActionResult Contact()
        {
            ViewBag.Message = "Your contact page.";

            return View();
        }

        public ActionResult Login()
        {
            return View();
        }



        public ActionResult Logout()
        {

            Session.Abandon();
            return RedirectToAction("Login");
        }
    }
}