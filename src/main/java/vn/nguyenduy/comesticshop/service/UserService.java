package vn.nguyenduy.comesticshop.service;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import vn.nguyenduy.comesticshop.domain.Product;
import vn.nguyenduy.comesticshop.domain.Role;
import vn.nguyenduy.comesticshop.domain.User;
import vn.nguyenduy.comesticshop.domain.dto.RegisterDTO;

import java.util.List;
import java.util.Optional;

public interface UserService {

  String generateOTP();

  List<User> getAllUsers();

  Page<User> getAllUsers(Pageable pageable);

  List<User> getAllUsersByEmail(String email);

  User handleSaveUser(User user);

  Optional<User> getUserById(long id);

  void deleteAUser(long id);

  Role getRoleByName(String name);

  User registerDTOtoUser(RegisterDTO registerDTO);

  boolean checkEmailExist(String email);

  User getUserByEmail(String email);

  long countUsers();

  long countProducts();

  long countOrders();

  boolean isProductInFavorites(Long productId, Long userId);

  void addFavoriteProduct(Long productId, long userId);

  void removeFavoriteProduct(Long productId, Long userId);

  void updatePassword(String email, String newPassword);

  void disconnect(User user);

  List<User> findConnectedUsers();

  void saveUser(User user);
}
