package cn.jxufe.imp;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.jxufe.dao.CropStateDAO;
import cn.jxufe.entity.CropState;
import cn.jxufe.entity.SeedType;
import cn.jxufe.service.CropStateService;
@Service
public class CropStateImp implements CropStateService {
	@Autowired
	private CropStateDAO cropStateDAO;
	@Override
	public CropState findByNum(int num) {
		return cropStateDAO.findByNum(num);
	}
	@Override
	public Iterable<CropState> findAll() {
		return cropStateDAO.findAll();
	}
}
