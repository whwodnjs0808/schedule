package kr.ac.kopo.schedule.model;

// sql 의 pageStart,perPageNum이라는 인라인 파라미터가 존재하는데 파라미터로 전달되는 객체는 getPageStart(),getPerPageNum()이라는 메소드를 가지면 된다. 따라서 이 파라미터들을 클래스로 만들어서 객체로 처리하기위해 Criteria 클래스를 작성했다.
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
