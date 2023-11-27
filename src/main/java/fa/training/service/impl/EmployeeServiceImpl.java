package fa.training.service.impl;

import fa.training.dao.EmployeeDao;
import fa.training.dao.impl.EmployeeDaoImpl;
import fa.training.dto.SearchParam;
import fa.training.entities.Employee;
import fa.training.service.EmployeeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;

@Service
@Transactional
public class EmployeeServiceImpl implements EmployeeService {

    @Autowired
    private EmployeeDao employeeDao;

    @Override
    public Employee fillByPhone(String phone) {
        return employeeDao.fillByPhone(phone);
    }

    @Override
    public boolean addEmployee(Employee employee) {
        boolean result = false;
        if(employeeDao.fillByPhone(employee.getPhone() ) == null) {
            result = employeeDao.createEmployee(employee);
        }
        return result;
    }

    @Override
    public List<Employee> findAllEmployee() {
        return employeeDao.getAllEmployee();
    }

    @Override
    public Employee getOneEmployee(int id) {
        return employeeDao.getOneEmployee(id);
    }

    @Override
    public List<Employee> getEmployeeWithPaging(int page, int pageSize) {
        return employeeDao.getEmployeeWithPaging(page, pageSize);
    }


    @Override
    public List<Employee> getListEmployee(int page, int pageSize, SearchParam searchParam) {
        StringBuilder sb = new StringBuilder("From Employee e ");
        if (!searchParam.getSearch().isEmpty()) {
            switch (searchParam.getSearchField()) {
                case "address":
                    sb.append("WHERE e.address LIKE ").append("'%").append(searchParam.getSearch()).append("%'");
                    break;
                case "phoneNumber":
                    sb.append("WHERE e.phone LIKE ").append("'%").append(searchParam.getSearch()).append("%'");
                    break;
                case "department":
                    sb.append("WHERE e.departmentName LIKE ").append("'%").append(searchParam.getSearch()).append("%'");
                    break;
                case "name":
                    sb.append("WHERE (e.firstName+' '+e.lastName) LIKE ").append("'%").append(searchParam.getSearch()).append("%'");
                    break;
                default:
            }
        }
        String hql = sb.toString();
        System.out.println(hql);
        return employeeDao.getListEmployee(page, pageSize, hql);
    }


}
