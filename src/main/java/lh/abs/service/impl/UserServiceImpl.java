package lh.abs.service.impl;

import java.util.List;

import lh.abs.dao.MUserDao;
import lh.abs.model.MUser;
import lh.abs.service.UserService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class UserServiceImpl implements UserService{
    
    @Autowired
	private MUserDao mUserDao;
		
	@Override
	public List<MUser> getAll() {
		
		return mUserDao.getAll();
	}

	@Override
	public int insert(MUser muser) {
		
		return mUserDao.insert(muser);
	}

	@Override
	public int update(MUser muser) {
		
		return mUserDao.updateByPrimaryKey(muser);
	}

	@Override
	public int delete(String id) {
	
		return mUserDao.deleteByPrimaryKey(id);
	}

	@Override
	public MUser selectByPrimaryKey(String id) {
		
		return mUserDao.selectByPrimaryKey(id);
	}

}
