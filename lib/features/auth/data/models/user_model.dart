import 'dart:convert';

import 'package:gorouter/features/auth/domain/entities/user.dart';

class UserModel extends User{
  const UserModel({
    super.id,
    super.createdAt,
    super.name,
    super.avatar
});

  const UserModel.empty()
      : this(id: 1,createdAt: "",name: "",avatar: "");

 factory UserModel.fromJson(String source)
 => UserModel.fromMap(jsonDecode(source) as Map<String, dynamic>);

  UserModel.fromMap(Map<String,dynamic> map):
      this(
        id:  map['id'] as int,
        createdAt: map["createdAt"] as String,
        name: map["name"] as String,
        avatar: map["avatar"] as String,
      );

  UserModel copyWith({
    String? avatar,
    int? id,
    String? createdAt,
    String? name
}){
    return UserModel(
      avatar: avatar ?? this.avatar,
      id: id ?? this.id,
      createdAt: createdAt ?? this.createdAt,
      name: name ?? this.name
    );
  }

  Map<String, dynamic> toMap()=> {
    'id': id,
    'createdAt': createdAt,
    'name': name,
    "avatar": avatar
  };

  String toJson() => jsonEncode(toMap());
}