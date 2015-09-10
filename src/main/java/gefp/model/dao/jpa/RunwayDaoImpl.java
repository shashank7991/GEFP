package gefp.model.dao.jpa;

import gefp.model.Runway;
import gefp.model.dao.RunwayDao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

@Repository
public class RunwayDaoImpl implements RunwayDao {

	@PersistenceContext
	EntityManager entityManager;

	@Override
	public List<Runway> getRunwayListPlanId(long planId) {
		return entityManager.createQuery(
				"SELECT s FROM " + Runway.class.getName()
						+ " s  WHERE planid = '" + planId
						+ "'order by runwayid").getResultList();

	}

	@Transactional
	@Override
	public void addRunway(Runway runway) {
		entityManager.merge(runway);
	}

	@Override
	public Runway getRunwayById(long runwayId) {
		return entityManager.find(Runway.class, runwayId);

	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Runway> getRunwayList() {
		return entityManager.createQuery(
				"SELECT s FROM " + Runway.class.getName()
						+ " s order by runwayid").getResultList();

	}

	@Transactional
	@Override
	public void editRunway(Runway runway) {
		entityManager.merge(runway);
	}

	@Transactional
	@Override
	public void deleteRunway(long runwayId) {
		entityManager.remove(getRunwayById(runwayId));
	}

}
