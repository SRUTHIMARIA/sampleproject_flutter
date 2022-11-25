class AthleteAssist {
  static const baseUrl = 'https://athlete.devateam.com/api';
  static const getSportsList = '$baseUrl/sports-list';
  static const setSportsList = '$baseUrl/student-sports';
  static getParentProfileType(String type) =>
      baseUrl + 'parent_profiles?type=$type';
  // static getParentProfileType(String type) => '$baseUrl/parent_profiles?type=$type';
  static const parentProfileDetails = '$baseUrl/parent_profiles';
  static getMedicalDetails(String params) =>
      baseUrl + 'medical-details/details?type=$params';
  static const addMedicalDetails='$baseUrl/medical-details/details';

  // static getMedicalDetails(String params) =>'$baseUrl/medical-details/details?type=$params';





}