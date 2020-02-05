package cn.jxufe.imp;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.jxufe.bean.Message;
import cn.jxufe.dao.SeedGrowthDAO;
import cn.jxufe.entity.SeedGrowth;
import cn.jxufe.entity.SeedList;
import cn.jxufe.service.SeedGrowthService;
@Service
public class SeedGrowthImp implements SeedGrowthService {
	@Autowired
	private SeedGrowthDAO seedGrowthDAO;
	@Override
	public List<SeedGrowth> findBySeedId(int seedId) {
		return seedGrowthDAO.findBySeedId(seedId);
	}
	@Override
	public Message save(SeedGrowth seedGrowth) {
		Message message=new Message();
		try {
			seedGrowthDAO.save(seedGrowth);
			message.setCode(0);
			message.setMsg("保存成功");
		}catch (Exception e) {
			message.setCode(-10);
			message.setMsg("保存失败");
		}
		return message;
	}
	@Override
	public Message delete(Long id) {
		Message message = new Message();
        try {
            seedGrowthDAO.delete(id);
            message.setCode(0);
            message.setMsg("删除成功");
        }catch(Exception e) {
            message.setCode(-10);
            message.setMsg("删除失败");
        }
        return message;
	}
}
