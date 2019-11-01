package kr.ac.kopo.schedule.dao;

import java.util.List;

import kr.ac.kopo.schedule.model.Calendar;

public interface CalendarDao {

	int add(Calendar item);

	List<Calendar> list();

	int delete(int pid);

}
