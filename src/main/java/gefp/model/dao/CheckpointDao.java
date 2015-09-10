package gefp.model.dao;

import gefp.model.Checkpoint;

import java.util.List;

public interface CheckpointDao {
	
	public void addCheckpoint(Checkpoint checkpoint);

	public void editCheckpoint(Checkpoint checkpoint);

	public void deleteCheckpoint(long checkpointId);

	public List<Checkpoint> getCheckpointList();

	public Checkpoint getCheckpointById(long checkpointId);

}
