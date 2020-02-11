package com.supportforme.biz.test;



import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
@Repository
public class UserDAOMyabatis {
	@Autowired 
	SqlSessionTemplate mybatis;
	//전체 조회
	public List<UserDTO> getUsers(UserSearchDTO searchDTO){

		return mybatis.selectList("user.getUsers", searchDTO);
	}
	public int getCnt(UserSearchDTO searchDTO) {
		return mybatis.selectOne("user.getCnt", searchDTO);
	}
	
	public UserDTO getUser(UserDTO dto){
		
		return mybatis.selectOne("user.getUser", dto);
	}
	
	public int insertUser(UserDTO dto){
		return mybatis.insert("user.insertUser", dto);
	}
	
	public int updateUser(UserDTO dto){
		return mybatis.update("user.updateUser",dto);
	}
	
	
	public int deleteUser(UserDTO dto){
		return mybatis.delete("user.deleteUser",dto);
	}
}
