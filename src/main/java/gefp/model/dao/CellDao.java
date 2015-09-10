package gefp.model.dao;

import java.util.List;

import gefp.model.Cell;

public interface CellDao {

	public Cell addCell(Cell cell);
	
	public List<Cell> getCellsById(long planId);

}
