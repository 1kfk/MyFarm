package cn.jxufe.service;

import java.util.List;

import cn.jxufe.bean.Message;
import cn.jxufe.entity.SeedGrowth;

public interface SeedGrowthService {
	public List<SeedGrowth> findBySeedId(int seedId);
	public Message save(SeedGrowth seedGrowth);
	public Message delete(Long id);
}
