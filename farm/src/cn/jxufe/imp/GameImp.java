package cn.jxufe.imp;

import java.util.Date;
import java.util.Iterator;
import java.util.List;
import java.util.Timer;
import java.util.TimerTask;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.socket.TextMessage;

import cn.jxufe.dao.CropDAO;
import cn.jxufe.dao.SeedGrowthDAO;
import cn.jxufe.entity.Crop;
import cn.jxufe.entity.SeedGrowth;
import cn.jxufe.service.GameService;
import cn.jxufe.websocket.FarmActionHandler;
@Service
public class GameImp implements GameService{
	@Autowired 
	private CropDAO cropDAO;
	@Autowired
	private SeedGrowthDAO seedGrowthDAO;
	@Autowired
	private FarmActionHandler actionHandler;
	Timer timer=new Timer();
	@Override
	public void gameStart() {
		timer.schedule(new TimerTask() {
			
			@Override
			public void run() {
				checkCropStatus();
			}
		}, 0, 2000);
	}
	@Override
	public void checkCropStatus() {
		System.out.println(actionHandler+"-------------------------------");
		long ct = System.currentTimeMillis();
		Date date=new Date(ct);
		List<Crop> cl=cropDAO.findByNexttimeLessThan(date);
		
		Iterator<Crop> it=cl.iterator();
		while(it.hasNext()) {
			Crop crop=it.next();
			if(crop.getSeedstate()!=6&&crop.getSeedstate()!=5) {
				crop.setSeedstate(crop.getSeedstate()+1);//状态加一 不是枯草
				if(crop.getIsbug()==1) {
					crop.setSeedget(crop.getSeedget()-1);//获得数减少 有虫
				}
				SeedGrowth sg = seedGrowthDAO.findBySeedIdAndGrowthNum(crop.getSeedid(), crop.getSeedstate());
				double isbug=sg.getBug();
				double anum=Math.random();
				if(anum<=isbug) {
					crop.setIsbug(1);
				}else {
					crop.setIsbug(0);
				}
				long needtime = sg.getGrowthTime() * 1000;
				Date date1 = new Date(ct + needtime);
				crop.setNexttime(date1);
				cropDAO.save(crop);
				try {
					String username=crop.getUsername();
					actionHandler.sendMessageToUser(username,new TextMessage(crop.getLand()));
					System.out.println("11111111111111111");
				}catch(Exception e) {
					System.out.println("000000000000000");
				}
			}else if(crop.getSeedstate()==5) {
				crop.setSeedstate(crop.getSeedstate()+1);//状态加一 变枯草
				cropDAO.save(crop);
				try {
					String username=crop.getUsername();
					actionHandler.sendMessageToUser(username,new TextMessage(crop.getLand()));
					System.out.println("11111111111111111");
				}catch(Exception e) {
					System.out.println("000000000000000");
				}
			}
		}
	}
}
