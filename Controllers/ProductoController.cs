using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Http;
using WebApplication2.Models;

namespace WebApplication2.Controllers
{
    public class ProductoController : ApiController
    {
        [HttpGet]
        public IHttpActionResult Query()
        {
            TestContext db = new TestContext();

            var data = db.Database.SqlQuery<Producto>("spProductoQuery").ToList();

            return Ok(data);
        }

        [HttpGet]
        public IHttpActionResult Get(int IdProducto)
        {
            TestContext db = new TestContext();

            var data = db.Database.SqlQuery<Producto>("spProductoQuery @IdProducto = {0}", IdProducto).FirstOrDefault();

            return Ok(data);
        }

        [HttpPost]
        public IHttpActionResult Insert(Producto model)
        {
            TestContext db = new TestContext();

            db.Database.ExecuteSqlCommand("spProductoInsert @Descripcion = {0}, @IdMarca = {1}, @Activo = {2}, @Imagen = {3}",
               model.Descripcion, model.IdMarca, model.Activo, model.Imagen);

            return Ok();
        }

        [HttpPut]
        public IHttpActionResult Update(Producto model)
        {
            try
            {
                TestContext db = new TestContext();

                db.Database.ExecuteSqlCommand("spProductoUpdate @IdProducto = {0}, @Descripcion = {1}, @IdMarca = {2}, @Activo = {3}, @Imagen = {4}",
                  model.IdProducto, model.Descripcion, model.IdMarca, model.Activo, model.Imagen);

                return Ok();
            }
            catch(Exception e)
            {
                throw new Exception(e.Message);
            }
            
        }

        [HttpDelete]
        public IHttpActionResult Delete(Producto model)
        {
            TestContext db = new TestContext();

            db.Database.ExecuteSqlCommand("spProductoDelete @IdProducto = {0}", model.IdProducto);

            return Ok();
        }
    }
}
