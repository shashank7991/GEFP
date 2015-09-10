package gefp.model.dao.jpa;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import gefp.model.Stage;
import gefp.model.dao.StageDao;

@Repository
public class StageDaoImpl implements StageDao {

	@PersistenceContext
	EntityManager entityManager;

	@Override
	public List<Stage> getStageListPlanId(long planId) {
		return entityManager.createQuery(
				"SELECT s FROM " + Stage.class.getName()
						+ " s  WHERE planid = '" + planId
						+ "' order by stageid").getResultList();
	}

	@Transactional
	@Override
	public void deleteStage(long stageId) {

		entityManager.remove(getStageById(stageId));
	}

	@Override
	public Stage getStageById(long stageId) {
		return entityManager.find(Stage.class, stageId);

	}

	@Transactional
	@Override
	public void addStage(Stage stage) {

		entityManager.merge(stage);
	}

	@Transactional
	@Override
	public void editStage(Stage stage) {

		entityManager.merge(stage);
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Stage> getStageList() {

		return entityManager.createQuery(
				"SELECT s FROM " + Stage.class.getName()
						+ " s order by stageid").getResultList();
	}

}
