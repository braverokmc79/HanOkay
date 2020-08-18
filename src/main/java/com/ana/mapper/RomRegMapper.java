package com.ana.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.ana.domain.RomVO;

public interface RomRegMapper {//호스트단에서 객실관련처리
	
	public List<RomVO> getList(String acmNum);//숙소번호를 넣어주면 숙소에 포함된 객실들을 모두 가져옴
	public List<String> getRomList(String acmNum);
	
	
	public int registerRom(RomVO rom);
	public RomVO getRom(String romNum);
	public int modify(RomVO rom);
	
	public int remove(String romNum);//해당객실 하나 지우기
	
	public int moditoRomActive(RomVO rom);
	public int getRomsize(String acmNum);
	
	public List<RomVO> getRomwithAcm(String acmNum);
	
	public int modiRom(RomVO vo);
}
