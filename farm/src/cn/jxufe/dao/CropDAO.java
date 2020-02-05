package cn.jxufe.dao;

import java.util.Date;
import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import cn.jxufe.entity.Crop;
import cn.jxufe.entity.SeedGrowth;

public interface CropDAO extends JpaRepository<Crop, Long>{
	public List<Crop> findByUsername(String username);
	public List<Crop> findByNexttimeLessThan(Date time);
	public Crop findByUsernameAndLand(String username,String land);
}
