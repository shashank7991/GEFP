package gefp.model.dao.jpa;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import gefp.model.Plan;
import gefp.model.dao.PlanDao;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

@Repository
public class PlanDaoImpl implements PlanDao {

	@PersistenceContext
	EntityManager entityManager;

	@Override
	public Plan getPlanById(long planId) {
		return entityManager.find(Plan.class, planId);
	}

	@Override
	public List<Plan> getPlansByDeptId(long deptId) {
		return entityManager.createQuery(
				"SELECT s FROM " + Plan.class.getName()
						+ " s  WHERE departmentid = '" + deptId
						+ "' order by planid").getResultList();
	}

	@Override
	@Transactional
	public Plan addPlan(Plan plan) {
		return entityManager.merge(plan);

	}

	@Override
	public List<Plan> getPlanList() {
		return entityManager.createQuery(
				"SELECT s FROM " + Plan.class.getName() + " s order by planid")
				.getResultList();
	}

}
