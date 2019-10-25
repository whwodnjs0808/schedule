package kr.ac.kopo.schedule.model;

import java.util.Date;

public class Calendar {

	int pid;
	String userid;
	String title;
	Date startEvent;
	Date endEvent;
	boolean allDay = false;

	public int getPid() {
		return pid;
	}

	public void setPid(int pid) {
		this.pid = pid;
	}

	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public Date getStartEvent() {
		return startEvent;
	}

	public void setStartEvent(Date startEvent) {
		this.startEvent = startEvent;
	}

	public Date getEndEvent() {
		return endEvent;
	}

	public void setEndEvent(Date endEvent) {
		this.endEvent = endEvent;
	}

	public boolean isAllDay() {
		return allDay;
	}

	public void setAllDay(boolean allDay) {
		this.allDay = allDay;
	}

}
