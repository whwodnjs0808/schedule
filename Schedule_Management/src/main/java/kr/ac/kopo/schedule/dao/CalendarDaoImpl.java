package kr.ac.kopo.schedule.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.ac.kopo.schedule.model.Calendar;

@Repository
public class CalendarDaoImpl implements CalendarDao {

	@Autowired
	SqlSession session;
	
	@Override
	public int add(Calendar item) {
		return session.insert("calendar.add",item);
	}

}
