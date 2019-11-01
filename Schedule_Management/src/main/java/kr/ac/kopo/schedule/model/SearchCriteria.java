package kr.ac.kopo.schedule.model;

// 사용자가 게시물 검색을 하고 난후 목록 페이지를 만들기 위해 필요한 정보들 즉 page(현재 페이지 번호), perPageNum(페이지당 보여지는 데이터의 수 ), searchType(검색의 종류), keyword(검색의 키워드) 를 저장하는 클래스
public class SearchCriteria extends Criteria {

	private String searchType;
	private String keyword;

	public String getSearchType() {
		return searchType;
	}

	public void setSearchType(String searchType) {
		this.searchType = searchType;
	}

	public String getKeyword() {
		return keyword;
	}

	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
	
	@Override
	public String toString() {
		return super.toString() + "SearchCriteria"
				+ "[searchType=" + searchType + ",keyword="
				+ keyword + "]";
	}
	
	
}
