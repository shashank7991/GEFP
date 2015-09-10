package gefp.model.dao;

import java.util.List;

import gefp.model.Runway;

public interface RunwayDao {

	public void addRunway(Runway runway);

	public void editRunway(Runway runway);

	public void deleteRunway(long runway);

	public List<Runway> getRunwayList();

	public Runway getRunwayById(long runwayId);

	public List<Runway> getRunwayListPlanId(long planId);

}
