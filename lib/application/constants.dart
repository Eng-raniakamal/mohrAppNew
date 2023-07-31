
  class  Constants {
    static const String baseUrl= 'https://mohrapi.azurewebsites.net';
    static const String LoginUrl = '$baseUrl/api/Account/VerifyLogin';
    static const String EmployeeUrl='$baseUrl/api/Employee';
    static const String SaveEmployeeBasicDataUrl='$baseUrl/api/Employee/PersonellData';
    static const String DisplayEmployeeBasicData='$baseUrl/api/Employee/GetPersonellData';
    static const String SaveEmpSkillsUrl='$baseUrl/api/Skills';
    static const String GetEmpSkillsUrl='$baseUrl/api/Employee/GetEmployeeSkills';
    static const String saveEmpAcademicDegree='$baseUrl/api/Employee/AcademicDegrees';
    static const String GetEmpAcademicDegree='$baseUrl/api/Employee/GetEmployeeAcademicDegrees';
    static const String GetQualifications='$baseUrl/api/Employee/GetQualificationsLookup';
    static const String GetGrades='$baseUrl/api/Employee/GetGradesLookup';
    static const String EmployeePhotoUrl='$baseUrl/api/Employee/Avatar';
    static const String vacationUrl='$baseUrl/api/Employee/GetVacations';
    static const String salaryUrl='$baseUrl/api/Employee/GetSalaries';
    static const String salaryDetailsUrl='$baseUrl/api/Employee/GetSalary/';

    static List<dynamic>? salary;
    static  List<dynamic>? vacation;
    static String salaryDetailsId="";
    static const EMPTY = "";
    static const ZERO = 0;
    static String token= "";
    static String imagePath="";
    static bool? canUpload;
    static String Name="";
    static String ArabicName="";
    static String EmpCode="";
    static List<String> Rlist =['Vacation Request','Errands Request','Permissions Request','Extra Request','Financial Request','Admin Request'];
    static const int apitimeout=60000;
  }