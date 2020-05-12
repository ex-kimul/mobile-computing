import 'package:teropongduniaapp/model/kategori_model.dart';

List<KategoriModel> getKategoris(){
  List<KategoriModel> kategori = new List<KategoriModel>();
  KategoriModel kategoriModel = new KategoriModel();

  //1
  kategoriModel.kategoriName = "Bussines";
  kategoriModel.imageUrl = "https://images.unsplash.com/photo-1507679799987-c73779587ccf?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1502&q=80";
  kategori.add(kategoriModel);

  //2
  kategoriModel = new KategoriModel();
  kategoriModel.kategoriName = "Entertainment";
  kategoriModel.imageUrl = "https://images.unsplash.com/photo-1522869635100-9f4c5e86aa37?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1500&q=80";
  kategori.add(kategoriModel);

  //3
  kategoriModel = new KategoriModel();
  kategoriModel.kategoriName = "General";
  kategoriModel.imageUrl = "https://images.unsplash.com/photo-1495020689067-958852a7765e?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60";
  kategori.add(kategoriModel);

  //4
  kategoriModel = new KategoriModel();
  kategoriModel.kategoriName = "Health";
  kategoriModel.imageUrl = "https://images.unsplash.com/photo-1494390248081-4e521a5940db?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1595&q=80";
  kategori.add(kategoriModel);

  //5
  kategoriModel = new KategoriModel();
  kategoriModel.kategoriName = "Science";
  kategoriModel.imageUrl = "https://images.unsplash.com/photo-1554475901-4538ddfbccc2?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1504&q=80";
  kategori.add(kategoriModel);

  //6
  kategoriModel = new KategoriModel();
  kategoriModel.kategoriName = "Sports";
  kategoriModel.imageUrl = "https://images.unsplash.com/photo-1495563923587-bdc4282494d0?ixlib=rb-1.2.1&auto=format&fit=crop&w=1500&q=80";
  kategori.add(kategoriModel);

  //7
  kategoriModel = new KategoriModel();
  kategoriModel.kategoriName = "Technology";
  kategoriModel.imageUrl = "https://images.unsplash.com/photo-1519389950473-47ba0277781c?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1500&q=80";
  kategori.add(kategoriModel);

  return kategori;
}