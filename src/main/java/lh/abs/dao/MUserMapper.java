package lh.abs.dao;

import java.util.List;

import lh.abs.model.MUser;

public interface MUserMapper {
    int deleteByPrimaryKey(String userId);

    int insert(MUser record);

    int insertSelective(MUser record);

    MUser selectByPrimaryKey(String userId);

    int updateByPrimaryKeySelective(MUser record);

    int updateByPrimaryKey(MUser record);

    List<MUser> getAll();
}