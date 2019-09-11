package kr.ac.kopo.schedule.model;

public class Criteria {

	int page;
	int perPageNum;
	
	public Criteria() {
		this.page = 1;
		this.perPageNum =10;
	}
	
	public int getPage() {
		return page;
	}
	public void setPage(int page) {
		if(page <= 0) {
			this.page = 1;
			return;
		}
		
		this.page = page;
	}
	public int getPerPageNum() {
		return perPageNum;
	}

	public void setPerPageNum(int perPageNum) {
		if(perPageNum<=0 || perPageNum > 100) {
			this.perPageNum = 10;
		}
		
		this.perPageNum = perPageNum;
	}
	
//	method for mybatis SQL Mapper 
//	limit 구문에서 시작 위치를 지정할 때 사용
	public int getPageStart() {
		return (this.page -1) * perPageNum;
	}
	@Override
	public String toString() {
		return "Criteria [page = " + page + "," + "perPageNum=" + perPageNum + "]"; 
	}

	
}
