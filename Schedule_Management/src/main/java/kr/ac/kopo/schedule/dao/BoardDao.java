package kr.ac.kopo.schedule.dao;

import java.util.List;

import kr.ac.kopo.schedule.model.Board;
import kr.ac.kopo.schedule.model.SearchCriteria;

public interface BoardDao {

	List<Board> listSearch(SearchCriteria cri);

	int listSearchCount(SearchCriteria cri);

	void register(Board item);

	void delete(int bno);

	void update(Board item);

	Board getItem(int bno);

	Board read(int bno);

	void updateViewCnt(int bno);
}
