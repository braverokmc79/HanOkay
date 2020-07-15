package com.ana.mapper;

import java.util.List;

import com.ana.domain.AcmOptionVO;

public interface AcmOptionMapper {

	// 숙소 상세페이지: 숙소별 옵션 목록 불러오기
	public List<AcmOptionVO> getList(String acmNum);
	
	public int insert(AcmOptionVO vo);//숙소등록할떄옵션추가
	
	public AcmOptionVO read(String acmNum);
	
	public int delete(String acmNum, String acmOptcode);
	
	
	public int update(AcmOptionVO acm);
	
	
}
