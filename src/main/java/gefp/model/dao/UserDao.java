package gefp.model.dao;

import java.util.List;

import gefp.model.Role;
import gefp.model.User;

public interface UserDao {

	User addUser(User user);

	User getUserById(long id);
	
	User getUserByUsername(String username);

	List<User> getUserList();

	List<User> getStudent();

	List<Role> getRoles();
	
	User getUserData(String username, String password);
	
	List<User> searchUser(String keyword);
	
	
}
