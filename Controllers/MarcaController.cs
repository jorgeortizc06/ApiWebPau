using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Http;
using WebApplication2.Models;

namespace WebApplication2.Controllers
{
    public class MarcaController : ApiController
    {
        [HttpGet]
        public IHttpActionResult Query()
        {
            TestContext db = new TestContext();

            var data = db.Database.SqlQuery<Marca>("spMarcaQuery").ToList();

            return Ok(data);
        }

        [HttpGet]
        public IHttpActionResult Get(int IdMarca)
        {
            TestContext db = new TestContext();

            var data = db.Database.SqlQuery<Marca>("spMarcaQuery @IdMarca = {0}", IdMarca).FirstOrDefault();

            return Ok(data);
        }

        [HttpPost]
        public IHttpActionResult Insert(Marca model)
        {
            TestContext db = new TestContext();

            db.Database.ExecuteSqlCommand("spMarcaInsert @Descripcion = {0}, @Activo = {1}",
               model.Descripcion, model.Activo);

            return Ok();
        }

        [HttpPost]
        public IHttpActionResult Update(Marca model)
        {
            TestContext db = new TestContext();
            db.Database.ExecuteSqlCommand("spMarcaUpdate @IdMarca = {0}, @Descripcion = {1}, @Activo = {2}",
              model.IdMarca, model.Descripcion, model.Activo);

            return Ok();
        }

        [HttpPost]
        public IHttpActionResult Delete(Marca model)
        {
            TestContext db = new TestContext();

            db.Database.ExecuteSqlCommand("spMarcaDelete @IdMarca = {0}", model.IdMarca);

            return Ok();
        }
    }
}
