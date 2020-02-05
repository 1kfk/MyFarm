package cn.jxufe.service;


import java.util.List;

import org.springframework.data.domain.Pageable;

import cn.jxufe.bean.EasyUIData;
import cn.jxufe.bean.Message;
import cn.jxufe.entity.SeedList;
import cn.jxufe.entity.SeedType;
import cn.jxufe.entity.Soil;

public interface SeedListService {
	public EasyUIData<?> list(Pageable pageable);
	public EasyUIData<?> findSome(String seedName,Pageable pageable);
	public Message save(SeedList seedList);
	public Message delete(Long id);
	public List<SeedList> findAll();
}
