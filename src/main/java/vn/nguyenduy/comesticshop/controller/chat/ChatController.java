package vn.nguyenduy.comesticshop.controller.chat;

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.handler.annotation.Payload;
import org.springframework.messaging.handler.annotation.SendTo;
import org.springframework.messaging.simp.SimpMessageHeaderAccessor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import vn.nguyenduy.comesticshop.domain.Shop;
import vn.nguyenduy.comesticshop.domain.User;
import vn.nguyenduy.comesticshop.domain.chat.ChatMessage;
import vn.nguyenduy.comesticshop.service.impl.ShopServiceImpl;
import vn.nguyenduy.comesticshop.service.impl.UserServiceImpl;

@Controller
public class ChatController {

    @Autowired
    private UserServiceImpl userServiceImpl;

    @Autowired
    private ShopServiceImpl shopServiceImpl;

    /**
     * Phương thức kiểm tra người dùng và xác định tên cửa hàng trước khi hiển thị giao diện chat.
     * @param request HttpServletRequest để lấy session của người dùng
     * @param model Model để truyền dữ liệu vào view
     * @return Trang chat hoặc chuyển hướng tới trang đăng nhập nếu người dùng chưa đăng nhập
     */
    @GetMapping("/chat")
    public String getChatPage(HttpServletRequest request, Model model) {
        HttpSession session = request.getSession(false);
        
        // Kiểm tra nếu session không tồn tại hoặc id người dùng không có trong session
        if (session == null || session.getAttribute("id") == null) {
            return "redirect:/login";
        }

        // Lấy id người dùng từ session
        long id = (long) session.getAttribute("id");

        // Tìm người dùng và xác định cửa hàng của người dùng nếu có
        Optional<User> user = userServiceImpl.getUserById(id);
        user.ifPresent(u -> {
            Shop shop = shopServiceImpl.findByOwner(u);
            // Nếu người dùng là chủ cửa hàng, hiển thị tên cửa hàng, nếu không hiển thị "Admin"
            model.addAttribute("username", shop != null ? shop.getName() : "Admin");
        });

        return "client/chat/chat";
    }

    /**
     * Xử lý khi người dùng gửi tin nhắn
     * @param chatMessage Tin nhắn người dùng gửi
     * @return Tin nhắn đã gửi
     */
    @MessageMapping("/chat.sendMessage")
    @SendTo("/topic/public")
    public ChatMessage sendMessage(@Payload ChatMessage chatMessage) {
        return chatMessage;
    }

    /**
     * Xử lý khi người dùng tham gia vào phòng chat
     * @param chatMessage Tin nhắn chứa thông tin người dùng tham gia
     * @param headerAccessor Đối tượng chứa thông tin session WebSocket
     * @return Tin nhắn thông báo người dùng đã tham gia
     */
    @MessageMapping("/chat.addUser")
    @SendTo("/topic/public")
    public ChatMessage addUser(@Payload ChatMessage chatMessage, SimpMessageHeaderAccessor headerAccessor) {
        // Thêm tên người dùng vào session WebSocket
        headerAccessor.getSessionAttributes().put("username", chatMessage.getSender());
        return chatMessage;
    }
}
