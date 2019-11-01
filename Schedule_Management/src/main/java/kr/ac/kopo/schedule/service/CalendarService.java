package kr.ac.kopo.schedule.service;

import java.util.List;

import kr.ac.kopo.schedule.model.Calendar;

public interface CalendarService {

	int add(Calendar item);

	List<Calendar> list();

	int delete(int pid);

}
