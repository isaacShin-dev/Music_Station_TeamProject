package com.spring.mta.common.vo;

import lombok.Getter;
import lombok.ToString;

@Getter
@ToString
public class pageDTO {
	
	
	private int startPage ;
	private int endPage;
	private boolean prev,next ; //이전과 다음으로 이동할 링크 표시 여부
	
	private int total ;
	private CommonVO cvo ;
	
	public pageDTO(CommonVO cvo, int total ) {
		this.cvo = cvo; 
		this.total =total;
		
//		페이징의 끝번호(endPage) 구하기 
//		this.endPage = (int)(Math.ceil(페이지번호/10.0))*10
		
		this.endPage = (int)(Math.ceil(cvo.getPageNum()/10.0))*10;
		
		/* 페이징의 시작번호(startPage) 구하기 */
		this.startPage = this.endPage -9;
		
		/* 끝 페이지 구하기 */
		 int realEnd =(int)(Math.ceil((total*1.0)/cvo.getAmount()));
		 
		 if(realEnd <= this.endPage) {
			 this.endPage = realEnd; 
		 }
		 
			/* 이전(prev) 구하기 */
		 this.prev = this.startPage>1;
		 
			/* 다음(next) 구하기 */
		 this.next = this.endPage <realEnd;
	
	}
}