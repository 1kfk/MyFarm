package cn.jxufe.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import cn.jxufe.bean.Message;

public interface FarmService {
	//选择用户
	public Message setCurUser(HttpSession session,HttpServletRequest request);
}
