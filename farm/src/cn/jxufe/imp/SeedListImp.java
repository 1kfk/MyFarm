package cn.jxufe.imp;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import cn.jxufe.bean.EasyUIData;
import cn.jxufe.bean.Message;
import cn.jxufe.dao.SeedListDAO;
import cn.jxufe.dao.SeedTypeDAO;
import cn.jxufe.dao.SoilDAO;
import cn.jxufe.entity.SeedList;
import cn.jxufe.entity.SeedType;
import cn.jxufe.entity.Soil;
import cn.jxufe.service.SeedListService;

/**
 * @author hound
 *
 */
@Service 
public class SeedListImp implements SeedListService {
	
	/**
	 * 
	 */
	@Autowired
	SeedListDAO seedListDAO;
	/* (non-Javadoc)
	 * @see cn.jxufe.service.SeedListService#list()
	 */
	@Override
	public EasyUIData<?> list(Pageable pageable) {
		Page<SeedList> page = seedListDAO.findAll(pageable);
        EasyUIData<SeedList> easyUIData = new EasyUIData<SeedList>();
        easyUIData.setTotal(page.getTotalElements());
        System.out.println("+++++++++++++++++++++++++"+easyUIData.getTotal());
//        页数
		easyUIData.setRows(page.getContent());
		System.out.println("++++++++++++++++++++++++++"+easyUIData.getRows().size());
//		行数
        return easyUIData;
	}
	/* (non-Javadoc)
	 * @see cn.jxufe.service.SeedListService#findSome(java.lang.String, org.springframework.data.domain.Pageable)
	 */
	@Override
	public EasyUIData<?> findSome(String seedName, Pageable pageable) {
		Page<SeedList> page=seedListDAO.findBySeedNameLike(seedName, pageable);
		EasyUIData<SeedList> easyUIData =new EasyUIData<SeedList>();
		easyUIData.setTotal(page.getTotalElements());
		easyUIData.setRows(page.getContent());
		return easyUIData;
	}
	
	public List<SeedList> findAll() {
		return (List<SeedList>) seedListDAO.findAll();
	}
	
	@Override
	public Message save(SeedList seedList) {
		Message message=new Message();
		try {
			seedListDAO.save(seedList);
			message.setCode(0);
			message.setMsg("保存成功");
		}catch (Exception e) {
			message.setCode(-10);
			message.setMsg("保存失败");
		}
		return message;
	}
	@Override
	public Message delete(Long id) {
		Message message = new Message();
        try {
            seedListDAO.delete(id);
            message.setCode(0);
            message.setMsg("删除成功");
        }catch(Exception e) {
            message.setCode(-10);
            message.setMsg("删除失败");
        }
        return message;
	}

}
