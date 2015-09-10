package gefp.web.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.security.authentication.AnonymousAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

import gefp.model.Checkpoint;
import gefp.model.Runway;
import gefp.model.Stage;
import gefp.model.User;
import gefp.model.dao.CellDao;
import gefp.model.dao.CheckpointDao;
import gefp.model.dao.DepartmentDao;
import gefp.model.dao.PlanDao;
import gefp.model.dao.RoleDao;
import gefp.model.dao.RunwayDao;
import gefp.model.dao.StageDao;
import gefp.model.dao.UserDao;
import gefp.model.dao.jpa.CheckpointDaoImpl;
import gefp.web.validator.UserValidator;

@Controller
// @SessionAttributes("user")
@Scope("session")
public class UserController {

	@Autowired
	UserDao userDao;

	/*
	 * @Autowired UserValidator userValidator;
	 */

	@Autowired
	RoleDao roleDao;

	@Autowired
	DepartmentDao deptDao;

	@Autowired
	RunwayDao runwayDao;

	@Autowired
	StageDao stageDao;

	@Autowired
	CellDao cellDao;

	@Autowired
	PlanDao planDao;

	@Autowired
	CheckpointDao checkpointDao;

	@RequestMapping(value = "/user/edit.html", method = RequestMethod.GET)
	public String edit(@RequestParam Integer userId, ModelMap models) {
		models.put("user", userDao.getUserById(userId));
		return "user/edit";
	}

	@RequestMapping(value = "/user/edit.html", method = RequestMethod.POST)
	public String edit(@ModelAttribute User user, BindingResult bindingResult,
			SessionStatus sessionStatus) {
		/*
		 * userValidator.validate( user, bindingResult ); if(
		 * bindingResult.hasErrors() ) return "user/edit";
		 */

		userDao.addUser(user);
		sessionStatus.setComplete();
		return "redirect:list.html";
	}

	@RequestMapping(value = "/user/add.html", method = RequestMethod.GET)
	public String add(ModelMap models) {
		models.put("user", new User());
		models.put("userRoles", roleDao.getRoleList());
		models.put("department", deptDao.getDepartmentList());
		models.put("plans", planDao.getPlanList());

		return "user/add";
	}

	@RequestMapping(value = "/user/add.html", method = RequestMethod.POST)
	public String add(@ModelAttribute User user, BindingResult bindingResult) {
		/*
		 * userValidator.validate(user, bindingResult); if
		 * (bindingResult.hasErrors()) return "user/add";
		 */

		userDao.addUser(user);
		return "redirect:/user/list.html";
	}

	@RequestMapping("/user/{id}.html")
	public String view2(@PathVariable Integer id, ModelMap models) {
		return view1(id, models);
	}

	@RequestMapping("/user/view.html")
	public String view1(@RequestParam Integer id, ModelMap models) {
		models.put("user", userDao.getUserById(id));
		return "user/view";
	}

	@RequestMapping("/user/list.html")
	public String list(ModelMap models) {
		models.put("users", userDao.getUserList());
		return "user/list";
	}

	@RequestMapping(value = "/changePassword.html", method = RequestMethod.GET)
	public String changePassword(ModelMap models) {

		models.put("user", new User());
		return "user/password";
	}

	@RequestMapping(value = "/updatedepartment.html", method = RequestMethod.GET)
	public String changedepartment(@RequestParam Integer departmentId,
			ModelMap models) {

		UserDetails userDetails;
		Authentication auth = SecurityContextHolder.getContext()
				.getAuthentication();
		userDetails = (UserDetails) auth.getPrincipal();
		String username = userDetails.getUsername();
		User user = userDao.getUserByUsername(username);
		user.setObjDepartment(deptDao.getDepartmentById(departmentId));
		userDao.addUser(user);
		return "redirect:/";
	}

	@RequestMapping(value = "/changePassword.html", method = RequestMethod.POST)
	public String changePassword(@RequestParam String oldPassword,
			@RequestParam String newPassword,
			@RequestParam String confirmPassword, ModelMap models) {

		if (confirmPassword.equals(newPassword)) {

			UserDetails userDetails;
			Authentication auth = SecurityContextHolder.getContext()
					.getAuthentication();

			userDetails = (UserDetails) auth.getPrincipal();

			String username = userDetails.getUsername();
			User user = userDao.getUserByUsername(username);

			if (oldPassword.equals(user.getPassword())) {
				user.setPassword(newPassword);
				userDao.addUser(user);
				models.put("passwordChanged", "success");
				models.put("message",
						"<div class='success'>Password changed successfully.</div>");
				return "redirect:/j_spring_security_logout";
			} else {
				models.put("passwordChanged", "fail");
				models.put("message",
						"<div class='error'>Old password not match</div>");
			}

		} else {
			models.put("passwordChanged", "fail");
			models.put("message",
					"<div class='error'>Password and confirmpassword not match</div>");
		}

		return "user/password";
	}

	@RequestMapping(value = "/changedepartment.html", method = RequestMethod.GET)
	public String changedepartment(ModelMap models) {

		UserDetails userDetails;
		Authentication auth = SecurityContextHolder.getContext()
				.getAuthentication();
		userDetails = (UserDetails) auth.getPrincipal();
		String username = userDetails.getUsername();
		User user = userDao.getUserByUsername(username);

		models.put("cuurentDeptId", user.getObjDepartment().getId());
		models.put("departments", deptDao.getDepartmentList());

		userDao.addUser(user);
		return "user/departments";
	}

	@RequestMapping(value = "/plans.html", method = RequestMethod.GET)
	public String plans(ModelMap models) {

		UserDetails userDetails;
		Authentication auth = SecurityContextHolder.getContext()
				.getAuthentication();
		userDetails = (UserDetails) auth.getPrincipal();
		String username = userDetails.getUsername();
		User user = userDao.getUserByUsername(username);

		long id = user.getId();
		long planId = user.getObjDepartment().getCurrentPlan();

		models.put("plan", planDao.getPlanById(planId));

		List<Runway> runways = runwayDao.getRunwayListPlanId(planId);
		List<Stage> stages = stageDao.getStageListPlanId(planId);

		// user.setLstofcheckpoints();

		models.put("RunwayEntries", runways);
		models.put("stages", stages);
		models.put("userid", id);
		models.put("user", user);
		models.put("checkPoints", cellDao.getCellsById(planId));
		return "user/plans";
	}

}
