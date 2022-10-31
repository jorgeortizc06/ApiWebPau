namespace WebApplication2.Models
{
    public class Producto
    {
        public int IdProducto { get; set; }
        public string Descripcion { get; set; }
        public int IdMarca { get; set; }
        public string Marca { get; set; }
        public bool Activo { get; set; }
    }
}
