package gefp.model.dao;

import gefp.model.Plan;

import java.util.List;

public interface PlanDao {
	
	Plan addPlan(Plan plan);
	
	List<Plan> getPlanList();
	
	Plan getPlanById(long planId);
	
	List<Plan> getPlansByDeptId(long deptId);
	
	
}
