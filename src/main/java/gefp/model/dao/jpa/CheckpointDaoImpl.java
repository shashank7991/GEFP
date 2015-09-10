package gefp.model.dao.jpa;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import gefp.model.Checkpoint;
import gefp.model.dao.CheckpointDao;

@Repository
public class CheckpointDaoImpl implements CheckpointDao {

	@PersistenceContext
	EntityManager entityManager;

	@Override
	public List<Checkpoint> getCheckpointList() {
		return entityManager.createQuery(
				"SELECT s FROM " + Checkpoint.class.getName()
						+ " s order by id").getResultList();
	}

	@Transactional
	@Override
	public void editCheckpoint(Checkpoint checkpoint) {
		entityManager.merge(checkpoint);
	}

	@Transactional
	@Override
	public void deleteCheckpoint(long checkpointId) {
		entityManager.remove(getCheckpointById(checkpointId));
	}

	@Override
	public Checkpoint getCheckpointById(long checkpointId) {
		return entityManager.find(Checkpoint.class, checkpointId);
	}

	@Transactional
	@Override
	public void addCheckpoint(Checkpoint checkpoint) {
		entityManager.merge(checkpoint);
	}

}
