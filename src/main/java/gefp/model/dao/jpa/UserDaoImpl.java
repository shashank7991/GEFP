package gefp.model.dao.jpa;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import org.springframework.security.access.prepost.PostAuthorize;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import gefp.model.Role;
import gefp.model.User;
import gefp.model.dao.UserDao;

@Repository
public class UserDaoImpl implements UserDao {

	@PersistenceContext
	EntityManager entityManager;

	@Transactional
	@Override
	public User getUserData(String username, String password) {
		List lst = entityManager.createQuery(
				"from User WHERE  strusername='" + username
						+ "' AND strpassword='" + password + "'", User.class)
				.getResultList();
		if (lst.size() != 1) {
			return null;
		} else {
			return (User) lst.get(0);
		}

	}

	@Transactional
	@Override
	public User getUserByUsername(String username) {
		List lst = entityManager.createQuery(
				"SELECT c from " + User.class.getName()
						+ " c WHERE  username='" + username + "' ")
				.getResultList();
		if (lst.size() != 1) {
			return null;
		} else {
			return (User) lst.get(0);
		}

	}

	@Override
	public User getUserById(long userId) {
		return entityManager.find(User.class, userId);
	}

	@Override
	public List<Role> getRoles() {
		return entityManager.createQuery(
				"SELECT s FROM " + Role.class.getName() + " s ")
				.getResultList();

	}

	@Override
	public List<User> getUserList() {
		return entityManager.createQuery("from User order by id asc",
				User.class).getResultList();
	}

	@Transactional
	@Override
	// @PreAuthorize("hasRole('ROLE_ADMIN') or principal.username == #user.username")
	public User addUser(User user) {
		return entityManager.merge(user);
	}

	@Override
	public List<User> getStudent() {
		return entityManager
				.createQuery(
						"SELECT s FROM "
								+ User.class.getName()
								+ " s JOIN authorities a ON a.username = s.username WHERE a.authority='ROLE_STUDENT'")
				.getResultList();

	}

	@Override
	public List<User> searchUser(String keyword) {

		return entityManager.createQuery(
				"SELECT s FROM " + User.class.getName()
						+ " s WHERE roleid=3 AND (email LIKE '%" + keyword
						+ "%' OR cin LIKE '%" + keyword + "%' ) ")
				.getResultList();

	}

}
