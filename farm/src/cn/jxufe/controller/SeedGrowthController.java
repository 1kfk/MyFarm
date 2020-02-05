package cn.jxufe.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.jxufe.bean.Message;
import cn.jxufe.entity.SeedGrowth;
import cn.jxufe.service.SeedGrowthService;

@Controller
@RequestMapping(value="seedGrowth")
public class SeedGrowthController {
	@Autowired
	SeedGrowthService seedGrowthService;
	
	
	private int seedid;
	
	@RequestMapping(value="jsp")
	@ResponseBody
	public String getjsp(@RequestParam(value = "seedid", required = true) Integer seedId){
		seedid=seedId;
		return "...jsp";
	}
	
	@RequestMapping(value="gridData")
	@ResponseBody
	public List<SeedGrowth> getgrid(){
		return seedGrowthService.findBySeedId(seedid);
	}
	
	
	
	
	@RequestMapping(value="gridData/{seedId}")
	@ResponseBody
	public List<SeedGrowth> getgrid(@PathVariable Integer seedId){
		return seedGrowthService.findBySeedId(seedId);
	}
	
	@RequestMapping(value="save",produces=MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public Message savenew(SeedGrowth seedGrowth) {
		return seedGrowthService.save(seedGrowth);
	}
	
	@RequestMapping(value="delete",produces=MediaType.APPLICATION_JSON_VALUE,method= {RequestMethod.POST})
	@ResponseBody
	public Message deleteold(HttpServletRequest request) {
		String param=request.getParameter("id");
		Long id=(long)Integer.valueOf(param);
		return seedGrowthService.delete(id);
	}
}
