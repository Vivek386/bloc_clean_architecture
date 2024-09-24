import 'package:equatable/equatable.dart';

class User extends Equatable{
 const User({
    this.id,
    this.createdAt,
    this.name,
    this.avatar
});

  const User.empty()
      : this(id: 1,createdAt: "",name: "",avatar: "");


  final int? id;
  final String? createdAt;
  final String? name;
  final String? avatar;

  @override
  // TODO: implement props
  List<Object?> get props => [id];


}