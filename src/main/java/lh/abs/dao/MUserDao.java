package lh.abs.dao;

import lh.abs.model.MUser;

public interface MUserDao {
    int deleteByPrimaryKey(String userId);

    int insert(MUser record);

    int insertSelective(MUser record);

    MUser selectByPrimaryKey(String userId);

    int updateByPrimaryKeySelective(MUser record);

    int updateByPrimaryKey(MUser record);
}