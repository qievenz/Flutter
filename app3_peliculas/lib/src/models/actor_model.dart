class Cast {
  List<Actor> actores = [];

  Cast.fromJsonList(List<dynamic> listaJson) {
    if (listaJson == null) return;

    listaJson.forEach((item) {
      final actor = Actor.fromJsonMap(item);

      actores.add(actor);
    });
  }
}

class Actor {
  bool adult;
  int gender;
  int id;
  String knownForDepartment;
  String name;
  String originalName;
  double popularity;
  String profilePath;
  int castId;
  String character;
  String creditId;
  int order;
  String department;
  String job;

  Actor({
    this.adult,
    this.gender,
    this.id,
    this.knownForDepartment,
    this.name,
    this.originalName,
    this.popularity,
    this.profilePath,
    this.castId,
    this.character,
    this.creditId,
    this.order,
    this.department,
    this.job,
  });


  Actor.fromJsonMap(Map<String, dynamic> json) {
    this.adult = json['adult'];
    this.gender = json['gender'];
    this.id = json['id'];
    this.knownForDepartment = json['known_for_department'];
    this.name = json['name'];
    this.originalName = json['original_name'];
    this.popularity = json['popularity'];
    this.profilePath = json['profile_path'];
    this.castId = json['cast_id'];
    this.character = json['character'];
    this.creditId = json['credit_id'];
    this.order = json['order'];
    this.department = json['department'];
    this.job = json['job'];
  }

  getFoto() {
    String url;
    if (profilePath == null || profilePath == 'null') url = 'https://i.ytimg.com/vi/tnHbeCHApOw/maxresdefault.jpg';
    
    url = 'https://image.tmdb.org/t/p/w500/$profilePath';
    
    return url;
  }

}
