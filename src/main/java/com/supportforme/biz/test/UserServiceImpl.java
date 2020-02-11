package com.supportforme.biz.test;



import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class UserServiceImpl implements UserService {

	//DI
	//@Autowired 	UserDAOSpring dao;
	@Autowired UserDAOMyabatis dao;
	@Override
	public int insertUser(UserDTO dto) {
		return dao.insertUser(dto);
	}

	@Override
	public int updateUser(UserDTO dto) {
		return dao.updateUser(dto);
	}

	@Override
	public int deleteUser(UserDTO dto) {
		return dao.deleteUser(dto);
	}

	@Override
	public UserDTO getUser(UserDTO dto) {
		return dao.getUser(dto); 
	}

	@Override
	public List<UserDTO> getUsers(UserSearchDTO serachDTO) {
		return dao.getUsers(serachDTO);
	}
	
	@Override
	public int getCnt(UserSearchDTO searchDTO) {
		return dao.getCnt(searchDTO);
	}

}
