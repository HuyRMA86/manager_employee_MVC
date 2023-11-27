package fa.training.controller;

import fa.training.entities.Account;
import fa.training.service.AccountService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.time.LocalDate;

@Controller
@SessionAttributes("accountSession")
@RequestMapping("/ui")
public class LoginController {


    @Autowired
    private AccountService accountService;

    @GetMapping("/login")
    public String loginForm() {
        return "login";
    }


    @PostMapping("/login")
    public String loginFrom(@RequestParam String email, @RequestParam String password, RedirectAttributes ra) {
        if(!accountService.fillByEmail(email, password)) {
            System.out.println("emp khong ton tai");
            return "redirect:/ui/login";
        }else {
            ra.addFlashAttribute("email", email);
            System.out.println("chuyen huong");
            return "redirect:/ui/home";
        }
    }

    @GetMapping("/home")
    public String goCms(@ModelAttribute("email") String email, Model model) {
        System.out.println("email" + email);
        Account account = accountService.getAccount(email);
        System.out.println("account"+account);
        model.addAttribute("accountSession", account);
        return "cms";
    }

    @GetMapping("/logout")
    public String logoutForm(SessionStatus sessionStatus) {
        sessionStatus.setComplete();
        return "login";
    }
}
