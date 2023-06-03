package com.multi.withPuppy.user;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.EnableScheduling;
import org.springframework.stereotype.Component;

@Component
@EnableScheduling
public class UserManagementDAO {

	@Autowired
	SqlSessionTemplate my;

	public List<UserVO> userList(UserPageVO vo) {
		return my.selectList("user_management.userList", vo);
	}
	
	public int userCount() {
		return my.selectOne("user_management.userCount");
	}  
	
	public List<UserVO> searchUser(UserPageVO vo) {
		return my.selectList("user_management.searchUser", vo);
	}
	
	public int userSearchCount(UserPageVO vo) {
		System.out.println("다오!!!!!!!: "+vo.getUser_level() + ", " + vo.getUser_condition() + ", " + vo.getSearchWord());
		return my.selectOne("user_management.userSearchCount", vo);
	}  

	public void deleteUsers(String userIds) {
		my.update("user_management.deleteUsers", userIds);
	}
}
