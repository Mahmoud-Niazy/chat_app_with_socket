class UserDataModel{
  String? name , email , phone , id , image ;

  UserDataModel({
    required this.image,
    required this.phone,
    required this.name,
    required this.id,
    required this.email,
});

  UserDataModel.fromJson(Map<String,dynamic>json){
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    id = json['id'];
    image = json['image'];
  }

  Map<String,dynamic>toMap(){
    return {
      'name' : name ,
      'email' : email,
      'phone' : phone ,
      'id' : id ,
      'image' : image,
    };
  }
}