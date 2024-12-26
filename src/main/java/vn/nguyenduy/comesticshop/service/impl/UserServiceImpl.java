package vn.nguyenduy.comesticshop.service.impl;

import java.util.List;
import java.util.Optional;
import java.util.Random;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import vn.nguyenduy.comesticshop.domain.Product;
import vn.nguyenduy.comesticshop.domain.Role;
import vn.nguyenduy.comesticshop.domain.enums.Status;
import vn.nguyenduy.comesticshop.domain.User;
import vn.nguyenduy.comesticshop.domain.dto.RegisterDTO;
import vn.nguyenduy.comesticshop.repository.OrderRepository;
import vn.nguyenduy.comesticshop.repository.ProductRepository;
import vn.nguyenduy.comesticshop.repository.RoleRepository;
import vn.nguyenduy.comesticshop.repository.UserRepository;
import vn.nguyenduy.comesticshop.service.UserService;

@Service
public class UserServiceImpl implements UserService {

    @Autowired
    private UserRepository userRepository;
    @Autowired
    private RoleRepository roleRepository;
    @Autowired
    private ProductRepository productRepository;
    @Autowired
    private OrderRepository orderRepository;
    @Autowired
    private PasswordEncoder passwordEncoder;

    public String generateOTP() {
        Random random = new Random();
        int otp = 1000 + random.nextInt(9000);
        return String.valueOf(otp);
    }

    public List<User> getAllUsers() {
        return this.userRepository.findAll();
    }

    public Page<User> getAllUsers(Pageable pageable) {
        return this.userRepository.findAll(pageable);
    }

    public List<User> getAllUsersByEmail(String email) {
        return this.userRepository.findOneByEmail(email);
    }

    public User handleSaveUser(User user) {
        User newUser = this.userRepository.save(user);
        return newUser;
    }

    public Optional<User> getUserById(long id) {
        return this.userRepository.findById(id);
    }

    public void deleteAUser(long id) {
        this.userRepository.deleteById(id);
    }

    public Role getRoleByName(String name) {
        return this.roleRepository.findByName(name);
    }

    public User registerDTOtoUser(RegisterDTO registerDTO) {
        User user = new User();
        user.setFullName(registerDTO.getFirstName() + " " + registerDTO.getLastName());
        user.setEmail(registerDTO.getEmail());
        user.setPassword(registerDTO.getPassword());
        user.setActive(false);
        return user;
    }

    public boolean checkEmailExist(String email) {
        return this.userRepository.existsByEmail(email);
    }

    public User getUserByEmail(String email) {
        return this.userRepository.findByEmail(email);
    }

    public long countUsers() {
        return this.userRepository.count();
    }

    public long countProducts() {
        return this.productRepository.count();
    }

    public long countOrders() {
        return this.orderRepository.count();
    }

    public boolean isProductInFavorites(Long productId, Long userId) {
        Optional<User> user = this.userRepository.findById(userId);
        if (user.isEmpty()) {
            throw new RuntimeException("User not found");
        }
        return user.get().getFavorites().stream().anyMatch(product -> product.getId() == productId);
    }

    public void addFavoriteProduct(Long productId, long userId) {
        Optional<User> user = this.userRepository.findById(userId);

        if (user.isEmpty()) {
            throw new RuntimeException("User not found");
        }

        Product product = this.productRepository.findById(productId)
                .orElseThrow(() -> new RuntimeException("Product not found"));

        user.get().getFavorites().add(product);

        this.userRepository.save(user.get());
    }

    public void removeFavoriteProduct(Long productId, Long userId) {
        Optional<User> user = this.userRepository.findById(userId);
        if (user.isEmpty()) {
            throw new RuntimeException("User not found");
        }
        user.get().getFavorites().removeIf(product -> product.getId() == productId);
        this.userRepository.save(user.get());
    }

    public void updatePassword(String email, String newPassword) {
        User user = userRepository.findByEmail(email);
        String hashedPassword = this.passwordEncoder.encode(newPassword);
        user.setPassword(hashedPassword);
        userRepository.save(user);
    }

    public void disconnect(User user) {
        var storedUser = this.userRepository.findById(user.getId()).orElse(null);
        if (storedUser != null) {
            storedUser.setStatus(Status.OFFLINE);
            this.userRepository.save(user);
        }
    }

    public List<User> findConnectedUsers() {
        return this.userRepository.findAllByStatus(Status.ONLINE);
    }

    public void saveUser(User user) {
        user.setStatus(Status.ONLINE);
        this.userRepository.save(user);
    }

}
