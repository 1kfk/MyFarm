package cn.jxufe.test;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import cn.jxufe.bean.EasyUIData;
import cn.jxufe.entity.SeedList;
import cn.jxufe.service.SeedListService;

@RunWith(SpringJUnit4ClassRunner.class) 
@WebAppConfiguration
@ContextConfiguration(locations = "classpath:applicationContext.xml")  
public class TestDB {
	@Autowired
    private SeedListService seedListService;
    @Test
    public void testService() {      
        EasyUIData<?> result = seedListService.list(null);
    }
}
