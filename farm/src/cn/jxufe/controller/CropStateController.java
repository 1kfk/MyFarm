package cn.jxufe.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.jxufe.entity.CropState;
import cn.jxufe.entity.SeedGrowth;
import cn.jxufe.service.CropStateService;

@Controller
@RequestMapping(value="cropState")
public class CropStateController {
	@Autowired
	private CropStateService cropStateService;
	@RequestMapping(value="stateData",method= {RequestMethod.POST})
	@ResponseBody
	public CropState getStateData(HttpServletRequest request) {
		String param=request.getParameter("num");
    	int num=Integer.parseInt(param);
    	return cropStateService.findByNum(num);
	}
	
	@RequestMapping(value="chosedata",produces=MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public Iterable<CropState> chosedata(){
		return cropStateService.findAll();
	}
	
}
