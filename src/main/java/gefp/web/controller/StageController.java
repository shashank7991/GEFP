package gefp.web.controller;

import gefp.model.Stage;
import gefp.model.dao.PlanDao;
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
public class StageController {

	@Autowired
	StageDao stageDao;

	@Autowired
	PlanDao planDao;

	@RequestMapping(value = "/stage/edit.html", method = RequestMethod.GET)
	public String edit(@RequestParam Integer stageId, ModelMap models) {
		models.put("stage", stageDao.getStageById(stageId));
		return "stage/edit";
	}

	@RequestMapping(value = "/stage/edit.html", method = RequestMethod.POST)
	public String edit(@ModelAttribute Stage stage,
			BindingResult bindingResult, SessionStatus sessionStatus) {

		stageDao.addStage(stage);
		sessionStatus.setComplete();
		return "redirect:/stage/list.html";
	}

	@RequestMapping(value = "/plan/addstage.html", method = RequestMethod.GET)
	public String add(ModelMap models) {
		models.put("stage", new Stage());
		return "stage/add";
	}

	@RequestMapping(value = "/plan/addstage.html", method = RequestMethod.POST)
	public String add(@ModelAttribute Stage stage, BindingResult bindingResult,
			Integer planId) {
		stage.setObjPlan(planDao.getPlanById(planId));
		stageDao.addStage(stage);
		return "redirect:/plan/view.html?planId=" + planId;
	}

	@RequestMapping("/stage/list.html")
	public String list(ModelMap models) {
		models.put("stage", stageDao.getStageList());
		return "stage/list";
	}

	@RequestMapping("/stage/{stageId}.html")
	public String view2(@PathVariable Integer stageId, ModelMap models) {
		return view1(stageId, models);
	}

	@RequestMapping("/stage/view.html")
	public String view1(@RequestParam Integer stageId, ModelMap models) {
		models.put("stage", stageDao.getStageById(stageId));
		return "stage/view";
	}

}
