package cn.jxufe.service;

import cn.jxufe.entity.Soil;

public interface SoilService {
	public Iterable<Soil> findAll();
	public Soil getSoilByNum(int num);
}
