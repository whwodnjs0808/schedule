package kr.ac.kopo.schedule.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.ac.kopo.schedule.dao.BoardDao;
import kr.ac.kopo.schedule.model.Board;
import kr.ac.kopo.schedule.model.SearchCriteria;

@Service
public class BoardServiceImpl implements BoardService {

	@Autowired
	BoardDao dao;
	
	@Override
	public List<Board> listSearchCriteria(SearchCriteria cri) {
		return dao.listSearch(cri);
	}

	@Override
	public int listSearchCount(SearchCriteria cri) {
		return dao.listSearchCount(cri);
	}

	@Override
	public void register(Board item) {
		dao.register(item);
	}

	@Override
	public void delete(int bno) {
		dao.delete(bno);
	}

	@Override
	public void update(Board item) {
		dao.update(item);
	}

	@Override
	public Board getItem(int bno) {
		return dao.getItem(bno);
	}

}
