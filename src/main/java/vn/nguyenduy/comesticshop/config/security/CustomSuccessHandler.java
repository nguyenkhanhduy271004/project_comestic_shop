package vn.nguyenduy.comesticshop.config.security;

import java.io.IOException;
import java.util.Collection;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.web.DefaultRedirectStrategy;
import org.springframework.security.web.RedirectStrategy;
import org.springframework.security.web.WebAttributes;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import vn.nguyenduy.comesticshop.domain.User;
import vn.nguyenduy.comesticshop.service.impl.EmailServiceImpl;
import vn.nguyenduy.comesticshop.service.impl.UserServiceImpl;

public class CustomSuccessHandler implements AuthenticationSuccessHandler {

    @Autowired
    private UserServiceImpl userServiceImpl;

    @Autowired
    private EmailServiceImpl emailServiceImpl;

    private RedirectStrategy redirectStrategy = new DefaultRedirectStrategy();

    protected String determineTargetUrl(final Authentication authentication) {

        Map<String, String> roleTargetUrlMap = new HashMap<>();
        roleTargetUrlMap.put("ROLE_USER", "/");
        roleTargetUrlMap.put("ROLE_ADMIN", "/admin");
        roleTargetUrlMap.put("ROLE_VENDOR", "/vendor");

        final Collection<? extends GrantedAuthority> authorities = authentication.getAuthorities();
        for (final GrantedAuthority grantedAuthority : authorities) {
            String authorityName = grantedAuthority.getAuthority();
            if (roleTargetUrlMap.containsKey(authorityName)) {
                return roleTargetUrlMap.get(authorityName);
            }
        }

        throw new IllegalStateException();
    }

    protected void clearAuthenticationAttributes(HttpServletRequest request, Authentication authentication) {
        HttpSession session = request.getSession(false);
        if (session == null) {
            return;
        }
        session.removeAttribute(WebAttributes.AUTHENTICATION_EXCEPTION);
        String email = authentication.getName();
        User user = this.userServiceImpl.getUserByEmail(email);
        if (user != null) {
            session.setAttribute("fullName", user.getFullName());
            session.setAttribute("avatar", user.getAvatar());
            session.setAttribute("id", user.getId());
            session.setAttribute("email", user.getEmail());
            session.setAttribute("isLogin", true);
            session.setAttribute("role", user.getRole().getName());

            if (user.getCart() != null) {
                int sum = user.getCart().getSum();
                session.setAttribute("sum", sum);
            } else {
                session.setAttribute("sum", 0);
            }
        }

    }

    @Override
    public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
            Authentication authentication) throws IOException, ServletException {
        String email = authentication.getName();
        User user = this.userServiceImpl.getUserByEmail(email);

        if (user != null && !user.isActive()) {
            String otp = this.userServiceImpl.generateOTP();

            this.emailServiceImpl.sendOtpEmail(user.getEmail(), otp);

            HttpSession session = request.getSession();
            session.setAttribute("otp", otp);
            session.setAttribute("user", user);

            redirectStrategy.sendRedirect(request, response, "/verify-otp");
            return;
        }

        String targetUrl = determineTargetUrl(authentication);

        if (response.isCommitted()) {
            return;
        }

        redirectStrategy.sendRedirect(request, response, targetUrl);
        clearAuthenticationAttributes(request, authentication);
    }

}
