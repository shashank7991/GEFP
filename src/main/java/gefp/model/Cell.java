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
@Table(name = "cells")
public class Cell {


	public Cell() {

	}
	
	@Id
	@Column
	@GeneratedValue(strategy = GenerationType.AUTO)
	Long cellId;

	
	@ManyToOne
	@JoinColumn(name = "runwayId")
	Runway objRunway;

	@ManyToOne
	@JoinColumn(name = "stageId")
	Stage objStage;

	@ManyToOne
	@JoinColumn(name = "planId")
	Plan objPlan;

	public Plan getObjPlan() {
		return objPlan;
	}

	public void setObjPlan(Plan objPlan) {
		this.objPlan = objPlan;
	}

	public Runway getObjRunway() {
		return objRunway;
	}

	public void setObjRunway(Runway objRunway) {
		this.objRunway = objRunway;
	}

	public Stage getObjStage() {
		return objStage;
	}

	public void setObjStage(Stage objStage) {
		this.objStage = objStage;
	}

	public Long getCellId() {
		return cellId;
	}

	public void setCellId(Long cellId) {
		this.cellId = cellId;
	}

	public List<Checkpoint> getLstcheckpoints() {
		return lstcheckpoints;
	}

	public void setLstcheckpoints(List<Checkpoint> lstcheckpoints) {
		this.lstcheckpoints = lstcheckpoints;
	}

	@OneToMany(mappedBy = "objCell")
	List<Checkpoint> lstcheckpoints;

	public Long getId() {
		return cellId;
	}

	public void setId(Long id) {
		this.cellId = id;
	}


	public List<Checkpoint> getCheckPoints(long stageId, long runwayId) {
		return null;
	}
}