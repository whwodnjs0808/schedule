package kr.ac.kopo.schedule.dao;


import kr.ac.kopo.schedule.dto.LoginDTO;
import kr.ac.kopo.schedule.model.User;

public interface UserDao {


	User login(LoginDTO dto);

	void register(User item);


}
