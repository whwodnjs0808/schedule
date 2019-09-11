package kr.ac.kopo.schedule.service;


import kr.ac.kopo.schedule.dto.LoginDTO;
import kr.ac.kopo.schedule.model.User;

public interface UserService {

	User login(LoginDTO dto);

	void register(User item);



}
