using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using BD_Proyecto.Models;

namespace BD_Proyecto.Logic
{
    public class AccionesCarrito : IDisposable
    {
        public string CarritoId { get; set; }

        private CarritoContext _db = new CarritoContext();
        private readonly ProductContext _db2 = new ProductContext();

        public const string CartSessionKey = "IDCarrito";

        public void AddToCart(int id)
        {
            // Retrieve the product from the database.           
            CarritoId = GetCartId();

            var cartItem = _db.ItemsCarrito.SingleOrDefault(
                c => c.IDCarrito == CarritoId
                && c.IDProducto == id);
            if (cartItem == null)
            {
                // Create a new cart item if no cart item exists.                 
                cartItem = new ItemCarrito
                {
                    IDItem = Guid.NewGuid().ToString(),
                    IDProducto = id,
                    IDCarrito = CarritoId,
                    Cantidad = 1,
                    FechaCreacion = DateTime.Now
                };

                _db.ItemsCarrito.Add(cartItem);
            }
            else
            {
                // If the item does exist in the cart,                  
                // then add one to the quantity.                 
                cartItem.Cantidad++;
            }
            _db.SaveChanges();
        }

        public void Dispose()
        {
            if(_db != null)
            {
                _db.Dispose();
                _db = null;
            }
        }

        public string GetCartId()
        {
            if (HttpContext.Current.Session[CartSessionKey] == null)
            {
                if (!string.IsNullOrWhiteSpace(HttpContext.Current.User.Identity.Name))
                {
                    HttpContext.Current.Session[CartSessionKey] = HttpContext.Current.User.Identity.Name;
                }
                else
                {
                    // Generate a new random GUID using System.Guid class.     
                    Guid tempCartId = Guid.NewGuid();
                    HttpContext.Current.Session[CartSessionKey] = tempCartId.ToString();
                }
            }
            return HttpContext.Current.Session[CartSessionKey].ToString();
        }

        public List<ItemCarrito> GetCartItems()
        {
            CarritoId = GetCartId();

            return _db.ItemsCarrito.Where(c => c.IDCarrito == CarritoId).ToList();
        }

        public Producto GetProducto(int id)
        {
            return _db2.Productos.ToList().Find(x => x.ID == id);
        }
        public decimal GetTotal()
        {
            CarritoId = GetCartId();
            // Multiply product price by quantity of that product to get        
            // the current price for each of those products in the cart.  
            // Sum all product price totals to get the cart total.   
            decimal? total = decimal.Zero;
            for (int i = 0; i < GetCartItems().Count(); i++)
            {
                total += (decimal?) (GetProducto(GetCartItems().ElementAt(i).IDProducto).Precio*GetCartItems().ElementAt(i).Cantidad);
            }
            return total ?? decimal.Zero;
        }

        public AccionesCarrito GetCart(HttpContext context)
        {
            using (var cart = new AccionesCarrito())
            {
                cart.CarritoId = cart.GetCartId();
                return cart;
            }
        }

        public void UpdateShoppingCartDatabase(String cartId, ShoppingCartUpdates[] CartItemUpdates)
        {
            using (var db = new BD_Proyecto.Models.CarritoContext())
            {
                try
                {
                    int CartItemCount = CartItemUpdates.Count();
                    List<ItemCarrito> myCart = GetCartItems();
                    foreach (var cartItem in myCart)
                    {
                        // Iterate through all rows within shopping cart list
                        for (int i = 0; i < CartItemCount; i++)
                        {
                            if (cartItem.IDProducto == CartItemUpdates[i].ProductId)
                            {
                                if (CartItemUpdates[i].PurchaseQuantity < 1 || CartItemUpdates[i].RemoveItem == true)
                                {
                                    RemoveItem(cartId, cartItem.IDProducto);
                                }
                                else
                                {
                                    UpdateItem(cartId, cartItem.IDProducto, CartItemUpdates[i].PurchaseQuantity);
                                }
                            }
                        }
                    }
                }
                catch (Exception exp)
                {
                    throw new Exception("ERROR: Unable to Update Cart Database - " + exp.Message.ToString(), exp);
                }
            }
        }

        public void RemoveItem(string removeCartID, int removeProductID)
        {
            using (var _db = new BD_Proyecto.Models.CarritoContext())
            {
                try
                {
                    var myItem = (from c in _db.ItemsCarrito where c.IDCarrito == removeCartID && c.IDProducto == removeProductID select c).FirstOrDefault();
                    if (myItem != null)
                    {
                        // Remove Item.
                        _db.ItemsCarrito.Remove(myItem);
                        _db.SaveChanges();
                    }
                }
                catch (Exception exp)
                {
                    throw new Exception("ERROR: Unable to Remove Cart Item - " + exp.Message.ToString(), exp);
                }
            }
        }

        public void UpdateItem(string updateCartID, int updateProductID, int quantity)
        {
            using (var _db = new BD_Proyecto.Models.CarritoContext())
            {
                try
                {
                    var myItem = (from c in _db.ItemsCarrito where c.IDCarrito == updateCartID && c.IDProducto == updateProductID select c).FirstOrDefault();
                    if (myItem != null)
                    {
                        myItem.Cantidad = quantity;
                        _db.SaveChanges();
                    }
                }
                catch (Exception exp)
                {
                    throw new Exception("ERROR: Unable to Update Cart Item - " + exp.Message.ToString(), exp);
                }
            }
        }

        public void EmptyCart()
        {
            CarritoId = GetCartId();
            var cartItems = _db.ItemsCarrito.Where(
                c => c.IDCarrito == CarritoId);
            foreach (var cartItem in cartItems)
            {
                _db.ItemsCarrito.Remove(cartItem);
            }
            // Save changes.             
            _db.SaveChanges();
        }

        public int GetCount()
        {
            CarritoId = GetCartId();

            // Get the count of each item in the cart and sum them up          
            int? count = (from cartItems in _db.ItemsCarrito
                          where cartItems.IDCarrito == CarritoId
                          select (int?)cartItems.Cantidad).Sum();
            // Return 0 if all entries are null         
            return count ?? 0;
        }

        public struct ShoppingCartUpdates
        {
            public int ProductId;
            public int PurchaseQuantity;
            public bool RemoveItem;
        }
    }
}