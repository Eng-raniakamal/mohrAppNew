
  class  Constants {
    static const String baseUrl= 'https://mohrapi.azurewebsites.net';
    static const String LoginUrl = '$baseUrl/api/Account/VerifyLogin';
    static const String EmployeeUrl='$baseUrl/api/Employee';
    static const String EmployeeBasicDataUrl='$baseUrl/api/Employee/PersonellData';
    static const String EmployeeSkillsUrl='$baseUrl/api/Skills';
    static const String EmployeePhotoUrl='$baseUrl/api/Employee/Avatar';
    static const String vacationUrl='$baseUrl/api/Employee/GetVacations';
    static  List<dynamic>? vacation;

    static const EMPTY = "";
    static const ZERO = 0;
    static String token= "";
    static String imagePath="";
    static String Name="";
    static String ArabicName="";
    static String EmpCode="";
    static List<String> Rlist =['Vacation Request','Errands Request','Permissions Request','Extra Request','Financial Request','Admin Request'];
    static const int apitimeout=60000;
  }