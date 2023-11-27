package fa.training.controller;

import fa.training.converter.LocalDateEditor;
import fa.training.dto.AddEmployee;
import fa.training.dto.SearchParam;
import fa.training.entities.Account;
import fa.training.entities.Employee;
import fa.training.service.AccountService;
import fa.training.service.EmployeeService;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import java.time.LocalDate;
import java.util.List;

@Controller
@RequestMapping("/employee")
public class EmployeeController {

    @Autowired
    private EmployeeService employeeService;

    @Autowired
    private AccountService accountService;

    @InitBinder
    public void initBinder(WebDataBinder binder) {
        binder.registerCustomEditor(LocalDate.class, new LocalDateEditor());
    }

    @GetMapping("/search")
    public String searchEmployee(@RequestParam String searchValue, @RequestParam String filterValue,
                                 @RequestParam int numberValue, RedirectAttributes ra) {

        ra.addFlashAttribute("searchValue", searchValue);
        ra.addFlashAttribute("filterValue", filterValue);
        ra.addFlashAttribute("numberValue", numberValue);
        return "redirect:/employee/list";
    }

    @GetMapping("/list")
    @ResponseBody
    public String employeeList(HttpServletRequest request, @ModelAttribute("searchValue") String searchValue,
                               @ModelAttribute("filterValue") String filterValue, @ModelAttribute("numberValue") int numberValue) {
        SearchParam searchParam = SearchParam.builder().search(searchValue).searchField(filterValue).build();
        System.out.println(searchParam);
        System.out.println(numberValue);
        List<Employee> employees = employeeService.getListEmployee(numberValue, 3, searchParam);
        System.out.println(employees);
        StringBuilder sb = new StringBuilder();
        employees.forEach(x -> {
            sb.append("<tr>")
                    .append("<td>"+x.getId()+"</td>")
                    .append("<td>"+x.getFirstName()+" "+x.getLastName()+"</td>")
                    .append("<td>"+x.getDob()+"</td>")
                    .append("<td>"+x.getAddress()+"</td>")
                    .append("<td>"+x.getPhone()+"</td>" )
                    .append("<td>"+x.getDepartmentName()+"</td>")
                    .append("<td>")
                    .append("<a href= \""+ request.getContextPath()+"/employee/detail/"+x.getId()+"\" class='view-detail'>")
                    .append("<i class=\"fa-solid fa-eye\"></i>")
                    .append("<span>View</span>")
                    .append("</a> </td>")
                    .append("</tr>");
        });
        return sb.toString();
    }

    @GetMapping("/detail/{id}")
    public String showDetailEmp(@PathVariable String id, ModelMap modelMap) {
        int index = Integer.parseInt(id);
        Employee employee = employeeService.getOneEmployee(index);
        Account account = accountService.getOneAccount(index);

        modelMap.addAttribute("employee1", employee);
        modelMap.addAttribute("account", account);
        System.out.println(account);
        return "employeeDetail";
    }


    @GetMapping("/add")
    public String addEmployee(Model model) {
        model.addAttribute("addEmployee", new AddEmployee());
        return "add-employee";
    }

    @PostMapping("/data")
    public  String addEmployeeData(@Valid @ModelAttribute AddEmployee addEmployee, BindingResult bindingResult, Model model) {

        System.out.println(addEmployee);
        if(bindingResult.hasErrors()) {
            System.out.println("Loi data");
            return "add-employee";
        }
        System.out.println(addEmployee);
        Account account = new Account();
        Employee employee = new Employee();
        BeanUtils.copyProperties(addEmployee, account);
        BeanUtils.copyProperties(addEmployee, employee);

        int status = addEmployee.getStatus() == null ? 0 : 1;
        account.setStatus(status);
        account.setEmployee(employee);
        System.out.println(account);
        System.out.println(employee);
        if (accountService.getAccount(account.getEmail()) != null) {
            model.addAttribute("msg", "Email has been registered!!!");
        } else if(employeeService.fillByPhone(employee.getPhone()) != null) {
            model.addAttribute("msg", "Phone number has been registered!!!");
        } else {
        System.out.println(accountService.saveAccount(account));
        }
        model.addAttribute("addEmployee", new AddEmployee());
        return "add-employee";
    }

}
