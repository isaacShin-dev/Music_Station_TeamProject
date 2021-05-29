package com.spring.mta.board.vo;

import org.springframework.web.multipart.MultipartFile;

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
	private MultipartFile coverImg;
	private String m_coverimage ="";
	private int m_bpm;
	private String m_explain="";
	private MultipartFile file;
	private String m_file = "";
	private String m_regdate ="";
	private int m_recommentcnt =0;
	private int m_views=0;
	private String user_id ="";
	private String m_price ="";
	private int m_isfree= 0;
	private String m_genre ="";
	private int m_stock =0;
	
	private int r_cnt = 0;
	
}


