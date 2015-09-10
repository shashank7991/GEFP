package gefp.model;

import java.util.List;

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
import javax.persistence.Table;

@Entity
@Table(name = "checkpoints")
public class Checkpoint {
	
	public Checkpoint() {

	}

	@Id
	@Column
	@GeneratedValue(strategy = GenerationType.AUTO)
	Long checkpointId;

	@Column
	String strDescription;

	
//	@ManyToOne
//	@JoinColumn(name = "id")
//	User objUser;
	
	@ManyToMany(mappedBy = "lstofcheckpoints")
	private List<User> lstofusers;

	

	public List<User> getLstofusers() {
		return lstofusers;
	}

	public void setLstofusers(List<User> lstofusers) {
		this.lstofusers = lstofusers;
	}

	public Long getCheckpointId() {
		return checkpointId;
	}

	public void setCheckpointId(Long checkpointId) {
		this.checkpointId = checkpointId;
	}

	public String getStrDescription() {
		return strDescription;
	}

	public void setStrDescription(String strDescription) {
		this.strDescription = strDescription;
	}

//	public User getObjUser() {
//		return objUser;
//	}
//
//	public void setObjUser(User objUser) {
//		this.objUser = objUser;
//	}

	public Cell getObjCell() {
		return objCell;
	}

	public void setObjCell(Cell objCell) {
		this.objCell = objCell;
	}

	@ManyToOne
	@JoinColumn(name = "cellId")
	Cell objCell;
	
}