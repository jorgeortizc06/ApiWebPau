
using System.Data.Entity;
using System.Data.Entity.ModelConfiguration.Conventions;
using System.Reflection.Emit;

namespace WebApplication2
{
    public class TestContext : DbContext
    {
        public TestContext() : base("TestContext")
        {
        }             
    }
}
