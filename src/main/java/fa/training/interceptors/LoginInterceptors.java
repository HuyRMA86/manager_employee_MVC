package fa.training.interceptors;

import org.springframework.util.StringUtils;
import org.springframework.web.servlet.HandlerInterceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class LoginInterceptors implements HandlerInterceptor {
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        HttpSession session = request.getSession();
        String accountSession = (String) session.getAttribute("accountSession");

        System.out.println(accountSession);
        System.out.println("preHandle() from LoginInterceptor");
        if(!request.getRequestURI().equals("/ui/login")) {
            if(StringUtils.isEmpty(accountSession)) {
                response.sendRedirect(request.getContextPath()+"/ui/login");
                return false;
            }
        }
        return true;
    }
}
