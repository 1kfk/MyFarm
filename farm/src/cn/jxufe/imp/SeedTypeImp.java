package cn.jxufe.imp;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.jxufe.dao.SeedTypeDAO;
import cn.jxufe.entity.SeedType;
import cn.jxufe.service.SeedTypeService;
@Service
public class SeedTypeImp implements SeedTypeService {
	@Autowired
	SeedTypeDAO seedTypeDAO;
	@Override
	public Iterable<SeedType> findAll() {
		// TODO Auto-generated method stub
		return seedTypeDAO.findAll();
	}
	
	/* (non-Javadoc)
	 * @see cn.jxufe.service.SeedListService#getTypeById()
	 */
	@Override
	public SeedType getTypeByNum(int num) {
		return seedTypeDAO.findByNum(num);
	}

}
