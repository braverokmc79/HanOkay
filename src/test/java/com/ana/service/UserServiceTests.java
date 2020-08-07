package com.ana.service;

import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertTrue;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.List;

import javax.servlet.http.HttpSession;
import javax.validation.constraints.AssertFalse;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mock.web.MockHttpServletRequest;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.ana.domain.UserProfileVO;
import com.ana.domain.UserVO;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class UserServiceTests {

	@Setter(onMethod_ = { @Autowired })
	private UserService service;

	@Test
	public void testExist() {
		log.info(service);

		assertNotNull(service);
	}

//	@Test
	public void testRegister() {
		UserVO user = new UserVO();

		user.setUserEmail("jiha@naver.com");
		user.setUserPwd("Bimil123@");

		SimpleDateFormat beforeFormat = new SimpleDateFormat("yyyy/MM/dd");
		try {
			user.setUserBirthday(beforeFormat.parse("2010/11/11"));
		} catch (ParseException e) {
			e.printStackTrace();
		}
		user.setUserLastName("Jiha");
		user.setUserFstName("Kim");
		user.setUserPhone("");
		service.register(user);
		log.info("생성된 회원번호: " + user.getUserNum());

	}

//	@Test
	public void testGet() {
		if (service.get("U1") == null) {
			log.info("********없는 회원입니다!***********");
		} else {
			log.info(service.get("U1"));
		}
	}

//	@Test
	public void testDelete() {
		log.info("REMOVE RESULT: " + service.remove("U190"));

	}

//	@Test
	public void testUpdate() {

		UserVO user = service.get("U10");
		if (user == null) {
			return;
		}
		log.info("MOODIFY RESULT: " + service.modify(user));
	}
	


//	@Test
	public void testGetUserById() {
		log.info("GET USER BY EMAIL: "+ service.getUserById("mira@naver.com"));
	}
	
//	@Test
	public void testEmailCheck() {
		AssertFalse(service.canRegister("serin@naver.com"));
	}

	
//	@Test 
	public void testMatchAuth() {
		assertTrue(service.matchAuthCode("admin@hanokay.com", "00000"));
		
	}
	
	private void AssertFalse(boolean checkEmail) {
		// TODO Auto-generated method stub
	}

	//userNum으로 프로필 정보 가져와
	@Test
	public void testShowProfile() {
		MockHttpServletRequest request= new MockHttpServletRequest();
		HttpSession session= request.getSession();
		UserProfileVO prof= new UserProfileVO();
		prof.setUserNum("U85");
		session.setAttribute("userProfile", prof);
		UserProfileVO u= service.showProfile( session);
		log.info("userProfileVO: "+ u);
		
	}
}

