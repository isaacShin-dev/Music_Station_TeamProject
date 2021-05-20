package com.spring.mta.board.vo;

import com.spring.mta.common.vo.CommonVO;

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
public class MusicBoardVO extends CommonVO {
	private int m_no =0;
	private String m_title ="";
	private String m_name ="";
	private String m_coverimage =""	;
	private int m_bpm;
	private String m_explan="";
	private String m_file="";
	private String m_regdate ="";
	private int m_recommend =0;
	private int m_views=0;
	private String user_id ="";
	private String m_price ="";
	private int m_isfree= 0;
	
}


