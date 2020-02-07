


class ContentCategories{
  int idcategorie;

  String words;

  ContentCategories({this.idcategorie, this.words});

  List<ContentCategories> getcontentcategorie(int idcategory) {
    try{
      return content.where((category) => category.idcategorie.toString().contains(idcategory.toString())).toList();
    }
    catch(e){
      return null;
    }
    
  }

}

List<ContentCategories> content = [
    //Niños
    ContentCategories(idcategorie: 1, words: 'Hercules'),
    ContentCategories(idcategorie: 1, words: 'Pelota'),
    ContentCategories(idcategorie: 1, words: 'Silla'),
    ContentCategories(idcategorie: 1, words: 'Dinosaurio'),
    ContentCategories(idcategorie: 1, words: 'Robin Hood'),
    ContentCategories(idcategorie: 1, words: 'Gafas'),
    ContentCategories(idcategorie: 1, words: 'Cola'),
    ContentCategories(idcategorie: 1, words: 'Lapiz'),
    ContentCategories(idcategorie: 1, words: 'Lapicero'),
    ContentCategories(idcategorie: 1, words: 'Oreja'),
    ContentCategories(idcategorie: 1, words: 'Serpiente'),
    ContentCategories(idcategorie: 1, words: 'Boca'),
    ContentCategories(idcategorie: 1, words: 'Labios'),
    ContentCategories(idcategorie: 1, words: 'Batman'),
    ContentCategories(idcategorie: 1, words: 'Púrpura'),
    ContentCategories(idcategorie: 1, words: 'M&M'),
    ContentCategories(idcategorie: 1, words: 'Camara'),
    ContentCategories(idcategorie: 1, words: 'Mario'),
    ContentCategories(idcategorie: 1, words: 'Mulan'),
    ContentCategories(idcategorie: 1, words: 'Stitch'),
    ContentCategories(idcategorie: 1, words: 'Pato Lucas'),
    ContentCategories(idcategorie: 1, words: 'Gato con Botas'),
    ContentCategories(idcategorie: 1, words: 'Celular'),
    ContentCategories(idcategorie: 1, words: 'Zanahoria'),
    ContentCategories(idcategorie: 1, words: 'Brocoli'),
    ContentCategories(idcategorie: 1, words: 'Gallina'),
    ContentCategories(idcategorie: 1, words: 'Pastel'),
    ContentCategories(idcategorie: 1, words: 'Tortuga'),
    ContentCategories(idcategorie: 1, words: 'Saltar'),
    ContentCategories(idcategorie: 1, words: 'Superman'),
    ContentCategories(idcategorie: 1, words: 'Aplaudir'),
    ContentCategories(idcategorie: 1, words: 'Piscina'),
    ContentCategories(idcategorie: 1, words: 'Pasto'),
    ContentCategories(idcategorie: 1, words: 'Peter Pan'),
    ContentCategories(idcategorie: 1, words: 'Guitarra'),
    ContentCategories(idcategorie: 1, words: 'Piano'),
    ContentCategories(idcategorie: 1, words: 'McDonalds'),
    ContentCategories(idcategorie: 1, words: 'Almohada'),
    ContentCategories(idcategorie: 1, words: 'Pantera Rosa'),
    ContentCategories(idcategorie: 1, words: 'Fiona'),
    ContentCategories(idcategorie: 1, words: 'Lluvia'),
    ContentCategories(idcategorie: 1, words: 'Automóvil'),
    ContentCategories(idcategorie: 1, words: 'Tazón'),
    ContentCategories(idcategorie: 1, words: 'El Grinch'),
    ContentCategories(idcategorie: 1, words: 'Hoja'),
    ContentCategories(idcategorie: 1, words: 'Dibujar'),
    ContentCategories(idcategorie: 1, words: 'Bicicleta'),
    ContentCategories(idcategorie: 1, words: 'Pato'),
    ContentCategories(idcategorie: 1, words: 'Abrigo'),
    ContentCategories(idcategorie: 1, words: 'Montaña rusa'),
    ContentCategories(idcategorie: 1, words: 'Mono'),
    ContentCategories(idcategorie: 1, words: 'Cepillo de Dientes'),
    ContentCategories(idcategorie: 1, words: 'Cerdo'),
    ContentCategories(idcategorie: 1, words: 'Sonrisa'),
    ContentCategories(idcategorie: 1, words: 'Esmalte de uñas'),
    ContentCategories(idcategorie: 1, words: 'Rojo'),
    ContentCategories(idcategorie: 1, words: 'Casa'),
    ContentCategories(idcategorie: 1, words: 'Baloncesto'),
    ContentCategories(idcategorie: 1, words: 'Blanca Nieves'),
    ContentCategories(idcategorie: 1, words: 'Pinocho'),
    ContentCategories(idcategorie: 1, words: 'Unicornio'),
    ContentCategories(idcategorie: 1, words: 'Triangulo'),
    ContentCategories(idcategorie: 1, words: 'Circulo'),
    ContentCategories(idcategorie: 1, words: 'Hockey'),
    ContentCategories(idcategorie: 1, words: 'Computadora'),
    ContentCategories(idcategorie: 1, words: 'Shrek'),
    ContentCategories(idcategorie: 1, words: 'La sirenita'),
    ContentCategories(idcategorie: 1, words: 'TV'),
    ContentCategories(idcategorie: 1, words: 'Cara'),
    ContentCategories(idcategorie: 1, words: 'Fantasma'),
    ContentCategories(idcategorie: 1, words: 'Gusano'),
    ContentCategories(idcategorie: 1, words: 'Dragon'),
    ContentCategories(idcategorie: 1, words: 'Vaca'),
    ContentCategories(idcategorie: 1, words: 'Fútbol'),
    ContentCategories(idcategorie: 1, words: 'Popeye'),
    ContentCategories(idcategorie: 1, words: 'Inseco'),
    ContentCategories(idcategorie: 1, words: 'Hormiga'),
    ContentCategories(idcategorie: 1, words: 'Verde'),
    ContentCategories(idcategorie: 1, words: 'Rosa'),
    ContentCategories(idcategorie: 1, words: 'Naranja'),
    ContentCategories(idcategorie: 1, words: 'Ostra de mar'),
    ContentCategories(idcategorie: 1, words: 'Avión'),
    ContentCategories(idcategorie: 1, words: 'Barbie'),
    ContentCategories(idcategorie: 1, words: 'Muñeca'),
    ContentCategories(idcategorie: 1, words: 'Fuego'),
    ContentCategories(idcategorie: 1, words: 'Agua'),
    ContentCategories(idcategorie: 1, words: 'Robot'),
    ContentCategories(idcategorie: 1, words: 'Helado'),
    ContentCategories(idcategorie: 1, words: 'Cono de helado'),
    ContentCategories(idcategorie: 1, words: 'Ola'),
    ContentCategories(idcategorie: 1, words: 'Danza'),
    ContentCategories(idcategorie: 1, words: 'Hannah Montana'),
    ContentCategories(idcategorie: 1, words: 'Casper'),
    ContentCategories(idcategorie: 1, words: 'Queso'),
    ContentCategories(idcategorie: 1, words: 'Brazo'),
    ContentCategories(idcategorie: 1, words: 'Uñas'),
    ContentCategories(idcategorie: 1, words: 'Ojos'),
    ContentCategories(idcategorie: 1, words: 'Nariz'),
    ContentCategories(idcategorie: 1, words: 'Rectangulo'),
    ContentCategories(idcategorie: 1, words: 'Circulo'),
    ContentCategories(idcategorie: 1, words: 'Los 7 enanitos'),
    ContentCategories(idcategorie: 1, words: 'Minions'),
    ContentCategories(idcategorie: 1, words: 'El mago de oz'),
    ContentCategories(idcategorie: 1, words: 'Elefante'),
    ContentCategories(idcategorie: 1, words: 'Gerra de las galaxias'),
    ContentCategories(idcategorie: 1, words: 'Scooby-Doo'),
    ContentCategories(idcategorie: 1, words: 'Parpadear'),
    ContentCategories(idcategorie: 1, words: 'Toser'),
    ContentCategories(idcategorie: 1, words: 'Brincar'),
    ContentCategories(idcategorie: 1, words: 'Saludar'),
    ContentCategories(idcategorie: 1, words: 'Leer'),
    ContentCategories(idcategorie: 1, words: 'Escribir'),
    ContentCategories(idcategorie: 1, words: 'Escuchar'),

    //Profesiones



  ];
