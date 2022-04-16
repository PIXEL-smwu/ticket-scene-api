package pixel.ticketscene.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class UserController {
    @Autowired
    UserService userService;

    @GetMapping("/user/{id}")
    public String getUserById(@RequestParam Long id) {
        return userService.selectUserById(id);
    }
}
