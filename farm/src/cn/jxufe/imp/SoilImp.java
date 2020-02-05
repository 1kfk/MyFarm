package cn.jxufe.imp;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.jxufe.dao.SoilDAO;
import cn.jxufe.entity.Soil;
import cn.jxufe.service.SoilService;
@Service
public class SoilImp implements SoilService {
	@Autowired
	private SoilDAO soilDAO;
	@Override
	public Iterable<Soil> findAll() {
		// TODO Auto-generated method stub
		return soilDAO.findAll();
	}
	
	/* (non-Javadoc)
	 * @see cn.jxufe.service.SeedListService#getSoilByNum(int)
	 */
	@Override
	public Soil getSoilByNum(int num) {
		// TODO Auto-generated method stub
		return soilDAO.findByNum(num);
	}
}
