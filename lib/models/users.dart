class Cuser {
  String? name;
  String? email;
  String? uid;
  Cuser({this.email, this.name, this.uid});
  Cuser.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    name = json['name'];
    uid = json['uid'];
  }
  Map<String, dynamic> tojson() {
    return {"uid": uid, "email": email, "name": name};
  }
}
