package gefp.model;

import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name = "departments")
public class Department {

	public Department() {

	}

	@Id
	@Column
	@GeneratedValue(strategy = GenerationType.AUTO)
	Long id;

	@Column
	String strName;

	@Column
	long currentPlan;

	@OneToMany(mappedBy = "objDepartment")
	List<Plan> lstPlans;

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public long getCurrentPlan() {
		return currentPlan;
	}

	public void setCurrentPlan(long currentPlan) {
		this.currentPlan = currentPlan;
	}

	public String getStrName() {
		return strName;
	}

	public void setStrName(String strName) {
		this.strName = strName;
	}

	public List<Plan> getLstPlans() {
		return lstPlans;
	}

	public void setLstPlans(List<Plan> lstPlans) {
		this.lstPlans = lstPlans;
	}

}