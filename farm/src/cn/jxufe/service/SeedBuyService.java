package cn.jxufe.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import cn.jxufe.bean.Message;
import cn.jxufe.entity.UserBag;

public interface SeedBuyService {
	public List<UserBag> findCurUser(String name);
	public Message buyaseed(String name,int seed,HttpSession session);
}
