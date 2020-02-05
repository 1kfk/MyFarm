package cn.jxufe.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.jxufe.bean.EasyUIData;
import cn.jxufe.bean.EasyUIDataPageRequest;
import cn.jxufe.bean.Message;
import cn.jxufe.entity.SeedList;
import cn.jxufe.entity.SeedType;
import cn.jxufe.entity.Soil;
import cn.jxufe.service.SeedListService;

/**
 * @author hound
 *
 */
@Controller
@RequestMapping("seedList")
public class SeedListController {
	@Autowired
	private SeedListService seedListService;
	/**
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/seed/grid")
    public String grid() throws Exception {
        return "seed/grid";
    }
     
    /**
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/gridData", produces = MediaType.APPLICATION_JSON_VALUE)
    @ResponseBody
    public EasyUIData<?> gridData(EasyUIDataPageRequest pageRequest,@RequestParam(defaultValue="") String seedName) throws Exception {
    	List<Sort.Order> orders = new ArrayList<Sort.Order>();
        if (pageRequest.getOrder().equals("asc")) {
            orders.add(new Sort.Order(Direction.ASC, pageRequest.getSort()));
        } else {
            orders.add(new Sort.Order(Direction.DESC, pageRequest.getSort()));
        }
        System.out.println(pageRequest.getPage()+"======"+pageRequest.getRows());
        Pageable pageable = new PageRequest(pageRequest.getPage() - 1, pageRequest.getRows(), new Sort(orders));
        System.out.println("wode"+seedName);
        
        if("".equals(seedName)) {
        	return seedListService.list(pageable);
        }
        else if("茄".equals(seedName)) {
        	return seedListService.findSome("茄子",pageable);
        }
        else {
			return seedListService.findSome(seedName,pageable);
		}
    }
    
    @RequestMapping(value="save",produces=MediaType.APPLICATION_JSON_VALUE)
    @ResponseBody
    public Message save(SeedList seedList,Model model){       
        return seedListService.save(seedList);
    }
    
    @RequestMapping(value="delete",produces=MediaType.APPLICATION_JSON_VALUE,method= {RequestMethod.POST})
    @ResponseBody
    public Message delete(HttpServletRequest request){  
    	String param=request.getParameter("id");
    	long id=(long)Integer.parseInt(param);
        return seedListService.delete(id);
    }
}
