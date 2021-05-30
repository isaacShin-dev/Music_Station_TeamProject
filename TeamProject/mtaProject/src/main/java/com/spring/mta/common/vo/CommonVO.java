package com.spring.mta.common.vo;

//import lombok.Data;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

//@Data
@ToString
@Setter
@Getter
public class CommonVO {
	private int pageNum  =0; //페이지 번호
	private int amount =0;	//페이지에 보여줄 데이터 갯수
	
	
	
	//조건검색시 사용할 필드 (검색대상, 검색단어)
	private String search ="";
	private String keyword = "";
	
	
	//날짜검색 시 사용할 필드 
	private String start_date = "";
	private String end_date = "";
	
	public CommonVO() {
		this(1, 10);
	}


	public CommonVO(int pageNum, int amount) {
		this.pageNum = pageNum;
		this.amount = amount;
	}

}