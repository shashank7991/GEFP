package gefp.web.controller;

import gefp.model.Department;
import gefp.model.dao.DepartmentDao;

import org.springframework.beans.factory.annotation.Autowired;
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
import org.springframework.web.bind.support.SessionStatus;

@Controller
public class DepartmentController {
	@Autowired
	DepartmentDao deptDao;

	@RequestMapping(value = "/department/edit.html", method = RequestMethod.GET)
	public String edit(@RequestParam Integer id, ModelMap models) {
		models.put("department", deptDao.getDepartmentById(id));
		return "department/edit";
	}

	@RequestMapping(value = "/department/edit.html", method = RequestMethod.POST)
	public String edit(@ModelAttribute Department department,
			BindingResult bindingResult, SessionStatus sessionStatus) {

		deptDao.addDepartment(department);
		sessionStatus.setComplete();
		return "redirect:/department/list.html";
	}

	@RequestMapping("/department/{id}.html")
	public String view2(@PathVariable Integer id, ModelMap models) {
		return view1(id, models);
	}

	@RequestMapping(value = "/department/add.html", method = RequestMethod.GET)
	public String add(ModelMap models) {
		models.put("department", new Department());
		return "department/add";
	}

	@RequestMapping(value = "/department/add.html", method = RequestMethod.POST)
	public String add(@ModelAttribute Department department,
			BindingResult bindingResult) {

		deptDao.addDepartment(department);
		return "redirect:/department/list.html";
	}

	@RequestMapping("/department/view.html")
	public String view1(@RequestParam Integer departmentId, ModelMap models) {
		models.put("department", deptDao.getDepartmentById(departmentId));
		return "department/view";
	}

	@RequestMapping("/department/list.html")
	public String list(ModelMap models) {

		models.put("departments", deptDao.getDepartmentList());
		return "department/list";
	}

}
