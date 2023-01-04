package repository.employee;

import model.employee.Employee;

import java.util.List;

public interface IEmployeeRepository {
    List<Employee> selectAllEmployee();
    boolean insertEmployee(Employee employee);
    boolean deleteEmployee(int id);
    boolean updateEmployee(Employee employee);
    List<Employee> searchEmployee(String name);
    Employee selectEmployee(int id);
}
