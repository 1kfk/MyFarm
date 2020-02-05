package cn.jxufe.imp;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.jxufe.bean.Message;
import cn.jxufe.dao.UserDAO;
import cn.jxufe.entity.User;
import cn.jxufe.service.FarmService;
@Service
public class FarmImp implements FarmService{
	@Autowired
	private UserDAO userDAO;
	@Override
	public Message setCurUser(HttpSession session, HttpServletRequest request) {
		Message mes=new Message();
		try {
		String p=request.getParameter("id");
		long id=(long)Integer.parseInt(p);
		User user=userDAO.findById(id);
		session.setAttribute("user", user);
		mes.setCode(0);
		mes.setMsg("当前用户已设定为:"+user.getUserName());
		}catch (Exception e) {
			mes.setCode(-10);
			mes.setMsg("失败");
		}
		return mes;
	}
}
