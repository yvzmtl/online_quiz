
class CategoryModel{
  String id="",name ="",image="";

  CategoryModel({
      //required this.id,
      required this.name,
      required this.image});

  CategoryModel.fromJson(Map<String, dynamic> json){
    //id = json["id"];
    name = json["name"];
    image = json["image"];
  }

  Map<String,dynamic> toJson(){
    final data = Map<String,dynamic>();

    //data["id"] = this.id;
    data["name"] = this.name;
    data["image"] = this.image;
    return data;
  }
}