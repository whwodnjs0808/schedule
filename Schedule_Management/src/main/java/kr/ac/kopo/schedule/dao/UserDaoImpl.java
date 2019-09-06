package kr.ac.kopo.schedule.dao;


import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.ac.kopo.schedule.dto.LoginDTO;
import kr.ac.kopo.schedule.model.User;

@Repository
public class UserDaoImpl implements UserDao {

	@Autowired
	SqlSession sql;

	@Override
	public User login(LoginDTO dto) {
		return sql.selectOne("user.login",dto);
	}

}
