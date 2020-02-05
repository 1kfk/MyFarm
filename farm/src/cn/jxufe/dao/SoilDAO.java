package cn.jxufe.dao;

import org.springframework.data.jpa.repository.JpaRepository;

import cn.jxufe.entity.Soil;

public interface SoilDAO extends JpaRepository<Soil, Long> {
	public Soil findByNum(int num);
}
