using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Http;
using WebApplication2.Models;

namespace WebApplication2.Controllers
{
    public class ProveedorController : ApiController
    {
        [HttpGet]
        public IHttpActionResult Query()
        {
            TestContext db = new TestContext();
            var data = db.Database.SqlQuery<Proveedor>("spProveedorQuery").ToList();

            return Ok(data);
        }

        [HttpGet]
        public IHttpActionResult Get(int IdProveedor)
        {
            TestContext db = new TestContext();

            var data = db.Database.SqlQuery<Proveedor>("spProveedorQuery {0}", IdProveedor).FirstOrDefault();

            return Ok(data);
        }
    }
}
