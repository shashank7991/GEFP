package gefp.model.dao.jpa;

import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import gefp.model.Cell;
import gefp.model.Role;
import gefp.model.User;
import gefp.model.dao.RoleDao;
import org.springframework.stereotype.Repository;

@Repository
public class RoleDaoImpl implements RoleDao {

	@PersistenceContext
	EntityManager entityManager;

	
	
	
	
	@Override
	public List<Role> getRoleList() {
		return entityManager.createQuery(
				"SELECT s FROM " + Role.class.getName() + " s ")
				.getResultList();
	}





	@Override
	public Role getRoleById(long roleId) {
		List lst = entityManager.createQuery(
				"SELECT s FROM " + Role.class.getName() + " s WHERE roleId = '"
						+ roleId + "' ").getResultList();
		if (lst.size() != 1) {
			return null;
		} else {
			return (Role) lst.get(0);
		}
	}

}
