class Travel{
  String name;
  String location;
  String url;

  Travel(this.name, this.location,  this.url);

  static List<Travel> generateTravelBlog(){
    return [
      Travel('Ono Alawe Nias', 'Ononiha', 'assets/image/top 1.jfif'),
      Travel('Pulau Batu Telo', 'Nisel', 'assets/image/top 2.jfif'),
      Travel('Tempat Bersantai', 'Nias Barat', 'assets/image/top 3.png'),
      Travel('Simpang Lima', 'Nisel', 'assets/image/top 4.jfif'),
      Travel('Telo', 'Pulau Telo', 'assets/image/top 5.jfif'),
    ];
  }
   static List<Travel> generateMostlBlog(){
    return [
      Travel('Sorake Lagundri', 'Nisel', 'assets/image/botton 1.jpg'),
      Travel('Pulau Telo', 'Nisel', 'assets/image/botton 2.jpg'),
      Travel('Pantai Di Telo', 'Nisel', 'assets/image/botton 3.jpg'),
      Travel('Tari Elang', 'Nisel', 'assets/image/botton 4.jpg'),
      Travel('Tari Elang', 'Nisel', 'assets/image/botton 5.jpg'),
    ];
  }
}
