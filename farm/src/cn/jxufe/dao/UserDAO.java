package cn.jxufe.dao;


import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.repository.PagingAndSortingRepository;

import cn.jxufe.entity.User;

public interface UserDAO extends PagingAndSortingRepository<User, Long>{
	public Page<User> findByUserNameLike(String userName,Pageable pageable);
	public User findById(long id);
	public User findByUserName(String userName);
}
