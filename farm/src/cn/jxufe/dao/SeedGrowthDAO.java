package cn.jxufe.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import cn.jxufe.entity.SeedGrowth;

public interface SeedGrowthDAO extends JpaRepository<SeedGrowth,Long>{
	public List<SeedGrowth> findBySeedId(int seedId);
	public SeedGrowth findBySeedIdAndGrowthNum(int seedId,int growNum);
}
