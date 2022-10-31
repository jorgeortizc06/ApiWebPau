using System;

namespace WebApplication2.Models
{
    public class Marca
    {
        public int IdMarca { get; set; }
        public string Descripcion { get; set; }
        public bool Activo { get; set; }
        public string UsrIng { get; set; }
        public DateTime FecIng { get; set; }

    }

}