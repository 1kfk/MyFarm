package cn.jxufe.imp;

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.jxufe.bean.Message;
import cn.jxufe.dao.CropDAO;
import cn.jxufe.dao.SeedGrowthDAO;
import cn.jxufe.dao.SeedListDAO;
import cn.jxufe.dao.UserBagDAO;
import cn.jxufe.dao.UserDAO;
import cn.jxufe.entity.Crop;
import cn.jxufe.entity.SeedGrowth;
import cn.jxufe.entity.SeedList;
import cn.jxufe.entity.User;
import cn.jxufe.entity.UserBag;
import cn.jxufe.service.CropsGrowService;

@Service
public class CropsGrowImp implements CropsGrowService {

	@Autowired
	private SeedListDAO seedListDAO;
	@Autowired
	private CropDAO cropDAO;
	@Autowired
	private SeedGrowthDAO seedGrowthDAO;
	@Autowired
	private UserBagDAO userBagDAO;
	@Autowired
	private UserDAO userDAO;
	@Override
	public SeedList findseed(int id) {
		SeedList s = seedListDAO.findBySeedId(id);
		return s;
	}

	@Override
	public List<Crop> getCrops(String username) {
		return cropDAO.findByUsername(username);
	}

	@Override
	public SeedGrowth getCropxy(int seedid, int seedstate) {
		return seedGrowthDAO.findBySeedIdAndGrowthNum(seedid, seedstate);
	}

	@Override
	public Message Aseedplant(HttpServletRequest request,HttpSession session) {
		String id = request.getParameter("seedid");
		int seedid=Integer.parseInt(id);
		String i=request.getParameter("landi");
		String j=request.getParameter("landj");
		User user=(User) session.getAttribute("user");
		String username=user.getUserName();
		String land=i+"img"+j;
		int inum=Integer.parseInt(i);
		
		Crop crop = new Crop();
		SeedList sl = seedListDAO.findBySeedId(seedid);
		SeedGrowth sg = seedGrowthDAO.findBySeedIdAndGrowthNum(seedid, 0);
		UserBag bag = userBagDAO.findByUserNameAndSeedId(username, seedid);
		Message mes = new Message();
		if (sl.getSoil() == inum) {
			if (bag.getSeedNumber() > 0) {
				crop.setIsbug(0);
				crop.setLand(land);
				crop.setSeedid(seedid);
				crop.setUsername(username);
				crop.setSeedstate(0);
				crop.setLateseason(sl.getSeason());
				crop.setSeedget(sl.getGetNum());

				long hm = System.currentTimeMillis();
				long needtime = sg.getGrowthTime() * 1000;
				Date date1 = new Date(hm + needtime);
				crop.setNexttime(date1);

				bag.setSeedNumber(bag.getSeedNumber() - 1);
				userBagDAO.save(bag);
				cropDAO.save(crop);
				mes.setCode(1);
				mes.setMsg("成功播种"+sl.getSeedName());
			} else {
				mes.setCode(0);
				mes.setMsg("该种子数量不够");
			}
		}else {
			mes.setCode(-1);
			mes.setMsg("土地类型不匹配");
		}
		return mes;
	}

	@Override
	public Message killbug(HttpServletRequest request,HttpSession session) {
		String land=request.getParameter("land");
		User user=(User) session.getAttribute("user");
		String username=user.getUserName();
		Crop crop=cropDAO.findByUsernameAndLand(username, land);
		Message mes = new Message();
		if(crop.getIsbug()==1) {
			crop.setIsbug(0);
			user.setMoney(user.getMoney()+1);
			user.setExperience(user.getExperience()+2);
			user.setPoints(user.getPoints()+2);
			userDAO.save(user);
			session.setAttribute("user", user);
			mes.setCode(1);
			mes.setMsg("杀虫成功<br>经验+2、金币+1、积分+2");
			cropDAO.save(crop);
		}else {
			mes.setCode(0);
			mes.setMsg("杀虫失败");
		}
		return mes;
	}

	@Override
	public Message cleanland(HttpServletRequest request,HttpSession session) {
		String land=request.getParameter("land");
		User user=(User) session.getAttribute("user");
		String username=user.getUserName();
		Crop crop=cropDAO.findByUsernameAndLand(username, land);
		Message mes = new Message();
		if(crop.getLateseason()==1) {
			cropDAO.delete(crop);
			user.setMoney(user.getMoney()+1);
			user.setExperience(user.getExperience()+2);
			user.setPoints(user.getPoints()+2);
			userDAO.save(user);
			session.setAttribute("user", user);
			mes.setCode(1);
			mes.setMsg("除草成功<br>经验+2、金币+1、积分+2");
		}else {
			SeedList sl = seedListDAO.findBySeedId(crop.getSeedid());
			SeedGrowth sg = seedGrowthDAO.findBySeedIdAndGrowthNum(crop.getSeedid(), 0);
			crop.setLateseason(crop.getLateseason()-1);
			crop.setSeedstate(0);
			crop.setIsbug(0);
			crop.setSeedget(sl.getGetNum());
			long hm = System.currentTimeMillis();
			long needtime = sg.getGrowthTime() * 1000;
			Date date1 = new Date(hm + needtime);
			crop.setNexttime(date1);
			
			cropDAO.save(crop);
			
			user.setMoney(user.getMoney()+1);
			user.setExperience(user.getExperience()+2);
			user.setPoints(user.getPoints()+2);
			userDAO.save(user);
			session.setAttribute("user", user);
			
			mes.setCode(0);
			mes.setMsg("进入下一季度<br>经验+2、金币+1、积分+2");
		}
		return mes;
	}
	
	@Override
	public Message harvest(HttpServletRequest request,HttpSession session) {
		String land=request.getParameter("land");
		User user=(User) session.getAttribute("user");
		Crop crop=cropDAO.findByUsernameAndLand(user.getUserName(), land);
		SeedList sl = seedListDAO.findBySeedId(crop.getSeedid());
		Message mes = new Message();
		crop.setSeedstate(6);
		
		mes.setCode(1);
		user.setMoney(user.getMoney()+crop.getSeedget()*sl.getSalePrice());
		user.setExperience(user.getExperience()+sl.getExperience());
		user.setPoints(user.getPoints()+sl.getPoints());
		session.setAttribute("user", user);
		cropDAO.save(crop);
		userDAO.save(user);
		mes.setMsg("收获成功<br>经验：+"+sl.getExperience()+"<br>金币：+"+sl.getSalePrice()+"金币x"+crop.getSeedget()+"个果实="+crop.getSeedget()*sl.getSalePrice()+"金币<br>积分：+"+sl.getPoints());
		return mes;
	}

	@Override
	public Crop getacrop(HttpServletRequest request, HttpSession session) {
		String i=request.getParameter("landi");
		String j=request.getParameter("landj");
		String land=request.getParameter("land");
		User user=(User) session.getAttribute("user");
		String username=user.getUserName();
		if("".equals(land)||land==null)
		land=i+"img"+j;
		Crop crop=cropDAO.findByUsernameAndLand(username, land);
		return crop;
	}
}
