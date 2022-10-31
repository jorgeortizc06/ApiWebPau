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
    }
}
