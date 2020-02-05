package cn.jxufe.imp;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import cn.jxufe.bean.EasyUIData;
import cn.jxufe.bean.Message;
import cn.jxufe.dao.UserDAO;
import cn.jxufe.entity.User;
import cn.jxufe.service.UserService;
@Service
public class UserImp implements UserService{
	@Autowired
	private UserDAO userDAO;
	@Override
	public EasyUIData<?> list(Pageable pageable) {
		Page<User> page = userDAO.findAll(pageable);
        EasyUIData<User> easyUIData = new EasyUIData<User>();
        easyUIData.setTotal(page.getTotalElements());
        easyUIData.setRows(page.getContent());
        return easyUIData;
	}

	@Override
	public EasyUIData<?> findSome(String userName, Pageable pageable) {
		Page<User> page=userDAO.findByUserNameLike(userName, pageable);
		EasyUIData<User> easyUIData =new EasyUIData<User>();
		easyUIData.setTotal(page.getTotalElements());
		easyUIData.setRows(page.getContent());
		return easyUIData;
	}

	@Override
	public Message save(User user) {
		Message mes=new Message();
		try {
			userDAO.save(user);
			mes.setCode(0);
			mes.setMsg("保存成功");
		}catch (Exception e) {
			mes.setCode(-10);
			mes.setMsg("保存失败");
		}
		return mes;
	}

	@Override
	public Message delete(User user) {
		Message mes=new Message();
		try {
			userDAO.delete(user);
			mes.setCode(0);
			mes.setMsg("删除成功");
		}catch (Exception e) {
			mes.setCode(-10);
			mes.setMsg("删除失败");
		}
		return mes;
	}

	@Override
	public void uppic(long id, String pic) {
		User user=userDAO.findById(id);
		user.setHeadPic(pic);
		System.out.println(user.getHeadPic()+"############################");
		System.out.println(user);
		userDAO.save(user);
	}

	@Override
	public Iterable<User> findAll() {
		return userDAO.findAll();
	}
}
