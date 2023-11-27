package fa.training.service;

import fa.training.dto.SearchParam;
import fa.training.entities.Employee;

import java.util.List;

public interface EmployeeService {

    Employee fillByPhone(String phone);
    boolean addEmployee(Employee employee);

    List<Employee> findAllEmployee();

    Employee getOneEmployee(int id);

    List<Employee> getEmployeeWithPaging(int page, int pageSize);

    List<Employee> getListEmployee(int page, int pageSize, SearchParam searchParam);
}
