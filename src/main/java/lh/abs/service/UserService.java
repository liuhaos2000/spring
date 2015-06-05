package lh.abs.service;

import java.util.List;

import rml.model.MUser;

public interface UserService {

	List<MUser> getAll();
	
	MUser selectByPrimaryKey(String id);
	
    int insert(MUser muser);
    
    int update(MUser muser);
    
    int delete(String id);
}
