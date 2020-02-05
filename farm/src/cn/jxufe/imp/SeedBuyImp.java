package cn.jxufe.imp;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.jxufe.bean.Message;
import cn.jxufe.dao.SeedListDAO;
import cn.jxufe.dao.UserBagDAO;
import cn.jxufe.dao.UserDAO;
import cn.jxufe.entity.SeedList;
import cn.jxufe.entity.User;
import cn.jxufe.entity.UserBag;
import cn.jxufe.service.SeedBuyService;

@Service
public class SeedBuyImp implements SeedBuyService {
	@Autowired
	private UserBagDAO userBagDAO;
	@Autowired
	private UserDAO userDAO;
	@Autowired
	private SeedListDAO seedListDAO;

	@Override
	public List<UserBag> findCurUser(String name) {
		return userBagDAO.findByUserName(name);
	}

	@Override
	public Message buyaseed(String name, int seed,HttpSession session) {
		Message mes = new Message();
		if (name != null&&!"".equals(name)) {
			User user = userDAO.findByUserName(name);
			SeedList sed = seedListDAO.findBySeedId(seed);
			UserBag userbag = userBagDAO.findByUserNameAndSeedId(name, seed);
			if ((user.getMoney() - sed.getBuyPrice()) >= 0) {
				user.setMoney(user.getMoney() - sed.getBuyPrice());
				userDAO.save(user);
				session.setAttribute("user", user);
				if (userbag == null) {
					UserBag newone = new UserBag();
					newone.setSeedId(seed);
					newone.setUserName(name);
					newone.setSeedNumber(1);
					userBagDAO.save(newone);
				} else {
					int num = userbag.getSeedNumber();
					userbag.setSeedNumber(num + 1);
					userBagDAO.save(userbag);
				}
				mes.setCode(0);
				mes.setMsg("购买成功");
			} else {
				mes.setCode(-1);
				mes.setMsg("金币不足，无法购买");
			}
		} else {
			mes.setCode(-1);
			mes.setMsg("用户非法");
		}
		return mes;
	}

}
