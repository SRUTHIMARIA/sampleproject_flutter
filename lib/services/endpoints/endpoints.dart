class AtheleteAssist {
  static const baseUrl = 'https://athlete.devateam.com/api';
  static const register = baseUrl + '/register';
  static const login = baseUrl + '/login';
  static const forgotPassword = baseUrl + '/request-otp';
  static const verifyOtp = baseUrl + '/verify-otp';
  static const resetPassword = baseUrl + '/reset-password';


  static const getSportsList = '$baseUrl/sports-list';
  static const setSportsList = '$baseUrl/student-sports';
  static const getAgeGroup='$baseUrl/age-groups';
  static const getParentProfileType ='$baseUrl/parent_profiles?type=';
  // static getParentProfileType(String type) => '$baseUrl/parent_profiles?type=$type';
  static const parentProfileDetails = '$baseUrl/parent_profiles';
  static const addMedicalDetails='$baseUrl/medical-details/details';
  // static const getParentProfileType ='$baseUrl/parent_profiles?type=';
  static const getMedicalDetails='$baseUrl/medical-details/details?type=';
  static const physicalOrMedical='$baseUrl/medical-details/more-info';
  static const savePostPermission='$baseUrl/medical-details/permission-to-post';
  static const saveDoctor='$baseUrl/medical-details/information';
  static const studentEnrollment='$baseUrl/student-enrollment';



}