package cn.jxufe.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.jxufe.entity.SeedType;
import cn.jxufe.service.SeedTypeService;

@Controller
@RequestMapping(value="seedType")
public class SeedTypeController {

	@Autowired
	private SeedTypeService seedTypeService;
	@RequestMapping(value="chosedata",produces=MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public Iterable<SeedType> chosedata(){
		return seedTypeService.findAll();
	}
	
	/**
     * @param request
     * @return
     */
    @RequestMapping(value="/seedTypeData",method= {RequestMethod.POST})
    @ResponseBody
    public SeedType seedTypeGet(HttpServletRequest request) {
    	String param=request.getParameter("num");
    	int num=Integer.parseInt(param);
    	return seedTypeService.getTypeByNum(num);
    }
}
