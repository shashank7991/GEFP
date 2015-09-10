package gefp.web.controller;

import gefp.model.Runway;
import gefp.model.dao.PlanDao;
import gefp.model.dao.RunwayDao;

import org.springframework.beans.factory.annotation.Autowired;
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
public class RunwayController {

	@Autowired
	RunwayDao runwayDao;

	@Autowired
	PlanDao planDao;

	@RequestMapping(value = "/runway/edit.html", method = RequestMethod.GET)
	public String edit(@RequestParam Integer runwayId, ModelMap models) {
		models.put("runway", runwayDao.getRunwayById(runwayId));
		return "runway/edit";
	}

	@RequestMapping(value = "/runway/edit.html", method = RequestMethod.POST)
	public String edit(@ModelAttribute Runway runway,
			BindingResult bindingResult, SessionStatus sessionStatus) {

		runwayDao.addRunway(runway);
		sessionStatus.setComplete();
		return "redirect:/runway/list.html";
	}

	@RequestMapping(value = "/plan/addrunway.html", method = RequestMethod.GET)
	public String add(@RequestParam Integer planId, ModelMap models) {
		models.put("planId", planId);
		models.put("runway", new Runway());
		return "runway/add";
	}

	@RequestMapping(value = "/plan/addrunway.html", method = RequestMethod.POST)
	public String add(@ModelAttribute Runway runway,
			BindingResult bindingResult, Integer planId) {

		runway.setObjPlan(planDao.getPlanById(planId));
		runwayDao.addRunway(runway);
		return "redirect:/plan/view.html?planId=" + planId;
	}

	@RequestMapping("/runway/view.html")
	public String view1(@RequestParam Integer runwayId, ModelMap models) {
		models.put("runway", runwayDao.getRunwayById(runwayId));
		return "runway/view";
	}

	@RequestMapping("/runway/{runwayId}.html")
	public String view2(@PathVariable Integer runwayId, ModelMap models) {
		return view1(runwayId, models);
	}

	@RequestMapping("/runway/list.html")
	public String list(ModelMap models) {
		models.put("runway", runwayDao.getRunwayList());
		return "runway/list";
	}

}
