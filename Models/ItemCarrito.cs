using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel.DataAnnotations;

namespace BD_Proyecto.Models
{
    public class ItemCarrito
    {
        [Key]
        public string IDItem { get; set; }

        public string IDCarrito { get; set; }

        public int Cantidad { get; set; }

        public System.DateTime FechaCreacion { get; set; }

        public int IDProducto { get; set; }

    }
}