package com.ana.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import com.ana.domain.AcmVO;
import com.ana.domain.WishListVO;

public interface WishListMapper {
	

	
	public int insert(WishListVO board); //추가
	public WishListVO read(String wishNum); //하나 조회
	public List<WishListVO> getList(String loginUserNum); //여러개 조회
	
	public boolean delete(String wishNum);	 // ajax 삭제 (찜목록)
	
	public boolean wishdelete(String wishNum);	 // ajax 삭제	 (result)
	
	public int update(WishListVO board); //수정	
	
	public void insertSelectKey(WishListVO board);
	public int insertAjax(WishListVO vo);
	
	public int deleteAjax(String wishNum); //deleteAjax
	
	public Integer countCart(WishListVO board);		
	
	public List<WishListVO> drawValue(@Param("userNum")String userNum, @Param("acmNum") String acmNum);

}
