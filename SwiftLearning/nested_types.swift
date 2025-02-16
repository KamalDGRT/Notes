class Employee
{
  var dept = Department ()
  class Department {
    var EmpId = 150;
    var EmpName = "Kamal";

    func GetDetails() -> String {
       return "Id: \(self.EmpId), Name: \(self.EmpName)"
    }
  }
}


var emp = Employee ()
print (emp.dept.GetDetails())
