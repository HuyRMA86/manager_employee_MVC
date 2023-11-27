package fa.training;

import fa.training.service.EmployeeService;
import fa.training.service.impl.EmployeeServiceImpl;

public class aTest {
    public static void main(String[] args) {
        EmployeeService employeeService = new EmployeeServiceImpl();

        System.out.println(employeeService.getEmployeeWithPaging(1, 2));
    }
}
