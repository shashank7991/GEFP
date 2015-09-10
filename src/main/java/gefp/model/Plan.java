package gefp.model;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name = "plans")
public class Plan {
	
	public Plan() {

	}
	
	@Id
	@Column
	@GeneratedValue(strategy = GenerationType.AUTO)
	Long planId;
	
	@Column
	String strName;

	@OneToMany(mappedBy = "objPlan")
	private List<Stage> lstStages = new ArrayList<Stage>();

	@ManyToOne
	@JoinColumn(name = "departmentId")
	Department objDepartment;

	@OneToMany(mappedBy = "objPlan")
	List<Runway> lstRunways;

	@OneToMany(mappedBy = "objPlan")
	Set<Cell> lstCells;

	@Column
	Date publishedDate;



	public String getStrName() {
		return strName;
	}

	public void setStrName(String strName) {
		this.strName = strName;
	}

	public List<Stage> getLstStages() {
		return lstStages;
	}

	public void setLstStages(List<Stage> lstStages) {
		this.lstStages = lstStages;
	}

	public Department getObjDepartment() {
		return objDepartment;
	}

	public void setObjDepartment(Department objDepartment) {
		this.objDepartment = objDepartment;
	}

	public List<Runway> getLstRunways() {
		return lstRunways;
	}

	public void setLstRunways(List<Runway> lstRunways) {
		this.lstRunways = lstRunways;
	}

	public Set<Cell> getLstCells() {
		return lstCells;
	}

	public void setLstCells(Set<Cell> lstCells) {
		this.lstCells = lstCells;
	}

		public Long getId() {
		return planId;
	}

	public void setId(Long id) {
		this.planId = id;
	}
	
	public Long getPlanId() {
		return planId;
	}

	public void setPlanId(Long planId) {
		this.planId = planId;
	}
	
	public Date getPublishedDate() {
		return publishedDate;
	}

	public void setPublishedDate(Date publishedDate) {
		this.publishedDate = publishedDate;
	}

}