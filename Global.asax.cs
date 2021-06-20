using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Optimization;
using System.Web.Routing;
using System.Web.Security;
using System.Web.SessionState;
using System.Data.Entity;
using BD_Proyecto.Models;
using BD_Proyecto.Logic;
namespace BD_Proyecto
{
    public class Global : HttpApplication
    {
        void Application_Start(object sender, EventArgs e)
        {
            // Code that runs on application startup
            RouteConfig.RegisterRoutes(RouteTable.Routes);
            BundleConfig.RegisterBundles(BundleTable.Bundles);

            // Inicializa la base de datos
            Database.SetInitializer(new ProductDatabaseInitializer());
            Database.SetInitializer(new CarritoDatabaseInitializer());

            
        }
    }
}