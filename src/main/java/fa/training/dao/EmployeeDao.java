package fa.training.dao;

import fa.training.dto.AddEmployee;
import fa.training.dto.SearchParam;
import fa.training.entities.Employee;

import java.util.List;

public interface EmployeeDao {

    Employee fillByPhone(String phone);
    boolean createEmployee(Employee employee);

    List<Employee> getAllEmployee();


    Employee getOneEmployee(int id);


    List<Employee> getEmployeeWithPaging(int page, int pageSize);

    List<Employee> getListEmployee(int page, int pageSize, String hql);
}
