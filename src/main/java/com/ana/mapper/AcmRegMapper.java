package com.ana.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.ana.domain.AcmVO;
import com.ana.domain.PicVO;
import com.ana.domain.UserAcmVO;

public interface AcmRegMapper {
	
	public List<AcmVO> getListAcms(@Param("ownerUserNum")String ownerUserNum, @Param("acmActi")String acmActi);
	
	
	public void newAcmReg(AcmVO vo);//숙소등록**
	
	public void insertPhoto(PicVO vo);//숙소사진등록**
	
	public String getAcm(String acmNum);//숙소정보 가져오기
	
	public AcmVO getnewAcm(String acmNum);//숙소정보 가져오기
	
	public AcmVO getpendingacm(String bizRegisterNumber);
	
	
	public int delete(String acmNum);
	
	
	public int update1_6(AcmVO vo);//opt와 desc update
	
	public int chkaddr(String acmDetailaddr);//중복검사
	
	//가져온다
	public int getNotPendingAcms(@Param("acmNum")String acmNum,@Param("ownerUserNum")String ownerUserNum, @Param("acmActi")String acmActi);
	
	public int removeAcmPic(String acmNum);//지운다
	public int removeAcm(String acmNum);//지운다
	public int removeAcmso(String acmNum);//지운다
	//숙소 수정
	public int modiAcm(AcmVO vo);
	public int reregAcm(String acmNum);
	
	
	////////////어드민단////////////
	public List<UserAcmVO> getadminListAcms(String acmActi);
	
	public UserAcmVO getUserAcms(String acmNum);
	//호스트 권한을 주며 active로 변경
	public int moditoAcmActive(AcmVO acm);

	public UserAcmVO getPendingUserAcms(@Param("bizRegnum") String bizRegnum,@Param("acmActi")String acmActi);

	public UserAcmVO getUserNumAcm(String userNum);
	
}
