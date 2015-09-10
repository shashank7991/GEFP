package gefp.model.dao;

import gefp.model.Role;

import java.util.List;

public interface RoleDao {
	
	List<Role> getRoleList();
	Role getRoleById(long roleId);
	
}
