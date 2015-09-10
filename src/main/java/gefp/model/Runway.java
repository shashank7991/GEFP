package gefp.model;

import java.util.List;

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
@Table(name = "runways")
public class Runway {

	public Runway() {

	}

	@Id
	@Column
	@GeneratedValue(strategy = GenerationType.AUTO)
	Long runwayId;

	@Column
	String strName;

	@OneToMany(mappedBy = "objRunway")
	List<Cell> lstCells;

	@ManyToOne
	@JoinColumn(name = "planId")
	Plan objPlan;

	public Long getRunwayId() {
		return runwayId;
	}

	public void setRunwayId(Long runwayId) {
		this.runwayId = runwayId;
	}

	public String getStrName() {
		return strName;
	}

	public void setStrName(String strName) {
		this.strName = strName;
	}

	public Plan getObjPlan() {
		return objPlan;
	}

	public void setObjPlan(Plan objPlan) {
		this.objPlan = objPlan;
	}

	public List<Cell> getLstCells() {
		return lstCells;
	}

	public void setLstCells(List<Cell> lstCells) {
		this.lstCells = lstCells;
	}

}