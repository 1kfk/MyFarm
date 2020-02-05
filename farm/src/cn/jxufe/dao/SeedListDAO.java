package cn.jxufe.dao;


import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.repository.PagingAndSortingRepository;

import cn.jxufe.entity.SeedList;

public interface SeedListDAO extends PagingAndSortingRepository<SeedList, Long>{
	public Page<SeedList> findBySeedNameLike(String seedName,Pageable pageable);
	public SeedList findBySeedId(int seedId);
}
