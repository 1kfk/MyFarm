package cn.jxufe.service;

import org.springframework.data.domain.Pageable;

import cn.jxufe.bean.EasyUIData;
import cn.jxufe.bean.Message;
import cn.jxufe.entity.User;

public interface UserService {
	public EasyUIData<?> list(Pageable pageable);
	public EasyUIData<?> findSome(String userName,Pageable pageable);
	public Message save(User user);
	public Message delete(User user);
	public void uppic(long id,String pic);
	public Iterable<User> findAll();
	
}
