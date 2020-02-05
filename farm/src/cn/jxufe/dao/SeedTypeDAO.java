package cn.jxufe.dao;

import org.springframework.data.jpa.repository.JpaRepository;

import cn.jxufe.entity.SeedType;

public interface SeedTypeDAO extends JpaRepository<SeedType, Long>{
	public SeedType findByNum(int num);
}
