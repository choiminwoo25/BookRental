package daelim.book.rental.user.account;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

@Controller
@RequestMapping("/user/account")
public class UserAccountController {

    @Autowired
    private UserAccountDao userAccountDao;

    @RequestMapping(value = "/createAccountForm", method = RequestMethod.GET)
    public String createAccountForm(Model model) {
        model.addAttribute("userAccountVo", new UserAccountVo());
        return "user/member/create_account_form";
    }

    @RequestMapping(value = "/createAccountForm", method = RequestMethod.POST)
    public String createAccount(@Valid @ModelAttribute UserAccountVo userAccountVo,
                                BindingResult bindingResult, Model model) {
        if (!bindingResult.hasFieldErrors("id") && userAccountDao.existUser(userAccountVo.getId())) {
            bindingResult.rejectValue("id", "duplicate.id", "이미 사용 중인 아이디입니다.");
        }

        if (bindingResult.hasErrors()) {
            return "user/member/create_account_form";
        }

        int result = userAccountDao.insertUser(userAccountVo);
        if (result > 0) {
            return "user/member/create_account_ok";
        } else {
            model.addAttribute("errorMsg", "회원가입에 실패했습니다. 다시 시도해주세요.");
            return "user/member/create_account_form";
        }
    }

    @RequestMapping("/loginForm")
    public String loginForm() {
        return "user/member/login_form";
    }

    @RequestMapping(value = "/doLogin", method = RequestMethod.POST)
    public String doLogin(UserAccountVo userAccountVo, Model model, HttpSession session) {
        UserAccountVo loginedUser = userAccountDao.selectUser(userAccountVo);
        if (loginedUser == null) {
            return "user/member/login_ng";
        }
        session.setAttribute("loginedUser", loginedUser);
        return "user/member/login_ok";
    }

    @RequestMapping("/logout")
    public String logout(HttpSession session) {
        session.invalidate();
        return "redirect:/user/";
    }

    @RequestMapping("/findPasswordForm")
    public String findPasswordForm() {
        return "user/member/find_password_form";
    }

    @RequestMapping("/modifyAccountForm")
    public String modifyAccountForm(HttpSession session, Model model) {
        UserAccountVo loginedUser = (UserAccountVo) session.getAttribute("loginedUser");
        if (loginedUser == null) {
            return "redirect:/user/account/loginForm";
        }
        model.addAttribute("userAccountVo", loginedUser);
        return "user/member/modify_account_form";
    }

    @RequestMapping(value = "/modifyAccount", method = RequestMethod.POST)
    public String modifyAccount(UserAccountVo userAccountVo, HttpSession session) {
        UserAccountVo loginedUser = (UserAccountVo) session.getAttribute("loginedUser");
        if (loginedUser == null) {
            return "redirect:/user/account/loginForm";
        }
        userAccountVo.setId(loginedUser.getId());
        int result = userAccountDao.updateUser(userAccountVo);
        if (result > 0) {
            loginedUser.setName(userAccountVo.getName());
            loginedUser.setGender(userAccountVo.getGender());
            loginedUser.setEmail(userAccountVo.getEmail());
            loginedUser.setPhone(userAccountVo.getPhone());
            session.setAttribute("loginedUser", loginedUser);
            return "user/member/modify_account_ok";
        }
        return "user/member/modify_account_form";
    }
}
