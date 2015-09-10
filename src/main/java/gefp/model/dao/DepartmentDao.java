package gefp.model.dao;

import gefp.model.Department;

import java.util.List;

public interface DepartmentDao {
	
	void addDepartment(Department department);
	
	void updateDepartment(Department department);
	
	List<Department> getDepartmentList();
	
	Department getDepartmentById(long departmentId);

}
