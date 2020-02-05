package cn.jxufe.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import cn.jxufe.entity.CropState;

public interface CropStateDAO extends JpaRepository<CropState, Long>{
	public CropState findByNum(int num);
}
