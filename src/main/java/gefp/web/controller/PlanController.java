package gefp.web.controller;

import java.util.ArrayList;
import java.util.List;

import gefp.model.Cell;
import gefp.model.Checkpoint;
import gefp.model.Department;
import gefp.model.Plan;
import gefp.model.Runway;
import gefp.model.Stage;
import gefp.model.dao.CellDao;
import gefp.model.dao.DepartmentDao;
import gefp.model.dao.PlanDao;
import gefp.model.dao.RunwayDao;
import gefp.model.dao.StageDao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
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
@Scope("session")
public class PlanController {

	@Autowired
	PlanDao planDao;

	@Autowired
	StageDao stageDao;

	@Autowired
	CellDao cellDao;

	@Autowired
	DepartmentDao deptDao;

	@Autowired
	RunwayDao runwayDao;

	@RequestMapping("/plan/list.html")
	public String list(ModelMap models) {
		models.put("plans", planDao.getPlanList());
		return "plan/list";
	}

	@RequestMapping(value = "/plan/edit.html", method = RequestMethod.GET)
	public String edit(@RequestParam Integer planId, ModelMap models) {
		models.put("plan", planDao.getPlanById(planId));
		return "plan/edit";
	}

	@RequestMapping(value = "/plan/edit.html", method = RequestMethod.POST)
	public String edit(@ModelAttribute Plan plan, BindingResult bindingResult,
			Integer departmentId, Integer currentPlan) {

		plan.setObjDepartment(deptDao.getDepartmentById(departmentId));
		Plan plan1 = planDao.addPlan(plan);
		if (currentPlan != null) {
			if (currentPlan == 1) {
				Department dept = deptDao.getDepartmentById(departmentId);
				dept.setCurrentPlan(plan1.getPlanId());
				deptDao.addDepartment(dept);
			}
		}
		return "redirect:/plan/list.html?departmentId=" + departmentId;
	}

	@RequestMapping(value = "/plan/list.html", method = RequestMethod.GET)
	public String list(@RequestParam Integer departmentId, ModelMap models) {
		models.put("plans", deptDao.getDepartmentById(departmentId)
				.getLstPlans());
		models.put("department", deptDao.getDepartmentById(departmentId));
		return "plan/list";
	}

	@RequestMapping("/plan/{id}.html")
	public String view2(@PathVariable Integer id, ModelMap models) {
		return view1(id, models);
	}

	@RequestMapping(value = "/plan/add.html", method = RequestMethod.GET)
	public String add(@RequestParam Integer departmentId, ModelMap models) {
		models.put("department", deptDao.getDepartmentById(departmentId));
		Plan plan = new Plan();
		plan.setObjDepartment(deptDao.getDepartmentById(departmentId));
		models.put("plan", plan);
		return "plan/add";
	}

	@RequestMapping(value = "/plan/add.html", method = RequestMethod.POST)
	public String add(@ModelAttribute Plan plan, BindingResult bindingResult,
			Integer departmentId, Integer currentPlan) {

		plan.setObjDepartment(deptDao.getDepartmentById(departmentId));
		Plan plan1 = planDao.addPlan(plan);

		if (currentPlan != null) {
			if (currentPlan == 1) {
				Department dept = deptDao.getDepartmentById(departmentId);
				dept.setCurrentPlan(plan1.getPlanId());
				deptDao.addDepartment(dept);
			}
		}

		return "redirect:/plan/list.html?departmentId=" + departmentId;
	}

	@RequestMapping("/plan/view.html")
	public String view1(@RequestParam Integer planId, ModelMap models) {
		
		models.put("plan", planDao.getPlanById(planId));

		List<Runway> runways = runwayDao.getRunwayListPlanId(planId);
		List<Stage> stages = stageDao.getStageListPlanId(planId);

		models.put("RunwayEntries", runways);
		models.put("stages", stages);
		models.put("checkPoints", cellDao.getCellsById(planId));
		return "plan/view";
	}

}
