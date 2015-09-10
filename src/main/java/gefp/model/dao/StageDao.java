package gefp.model.dao;

import gefp.model.Stage;

import java.util.List;

public interface StageDao {

	public void addStage(Stage stage);

	public void editStage(Stage stage);

	public void deleteStage(long stageId);

	public List<Stage> getStageList();

	public Stage getStageById(long stageId);

	public List<Stage> getStageListPlanId(long planId);

}
