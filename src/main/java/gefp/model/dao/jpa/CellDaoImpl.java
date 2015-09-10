package gefp.model.dao.jpa;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;
import gefp.model.Cell;
import gefp.model.dao.CellDao;

@Repository
public class CellDaoImpl implements CellDao {

	@PersistenceContext
	EntityManager entityManager;

	@Override
	public List<Cell> getCellsById(long planId) {
		return entityManager.createQuery(
				"SELECT s FROM " + Cell.class.getName() + " s WHERE planid = '"
						+ planId + "' ").getResultList();
	}

	@Transactional
	@Override
	public Cell addCell(Cell cell) {

		return entityManager.merge(cell);

	}

}
