class AtheleteAssist {
  // authentication apis
  static const baseUrl = 'https://athlete.devateam.com/api';
  static const register = baseUrl + '/register';
  static const login = baseUrl + '/login';
  static const forgotPassword = baseUrl + '/request-otp';
  static const verifyOtp = baseUrl + '/verify-otp';
  static const resetPassword = baseUrl + '/reset-password';

  //sports apis
  static const getSportsList = baseUrl+'/sports-list';
  static const setSportsList = baseUrl+'/student-sports';
  //age groups api
  static const getAgeGroup=baseUrl+'/age-groups';

  //age selection api
  static const saveAgeSelection=baseUrl+'/save-age-students';
  static const getAgeSelection=baseUrl+'/get-age-students';

  //student feedback api
  static const saveStudentFeedback=baseUrl+'/student-feedbacks';
  static const getStudentFeedback=baseUrl+'/student-feedbacks';

  //parent details apis
  static const getParentProfileType =baseUrl+'/parent_profiles?type=';
  static const parentProfileDetails = baseUrl+'/parent_profiles';

  //medical details
  static const addMedicalDetails=baseUrl+'/medical-details/details';
  static const getMedicalDetails=baseUrl+'/medical-details/details?type=';
  static const physicalOrMedical=baseUrl+'/medical-details/more-info';
  static const savePostPermission=baseUrl+'/medical-details/permission-to-post';
  static const saveDoctor=baseUrl+'/medical-details/information';

  //enrollment apis
  static const studentEnrollment=baseUrl+'/student-enrollment';
  static const saveAspirations=baseUrl+'/aspirations';
  static const getAspirations=baseUrl+'/aspirations';
  // self evaluation apis

  static const selfEvaluation=baseUrl+'/self-evaluations';
  static const getSelfEvaluation=baseUrl+'/self-evaluations';
  static const saveInspiredImages=baseUrl+'/save-inspired-images';

}