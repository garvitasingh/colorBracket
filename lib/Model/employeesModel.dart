class EmployeesModel {
  int? id;
  String? name;
  String? rating;
  String? company;
  String? interests;
  String? viewMore;
  String? designation;
  String? companyLogo;
  String? jobDescripton;

  EmployeesModel(
      {this.id,
        this.name,
        this.rating,
        this.company,
        this.interests,
        this.viewMore,
        this.designation,
        this.companyLogo,
        this.jobDescripton});

  EmployeesModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    rating = json['rating'];
    company = json['company'];
    interests = json['interests'];
    viewMore = json['view_more'];
    designation = json['designation'];
    companyLogo = json['company_logo'];
    jobDescripton = json['job_descripton'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['rating'] = this.rating;
    data['company'] = this.company;
    data['interests'] = this.interests;
    data['view_more'] = this.viewMore;
    data['designation'] = this.designation;
    data['company_logo'] = this.companyLogo;
    data['job_descripton'] = this.jobDescripton;
    return data;
  }
}
