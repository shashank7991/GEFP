package gefp.web.controller;

import gefp.model.User;
import gefp.model.dao.UserDao;
import gefp.web.validator.UserValidator;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

@Controller
@SessionAttributes("usersession")
public class HomeController {

	@Autowired
	UserDao userDao;

	/*
	 * @Autowired UserValidator userValidator;
	 */
	@RequestMapping(value = "/login.html", method = RequestMethod.POST)
	public String add(@ModelAttribute("usersession") User user,
			BindingResult bindingResult, SessionStatus status) {
		/*
		 * userValidator.validate(user, bindingResult); if
		 * (bindingResult.hasErrors()) return "login";
		 * 
		 * User user1 = userDao .getUserData(user.getUsername(),
		 * user.getPassword()); status.setComplete(); userDao.addUser(user);
		 */
		return "redirect:/login.html";
	}

	@RequestMapping(value = "/login.html", method = RequestMethod.GET)
	public String add(ModelMap models) {
		models.put("user", new User());
		return "login";
	}

}
