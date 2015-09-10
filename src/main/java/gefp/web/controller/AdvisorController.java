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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

import gefp.model.Checkpoint;
import gefp.model.Role;
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
@Controller
// @SessionAttributes("user")
@Scope("session")
public class AdvisorController {

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

	@RequestMapping(value = "/student/list.html", method = RequestMethod.GET)
	public String list(ModelMap models) {
		Role role = roleDao.getRoleById(3);
		
		models.put("users", role.getLstUser());
		return "student/list";
	}
	
	@RequestMapping(value = "/student/view_plan.html", method = RequestMethod.GET)
	public String view_plan(@RequestParam Integer id,  ModelMap models) {
		
		User user = userDao.getUserById(id);
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
		return "student/plan";
	}
	
	@RequestMapping(value = "/student/list.html", method = RequestMethod.POST)
	public String search(@RequestParam String keyWord , ModelMap models) {
		
		models.put("users", userDao.searchUser(keyWord));
		return "student/search";
	}
	
	
	//my new
	@RequestMapping(value = "/student/addusercheckpoint.html", method = RequestMethod.POST)
	public @ResponseBody String getAjaxData(
			@RequestParam boolean checkpoint_operation,
			@RequestParam long userid, @RequestParam long checkpointid) {

		System.out.print(userid);

		User objUser = userDao.getUserById(userid);
		Checkpoint objCheckpoints = checkpointDao
				.getCheckpointById(checkpointid);

		List<Checkpoint> lstcheckpoints = objUser.getLstofcheckpoints();
		if (checkpoint_operation)
			lstcheckpoints.add(objCheckpoints);
		else if (!checkpoint_operation)
			lstcheckpoints.remove(objCheckpoints);
		objUser.setLstofcheckpoints(lstcheckpoints);
		userDao.addUser(objUser);

		return "";
	}

}
