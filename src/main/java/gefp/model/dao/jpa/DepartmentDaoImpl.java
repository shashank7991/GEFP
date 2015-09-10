package gefp.model.dao.jpa;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import gefp.model.Department;
import gefp.model.dao.DepartmentDao;

@Repository
public class DepartmentDaoImpl implements DepartmentDao {

	@PersistenceContext
	EntityManager entityManager;

	@Transactional
	@Override
	public void addDepartment(Department department) {
		entityManager.merge(department);
	}

	@Override
	public Department getDepartmentById(long departmentId) {
		return entityManager.find(Department.class, departmentId);
	}

	@Override
	public void updateDepartment(Department department) {
		entityManager.merge(department);
	}

	@Override
	public List<Department> getDepartmentList() {
		return entityManager.createQuery(
				"SELECT s FROM " + Department.class.getName()
						+ " s order by id").getResultList();
	}

}
