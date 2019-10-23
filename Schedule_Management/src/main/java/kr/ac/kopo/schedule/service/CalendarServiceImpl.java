package kr.ac.kopo.schedule.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.ac.kopo.schedule.dao.CalendarDao;
import kr.ac.kopo.schedule.model.Calendar;

@Service
public class CalendarServiceImpl implements CalendarService {

	@Autowired
	CalendarDao dao;
	
	@Override
	public int add(Calendar item) {
		return dao.add(item);
	}

	@Override
	public List<Calendar> list(Calendar calendar) {
		return dao.list(calendar);
	}

	@Override
	public void insert(Calendar item) {
		dao.insert(item);
	}

}
