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
@Table(name = "stages")
public class Stage {

	public Stage() {

	}
	
	@Id
	@Column
	@GeneratedValue(strategy = GenerationType.AUTO)
	Long stageId;

	@Column
	String strName;

	
	@OneToMany(mappedBy = "objStage")
	List<Cell> lstCells;

	@ManyToOne
	@JoinColumn(name = "planId")
	private Plan objPlan;

	public String getStrName() {
		return strName;
	}

	public void setStrName(String strName) {
		this.strName = strName;
	}

	public List<Cell> getLstCells() {
		return lstCells;
	}

	public void setLstCells(List<Cell> lstCells) {
		this.lstCells = lstCells;
	}

	public Plan getObjPlan() {
		return objPlan;
	}

	public void setObjPlan(Plan objPlan) {
		this.objPlan = objPlan;
	}

	public Long getStageId() {
		return stageId;
	}

	public void setStageId(Long stageId) {
		this.stageId = stageId;
	}

	
}