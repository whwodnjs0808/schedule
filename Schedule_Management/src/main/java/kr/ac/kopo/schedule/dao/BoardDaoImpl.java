package kr.ac.kopo.schedule.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.ac.kopo.schedule.model.Board;
import kr.ac.kopo.schedule.model.SearchCriteria;

@Repository
public class BoardDaoImpl implements BoardDao {

	@Autowired
	SqlSession sql;
	
	@Override
	public List<Board> listSearch(SearchCriteria cri) {
		return sql.selectList("board.listSearch" , cri);
	}

	@Override
	public int listSearchCount(SearchCriteria cri) {
		return sql.selectOne("board.listSearchCount",cri);
	}

	@Override
	public void register(Board item) {
		sql.insert("board.register",item);
	}

	@Override
	public void delete(int bno) {
		sql.delete("board.delete",bno);
	}

	@Override
	public void update(Board item) {
		sql.update("board.update",item);
	}

	@Override
	public Board getItem(int bno) {
		return sql.selectOne("board.getItem",bno);
	}

	@Override
	public Board read(int bno) {
		return sql.selectOne("board.read",bno);
	}

}
