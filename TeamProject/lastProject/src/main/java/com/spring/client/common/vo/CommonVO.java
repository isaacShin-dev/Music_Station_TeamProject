package com.spring.client.common.vo;

//import lombok.Data;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

//@Data
@ToString
@Setter
@Getter
public class CommonVO {
	private int pageNum  =0; //������ ��ȣ
	private int amount =0;	//�������� ������ ������ ����
	
	
	
	//���ǰ˻��� ����� �ʵ� (�˻����, �˻��ܾ�)
	private String search ="";
	private String keyword = "";
	
	
	//��¥�˻� �� ����� �ʵ� 
	
	
	public CommonVO() {
		this(1, 10);
	}


	public CommonVO(int pageNum, int amount) {
		this.pageNum = pageNum;
		this.amount = amount;
	}

}
