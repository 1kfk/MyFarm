package cn.jxufe.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import cn.jxufe.entity.UserBag;

public interface UserBagDAO extends JpaRepository<UserBag, Long>{
	public List<UserBag> findByUserName(String userName);
	public UserBag findByUserNameAndSeedId(String userName,int seedId);
}
