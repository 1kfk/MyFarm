package cn.jxufe.controller;

import java.sql.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.jxufe.bean.Message;
import cn.jxufe.entity.UserBag;
import cn.jxufe.service.SeedBuyService;
import cn.jxufe.service.SeedListService;
import cn.jxufe.utils.JsonDateValueProcessor;
import net.sf.json.JSONArray;
import net.sf.json.JsonConfig;

@Controller
@RequestMapping(value="seedBuy")
public class SeedBuyController {
	@Autowired
	private SeedListService seedListService;
	
	@Autowired
	private SeedBuyService seedBuyService;
	
	@RequestMapping("/grid1")
	public String getjsp() throws Exception{
		return "seedbuy/grid";
	}
	
	@RequestMapping(value="/grid")
    public String grid(Model model) throws Exception {
        JsonConfig jsonConfig = new JsonConfig();
        jsonConfig.registerJsonValueProcessor(Date.class, new JsonDateValueProcessor());
        model.addAttribute("data", JSONArray.fromObject(seedListService.findAll(), jsonConfig).toString());
        return "seedbuy/grid";
    } 
	
	@RequestMapping(value="/getBag",produces=MediaType.APPLICATION_JSON_VALUE,method= {RequestMethod.POST})
	@ResponseBody
	public List<UserBag> getbag(HttpServletRequest request){
		String name=(String) request.getParameter("name");
		return seedBuyService.findCurUser(name);
	}
	
	@RequestMapping(value="/buyseed",produces=MediaType.APPLICATION_JSON_VALUE,method= {RequestMethod.POST})
	@ResponseBody
	public Message buyseed(HttpServletRequest request,HttpSession session) {
		String name=(String) request.getParameter("name");
		String str=(String) request.getParameter("seed");
		int seed=Integer.parseInt(str);
		return seedBuyService.buyaseed(name, seed,session);
	}
}
