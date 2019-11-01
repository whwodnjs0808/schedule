package kr.ac.kopo.schedule.model;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;

import org.springframework.web.util.UriComponents;
import org.springframework.web.util.UriComponentsBuilder;

// 페이징 처리용 클래스를 생성하였다.
public class PageMaker {

//	DB에서 계산되는 데이터 : sql의 결과로 나온 데이터의 전체개수
	private int totalCount;
// 아래는 계산을 통해서 만들어지는 데이터이다.
	private int startPage;
	private int endPage;
	private boolean prev;
	private boolean next;
	
	private int displayPageNum =10 ;
	
//	외부에서 입력되는 데이터 : page,perPageNum
	private Criteria cri;

	public int getTotalCount() {
		return totalCount;
		
	
	}
	
	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
		
		calcData();
	}
	
//	totalCount가 설정되는 시점에 calcData()를 실행해서 계산한다.
	public void calcData() {
		
//		( 현재페이지번호 / 페이지 번호의 수 ) * 페이지 번호의 수
		endPage = (int) (Math.ceil(cri.getPage()/(double) displayPageNum) * displayPageNum);
		
//		endPage - 페이지 번호의 수  + 1
		startPage  = (endPage - displayPageNum) + 1;
		
//		이전에 구한 endPage 값과 계산된 결과를 비교해서, 계산된 결과가 작은 경우에는 실제 endPage는 최종 계산된 결과가 돼야한다.
		int tempEndPage = (int)(Math.ceil(totalCount/(double) cri.getPerPageNum()));
		
		if(endPage > tempEndPage) {
			endPage = tempEndPage;
		}
//		startPage가 1이 아닌지를 검사한다.
		prev = startPage == 1?false : true;
//		뒤에 더 데이터가 남아 있는지에 대한 처리이므로 endPage * perPageNum 이 totalCount보다 작은지를 확인
		next = endPage * cri.getPerPageNum() >= totalCount?false : true;
	}


	public int getStartPage() {
		return startPage;
	}

	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}

	public int getEndPage() {
		return endPage;
	}

	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}

	public boolean isPrev() {
		return prev;
	}

	public void setPrev(boolean prev) {
		this.prev = prev;
	}

	public boolean isNext() {
		return next;
	}

	public void setNext(boolean next) {
		this.next = next;
	}

	public int getDisplayPageNum() {
		return displayPageNum;
	}

	public void setDisplayPageNum(int displayPageNum) {
		this.displayPageNum = displayPageNum;
	}

	public Criteria getCri() {
		return cri;
	}

	public void setCri(Criteria cri) {
		this.cri = cri;
	}
	
//	makeQuery : 동적 sql 만들때 
	public String makeQuery(int page) {
//		Uricomponents : uri 를 생성해주는 클래스
		UriComponents uriComponents = UriComponentsBuilder.newInstance()
				.queryParam("page", page)
				.queryParam("perPageNum", cri.getPerPageNum())
				.build();
		
		return uriComponents.toUriString();
	}
//	스프링의 UriComponents를 이용해서 페이징 처리에 필요한 데이터를 생성하는 역할 
	public String makeSearch(int page) {
		
		UriComponents uriComponents = 
				UriComponentsBuilder.newInstance()
				.queryParam("page",page)
				.queryParam("perPageNum", cri.getPerPageNum())
				.queryParam("searchType",((SearchCriteria) cri).getSearchType())
				.queryParam("keyword",encoding(((SearchCriteria) cri).getKeyword())).build();
		return uriComponents.toUriString();
	}
	private String encoding(String keyword) {
		
		if(keyword == null || keyword.trim().length()==0) {
			return "";
		}
		try {
			return URLEncoder.encode(keyword,"UTF-8");
		}catch(UnsupportedEncodingException e) {
			return "";
		}
	}
	
}
