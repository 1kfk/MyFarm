package cn.jxufe.service;

import cn.jxufe.entity.SeedType;

public interface SeedTypeService {
	public Iterable<SeedType> findAll();
	public SeedType getTypeByNum(int num);
}
