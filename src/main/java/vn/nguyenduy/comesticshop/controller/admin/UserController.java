package vn.nguyenduy.comesticshop.controller.admin;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.http.ResponseEntity;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.handler.annotation.Payload;
import org.springframework.messaging.handler.annotation.SendTo;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;
import vn.nguyenduy.comesticshop.domain.Role;
import vn.nguyenduy.comesticshop.domain.User;
import vn.nguyenduy.comesticshop.repository.RoleRepository;
import vn.nguyenduy.comesticshop.service.impl.UploadServiceImpl;
import vn.nguyenduy.comesticshop.service.impl.UserServiceImpl;

@Controller
public class UserController {

    @Autowired
    private UserServiceImpl userServiceImpl;
    @Autowired
    private UploadServiceImpl uploadServiceImpl;
    @Autowired
    private PasswordEncoder passwordEncoder;
    @Autowired
    private RoleRepository roleRepository;

    @RequestMapping("/")
    public String getHomePage(Model model) {
        List<User> arrUsers = this.userServiceImpl.getAllUsersByEmail("1@gmail.com");
        System.out.println(arrUsers);

        model.addAttribute("eric", "test");
        model.addAttribute("nguyenduy", "from controller with model");
        return "hello";
    }

    @RequestMapping("/admin/user")
    public String getUserPage(Model model, @RequestParam("page") Optional<String> pageOptional) {
        int page = 1;
        try {
            if (pageOptional.isPresent()) {
                page = Integer.parseInt(pageOptional.get());
            } else {
                page = 1;
            }
        } catch (Exception e) {
            page = 1;
        }
        Pageable pageable = PageRequest.of(page - 1, 10);
        Page<User> prs = this.userServiceImpl.getAllUsers(pageable);
        List<User> users = prs.getContent();
        model.addAttribute("users", users);
        model.addAttribute("currentPage", page);
        model.addAttribute("totalPages", prs.getTotalPages());
        return "admin/user/show";
    }

    @GetMapping("/api/users")
    public List<User> getAllUsers() {
        return this.userServiceImpl.getAllUsers();
    }

    @RequestMapping("/admin/user/{id}")
    public String getUserDetailPage(Model model, @PathVariable long id) {
        Optional<User> user = this.userServiceImpl.getUserById(id);
        model.addAttribute("user", user.get());
        model.addAttribute("id", id);
        return "admin/user/detail";
    }

    @GetMapping("/admin/user/create") // GET
    public String getCreateUserPage(Model model) {
        model.addAttribute("newUser", new User());
        return "admin/user/create";
    }

    @PostMapping(value = "/admin/user/create")
    public String createUserPage(Model model,
            @ModelAttribute("newUser") @Valid User nguyenduy,
            BindingResult bindingResult,
            @RequestParam("nguyenduyFile") MultipartFile file) {

        List<FieldError> errors = bindingResult.getFieldErrors();
        for (FieldError error : errors) {
            System.out.println(error.getField() + " - " + error.getDefaultMessage());
        }

        if (bindingResult.hasErrors()) {
            return "admin/user/create";
        }
        String avatar = this.uploadServiceImpl.handleSaveUploadFile(file, "avatar");
        String hashPassword = this.passwordEncoder.encode(nguyenduy.getPassword());

        nguyenduy.setAvatar(avatar);
        nguyenduy.setPassword(hashPassword);
        nguyenduy.setRole(this.userServiceImpl.getRoleByName(nguyenduy.getRole().getName()));
        // save
        this.userServiceImpl.handleSaveUser(nguyenduy);
        return "redirect:/admin/user";
    }

    @RequestMapping("/admin/user/update/{id}") // GET
    public String getUpdateUserPage(Model model, @PathVariable long id) {
        Optional<User> currentUser = this.userServiceImpl.getUserById(id);
        List<Role> roles = this.roleRepository.findAll();
        model.addAttribute("roles", roles);
        model.addAttribute("newUser", currentUser);
        return "admin/user/update";
    }

    @PostMapping("/admin/user/update")
    public String postUpdateUser(Model model, @ModelAttribute("newUser") User nguyenduy) {
        Optional<User> currentUserOptional = this.userServiceImpl.getUserById(nguyenduy.getId());

        if (currentUserOptional.isPresent()) {
            User currentUser = currentUserOptional.get();
            currentUser.setAddress(nguyenduy.getAddress());
            currentUser.setFullName(nguyenduy.getFullName());
            currentUser.setPhone(nguyenduy.getPhone());
            Role role = this.roleRepository.findById(nguyenduy.getRole().getId()).get();
            currentUser.setRole(role);
            this.userServiceImpl.handleSaveUser(currentUser);
        }

        return "redirect:/admin/user";
    }

    @GetMapping("/admin/user/delete/{id}")
    public String getDeleteUserPage(Model model, @PathVariable long id) {
        model.addAttribute("id", id);
        // User user = new User();
        // user.setId(id);
        model.addAttribute("newUser", new User());
        return "admin/user/delete";
    }

    @PostMapping("/admin/user/delete")
    public String postDeleteUser(Model model, @ModelAttribute("newUser") User eric) {
        this.userServiceImpl.deleteAUser(eric.getId());
        return "redirect:/admin/user";
    }

    @PostMapping("/favorite-product")
    public String toggleFavoriteProduct(@RequestParam("productId") Long productId,
            @AuthenticationPrincipal UserDetails userDetails) {
        String email = userDetails.getUsername();

        User user = this.userServiceImpl.getUserByEmail(email);

        if (user != null) {
            if (this.userServiceImpl.isProductInFavorites(productId, user.getId())) {
                this.userServiceImpl.removeFavoriteProduct(productId, user.getId());
            } else {
                this.userServiceImpl.addFavoriteProduct(productId, user.getId());
            }
        }

        return "redirect:/product/" + productId;
    }

    @PostMapping("/profile/update")
    public String updateUserInfo(@RequestParam("fullName") String fullName,
            @RequestParam("phone") String phone,
            @RequestParam("address") String address,
            @RequestParam(value = "avatar", required = false) MultipartFile avatar,
            HttpServletRequest request) {
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("id") == null) {
            return "redirect:/login";
        }

        long id = (long) session.getAttribute("id");
        Optional<User> userOptional = userServiceImpl.getUserById(id);
        if (userOptional.isPresent()) {
            User user = userOptional.get();
            user.setFullName(fullName);
            user.setPhone(phone);
            user.setAddress(address);

            if (avatar != null && !avatar.isEmpty()) {
                String avatarFileName = this.uploadServiceImpl.handleSaveUploadFile(avatar, "avatar");
                user.setAvatar(avatarFileName);
            }

            this.userServiceImpl.handleSaveUser(user);

            return "redirect:/profile";
        }

        return "redirect:/login";
    }

    @MessageMapping("/user.addUser")
    @SendTo("/user/public")
    public User addUser(
            @Payload User user) {
        userServiceImpl.saveUser(user);
        return user;
    }

    @MessageMapping("/user.disconnectUser")
    public User disconnect(@Payload User user) {
        this.userServiceImpl.disconnect(user);
        return user;
    }

    @GetMapping("/users")
    public ResponseEntity<List<User>> findConnectedUsers() {
        return ResponseEntity.ok(this.userServiceImpl.findConnectedUsers());
    }

}
