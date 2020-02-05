package cn.jxufe.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import cn.jxufe.bean.Message;
import cn.jxufe.entity.Crop;
import cn.jxufe.entity.SeedGrowth;
import cn.jxufe.entity.SeedList;

public interface CropsGrowService {
	public SeedList findseed(int id);
	public List<Crop> getCrops(String name);
	public SeedGrowth getCropxy(int seedid,int seedstate);
	public Message Aseedplant(HttpServletRequest request,HttpSession session);
	public Message killbug(HttpServletRequest request,HttpSession session);
	public Message cleanland(HttpServletRequest request,HttpSession session);
	public Message harvest(HttpServletRequest request,HttpSession session);
	public Crop getacrop(HttpServletRequest request, HttpSession session);
}
