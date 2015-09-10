package gefp.model;

import java.util.ArrayList;
import java.util.List;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity
@Table(name = "users")
public class User {
	public User() {

	}

	@Id
	@Column
	@GeneratedValue(strategy = GenerationType.AUTO)
	Long id;

	@Column
	String username;

	@Column
	String password;
	boolean enabled;

	
	@Column
	String email;
	
	@Column
	String cin;
//	@OneToMany(mappedBy = "objUser")
//	private List<Checkpoint> lstCheckpoint = new ArrayList<Checkpoint>();

	
	 
	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getCin() {
		return cin;
	}

	public void setCin(String cin) {
		this.cin = cin;
	}

	@ManyToMany
	@JoinTable(name = "stu_checkpoint", 
		joinColumns = { @JoinColumn(name = "id") }, 
		inverseJoinColumns = { @JoinColumn(name = "checkpointId") })
	private List<Checkpoint> lstofcheckpoints;
	
	public List<Checkpoint> getLstofcheckpoints() {
		return lstofcheckpoints;
	}

	public void setLstofcheckpoints(List<Checkpoint> lstofcheckpoints) {
		this.lstofcheckpoints = lstofcheckpoints;
	}

	@ManyToOne
	@JoinColumn(name = "roleId")
	Role objRole;

	@OneToOne
	@JoinColumn(name = "planId")
	Plan objPlan;

	@ManyToOne
	@JoinColumn(name = "deptId")
	Department objDepartment;

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	// public List<Checkpoint> getLstCheckpoint() {
	// return lstCheckpoint;
	// }
	//
	// public void setLstCheckpoint(List<Checkpoint> lstCheckpoint) {
	// this.lstCheckpoint = lstCheckpoint;
	// }

	public Role getObjRole() {
		return objRole;
	}

	public void setObjRole(Role objRole) {
		this.objRole = objRole;
	}

	public Plan getObjPlan() {
		return objPlan;
	}

	public void setObjPlan(Plan objPlan) {
		this.objPlan = objPlan;
	}

	public Department getObjDepartment() {
		return objDepartment;
	}

	public void setObjDepartment(Department objDepartment) {
		this.objDepartment = objDepartment;
	}

	public boolean isEnabled() {
		return enabled;
	}

	public void setEnabled(boolean enabled) {
		this.enabled = enabled;
	}

	
}