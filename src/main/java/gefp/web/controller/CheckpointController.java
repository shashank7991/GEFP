package gefp.web.controller;

import java.awt.PageAttributes.MediaType;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import gefp.model.Cell;
import gefp.model.Checkpoint;
import gefp.model.Runway;
import gefp.model.User;
import gefp.model.dao.CellDao;
import gefp.model.dao.CheckpointDao;
import gefp.model.dao.DepartmentDao;
import gefp.model.dao.PlanDao;
import gefp.model.dao.RunwayDao;
import gefp.model.dao.StageDao;
import gefp.model.dao.UserDao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.support.SessionStatus;

@Controller
public class CheckpointController {

	@Autowired
	CheckpointDao checkpointDao;

	@Autowired
	CellDao cellDao;

	@Autowired
	StageDao stageDao;

	@Autowired
	DepartmentDao deptDao;

	@Autowired
	RunwayDao runwayDao;

	@Autowired
	PlanDao planDao;

	@Autowired
	UserDao userDao;

	@RequestMapping(value = "/checkpoint/edit.html", method = RequestMethod.GET)
	public String edit(@RequestParam Integer checkpointId, ModelMap models) {
		Checkpoint checkpoint = checkpointDao.getCheckpointById(checkpointId);
		Integer planId = Integer.parseInt(checkpoint.getObjCell().getObjPlan()
				.getPlanId().toString());

		models.put("checkpoint", checkpointDao.getCheckpointById(checkpointId));
		models.put("planId", planId);
		models.put("stages", stageDao.getStageListPlanId(planId));
		models.put("runways", runwayDao.getRunwayListPlanId(planId));
		return "checkpoint/edit";
	}

	@RequestMapping(value = "/checkpoint/edit.html", method = RequestMethod.POST)
	public String edit(@ModelAttribute Checkpoint checkpoint,
			BindingResult bindingResult, Integer planId, Integer stageId,
			Integer runwayId) {

		Cell cellNew = new Cell();
		cellNew.setObjPlan(planDao.getPlanById(planId));
		cellNew.setObjRunway(runwayDao.getRunwayById(runwayId));
		cellNew.setObjStage(stageDao.getStageById(stageId));

		Cell cell = cellDao.addCell(cellNew);

		checkpoint.setObjCell(cell);
		;
		checkpointDao.addCheckpoint(checkpoint);
		return "redirect:/plan/view.html?planId=" + planId;
	}

	@RequestMapping("/checkpoint/list.html")
	public String list(ModelMap models) {
		models.put("checkpoint", checkpointDao.getCheckpointList());
		return "checkpoint/list";
	}

	@RequestMapping("/checkpoint/view.html")
	public String view1(@RequestParam Integer checkpointId, ModelMap models) {
		models.put("checkpoint", checkpointDao.getCheckpointById(checkpointId));
		return "checkpoint/view";
	}

	@RequestMapping(value = "/plan/addcheckpoint.html", method = RequestMethod.POST)
	public String add(@ModelAttribute Checkpoint checkpoint,
			BindingResult bindingResult, Integer planId, Integer stageId,
			Integer runwayId) {

		Cell cellNew = new Cell();
		cellNew.setObjPlan(planDao.getPlanById(planId));
		cellNew.setObjRunway(runwayDao.getRunwayById(runwayId));
		cellNew.setObjStage(stageDao.getStageById(stageId));

		Cell cell = cellDao.addCell(cellNew);

		checkpoint.setObjCell(cell);
		checkpointDao.addCheckpoint(checkpoint);
		return "redirect:/plan/view.html?planId=" + planId;
	}

	@RequestMapping("/checkpoint/{checkpointId}.html")
	public String view2(@PathVariable Integer checkpointId, ModelMap models) {
		return view1(checkpointId, models);

	}

	@RequestMapping(value = "/plan/addcheckpoint.html", method = RequestMethod.GET)
	public String add(@RequestParam Integer planId, ModelMap models) {
		models.put("checkpoint", new Checkpoint());
		models.put("planId", planId);
		models.put("stages", stageDao.getStageListPlanId(planId));
		models.put("runways", runwayDao.getRunwayListPlanId(planId));
		return "checkpoint/add";
	}

	@RequestMapping(value = "/addusercheckpoint.html", method = RequestMethod.POST)
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
