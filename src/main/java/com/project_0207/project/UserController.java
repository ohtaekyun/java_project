package com.project_0207.project;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class UserController {
    
    @Autowired
    private UserRepository userRepository;

    // "user"라는 이름으로 새로운 'User' 객체를 생성하여 모델에 추가
    @GetMapping("/register")
    public String showRegistrationForm(Model model) {
        model.addAttribute("user", new User());  
        return "register";
    }  

    // 'user' 객체를 MongoDB 데이터베이스에 저장
    @PostMapping("/register")
    public String registerUser(User user, Model model) {          
        User existingUser1 = userRepository.findByUserid(user.getUserid());
        model.addAttribute("existingUser1", existingUser1);
        if (existingUser1==null) {
            userRepository.save(user);  
            return "/login";
        } else {
            return "/register";
        }        
    }
    
    @PostMapping("/checkDupId")
    @ResponseBody
    public String doCheckDupId(@RequestParam String userid) {        
        boolean isDup = userRepository.checkDupId(userid);
        return Boolean.toString(isDup);
    }

    @PostMapping("/checkDupNick")
    @ResponseBody
    public String doCheckDupNick(@RequestParam String nickname) {        
        boolean isDup = userRepository.checkDupNick(nickname);
        return Boolean.toString(isDup);
    }

    // 로그인 페이지
    @GetMapping("/login")
    public String showLoginForm() {
        return "login";
    }

    // 로그인시 등록되어있는 사용자인지 확인
    @PostMapping("/login")
    public String loginUser(User user) {
        User existingUser = userRepository.findByUserid(user.getUserid());
        if (existingUser != null && existingUser.getPassword().equals(user.getPassword())) {
            return "redirect:/home";
        } else {
            // 비밀번호가 다를 경우 alert를 띄우는 코드
            return "login";
        }
    }
    
    // 홈페이지
    @GetMapping("/home")
    public String showHomePage() {
        return "home";
    }
    @GetMapping("/")
    public String gotoHome() {
        return "home";
    }
    @GetMapping("/babo1")
    public String babo1Page() {
        return "babo1";
    }
    @GetMapping("/babo2")
    public String babo2Page() {
        return "babo2";
    }
    @GetMapping("/us_chart")
    public String getlist() {
        return "us_chart";
    }
    @GetMapping("/kor_chart")
    public String getKorChart() {
        return "kor_chart";
    }

    // 회원정보 목록 출력
    @GetMapping("/users")
    public String listUsers(Model model) {
        List<User> userList = userRepository.findAll();
        model.addAttribute("userList", userList);
        return "users";
    }
}