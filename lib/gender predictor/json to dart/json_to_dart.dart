class NameClass{
  // int ? Count;
  String? name;
  String? Gender;
  double? probability;
  NameClass({this.name,this.Gender,this.probability});
  NameClass.fromJson(Map<String, dynamic> json){
    // Count = json['count'];
    name = json['name'];
    Gender = json['gender'];
    probability = json['probability'];
  }
}


// class NameClass{
//   int ? Count;
//   String? name;
//   String? Gender;
//   double? probability;
//   NameClass({this.Count,this.name,this.Gender,this.probability});
//   NameClass.fromJson(Map<String, dynamic> json){
//     Count = json['count'];
//     name = json['name'];
//     Gender = json['gender'];
//     probability = json['probability'];
//   }
// }