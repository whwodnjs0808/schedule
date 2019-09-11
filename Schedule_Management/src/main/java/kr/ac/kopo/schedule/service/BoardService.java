package kr.ac.kopo.schedule.service;

import java.util.List;

import kr.ac.kopo.schedule.model.Board;
import kr.ac.kopo.schedule.model.SearchCriteria;

public interface BoardService {


	List<Board> listSearchCriteria(SearchCriteria cri);

	int listSearchCount(SearchCriteria cri);

}
