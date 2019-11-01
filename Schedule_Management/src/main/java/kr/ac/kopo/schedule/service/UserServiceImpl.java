package kr.ac.kopo.schedule.service;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.ac.kopo.schedule.dao.UserDao;
import kr.ac.kopo.schedule.dto.LoginDTO;
import kr.ac.kopo.schedule.model.User;

@Service
public class UserServiceImpl implements UserService {

	@Autowired
	UserDao dao;

	@Override
	public User login(LoginDTO dto) {
		return dao.login(dto);
	}

	@Override
	public void register(User item) {
		dao.register(item);
	}

	@Override
	public int useridCheck(String userid) {
		return dao.useridCheck(userid);
	}

}
