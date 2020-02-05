package cn.jxufe.service;

import cn.jxufe.entity.CropState;

public interface CropStateService {
	public CropState findByNum(int num);
	public Iterable<CropState> findAll();
}
