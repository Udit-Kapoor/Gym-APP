class TrainerProfile {
  int id;
  String firstName;
  String middleName;
  String lastName;
  String dOB;
  String gender;
  String phone;
  String altPhone;
  String email;
  String address1;
  String address2;
  String city;
  String state;
  int pincode;
  String image;
  String idProof;
  String idProofImage;
  String resume;
  String joiningDate;
  int salary;
  String salaryDueDate;
  String releasingDate;
  bool active;
  String dateAdded;
  int user;

  TrainerProfile(
      {this.id,
        this.firstName,
        this.middleName,
        this.lastName,
        this.dOB,
        this.gender,
        this.phone,
        this.altPhone,
        this.email,
        this.address1,
        this.address2,
        this.city,
        this.state,
        this.pincode,
        this.image,
        this.idProof,
        this.idProofImage,
        this.resume,
        this.joiningDate,
        this.salary,
        this.salaryDueDate,
        this.releasingDate,
        this.active,
        this.dateAdded,
        this.user});

  TrainerProfile.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstName = json['first_Name'];
    middleName = json['middle_Name'];
    lastName = json['last_Name'];
    dOB = json['DOB'];
    gender = json['gender'];
    phone = json['phone'];
    altPhone = json['alt_phone'];
    email = json['email'];
    address1 = json['Address1'];
    address2 = json['Address2'];
    city = json['city'];
    state = json['state'];
    pincode = json['pincode'];
    image = json['image'];
    idProof = json['id_proof'];
    idProofImage = json['id_proof_image'];
    resume = json['resume'];
    joiningDate = json['joining_date'];
    salary = json['salary'];
    salaryDueDate = json['salary_due_date'];
    releasingDate = json['releasing_date'];
    active = json['active'];
    dateAdded = json['date_added'];
    user = json['user'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['first_Name'] = this.firstName;
    data['middle_Name'] = this.middleName;
    data['last_Name'] = this.lastName;
    data['DOB'] = this.dOB;
    data['gender'] = this.gender;
    data['phone'] = this.phone;
    data['alt_phone'] = this.altPhone;
    data['email'] = this.email;
    data['Address1'] = this.address1;
    data['Address2'] = this.address2;
    data['city'] = this.city;
    data['state'] = this.state;
    data['pincode'] = this.pincode;
    data['image'] = this.image;
    data['id_proof'] = this.idProof;
    data['id_proof_image'] = this.idProofImage;
    data['resume'] = this.resume;
    data['joining_date'] = this.joiningDate;
    data['salary'] = this.salary;
    data['salary_due_date'] = this.salaryDueDate;
    data['releasing_date'] = this.releasingDate;
    data['active'] = this.active;
    data['date_added'] = this.dateAdded;
    data['user'] = this.user;
    return data;
  }
}
