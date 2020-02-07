
class Categories{

int idcategorie; //Id de la categoria

String nombre; // Nombre de la categoria

String descripcion; //Descripcion de la categoria

String urlLogo; //URL de la imagen de la categoria

bool estaActiva; //La categoria esta funcional ?

Categories({this.idcategorie, this.nombre, this.descripcion, this.urlLogo, this.estaActiva});

// List<Categories> getCategories(){
//   List<Categories> categories = [
//     Categories(nombre: 'Niños', 
//     descripcion: 'Juega con palabras de muñecos animados y contenido para los pequeños',
//     urlLogo: 'assets/',
//     estaActiva: true),
//     Categories(nombre: 'Profesiones', 
//     descripcion: 'Juega con palabras de profesiones',
//     urlLogo: 'assets/',
//     estaActiva: true),
//     Categories(nombre: 'Acciones', 
//     descripcion: 'Juega con palabras y oraciones de acciones que realizas en tu dia a dia',
//     urlLogo: 'assets/',
//     estaActiva: true),
//   ];
//   return categories;
// }


// Future<List<Categories>> getCategories() async{
//   try {
//     Response response = await get('http://worldtimeapi.org/api/timezone/');
//     Iterable data = json.decode(response.body); //jsonDecode(response.body);
//     List<Categories> categories = data.map((Map model) => Categories.fromJson(model)).toList();
//     return categories;

//   }
//   catch(e){
//     print(e);
//   }
// }
}