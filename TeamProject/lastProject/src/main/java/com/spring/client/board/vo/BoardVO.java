package com.spring.client.board.vo;

import com.spring.client.common.vo.CommonVO;

import lombok.Data;
import lombok.EqualsAndHashCode;

/*
 *@EqualsAndHashCode(callSuper = false)
 ******************************************************************************
 * eqauls �� hashcode �޼ҵ� �ڵ� ���� ��, �θ� Ŭ������ �ʵ���� �������� ������ ���ؼ� ������
 * CallSuper = true  -> �θ� Ŭ���� �ʵ� ���鵵 ���� ���� üũ,
 * CallSuper = false -> (�⺻��) �ڽ��� �ʵ� ���鸸 ����Ѵ�.
 ******************************************************************************* */


@Data
@EqualsAndHashCode(callSuper = false)
public class BoardVO extends CommonVO {
	private int  b_num = 0; 		//�۹�ȣ
	private String b_name = ""; 	//�ۼ���
	private String b_title = ""; 	//����
	private String b_content = ""; 	//����
	private String b_date = ""; 	//�ۼ���
	private String b_pwd = ""; 		//��й�ȣ
	
	private int r_cnt =0; //��� ��ȣ
}
