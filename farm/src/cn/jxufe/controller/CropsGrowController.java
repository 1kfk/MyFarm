package cn.jxufe.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.jxufe.bean.Message;
import cn.jxufe.entity.Crop;
import cn.jxufe.entity.SeedGrowth;
import cn.jxufe.entity.SeedList;
import cn.jxufe.entity.User;
import cn.jxufe.service.CropsGrowService;

@Controller
@RequestMapping(value = "cropsGrow")
public class CropsGrowController {
	@Autowired
	private CropsGrowService cropsGrowService;

	@RequestMapping(value = "grid")
	public String getgrid() {
		return "cropsGrow/grid";
	}

	@RequestMapping(value = "findseed")
	@ResponseBody
	public SeedList findseed(HttpServletRequest request) {
		String id = request.getParameter("id");
		int seedid = Integer.parseInt(id);
		return cropsGrowService.findseed(seedid);
	}

	@RequestMapping(value = "getcrops", produces = MediaType.APPLICATION_JSON_VALUE, method = { RequestMethod.POST })
	@ResponseBody
	public List<Crop> getcrops(HttpServletRequest request) {
		String name = request.getParameter("userName");
		return cropsGrowService.getCrops(name);
	}

	@RequestMapping(value = "getcropxy", produces = MediaType.APPLICATION_JSON_VALUE, method = { RequestMethod.POST })
	@ResponseBody
	public SeedGrowth getcropxy(HttpServletRequest request) {
		String id = request.getParameter("seedid");
		int seedid=Integer.parseInt(id);
		String state=request.getParameter("seedstate");
		int seedstate=Integer.parseInt(state);
		return cropsGrowService.getCropxy(seedid,seedstate);
	}
	
	@RequestMapping(value = "seedplant", produces = MediaType.APPLICATION_JSON_VALUE, method = { RequestMethod.POST })
	@ResponseBody
	public Message aseedplant(HttpServletRequest request,HttpSession session) {
		return cropsGrowService.Aseedplant(request, session);
	}
	
	@RequestMapping(value="killbug",produces=MediaType.APPLICATION_JSON_VALUE,method= {RequestMethod.POST})
	@ResponseBody
	public Message killabug(HttpServletRequest request,HttpSession session) {
		return cropsGrowService.killbug( request, session);
	}
	
	@RequestMapping(value="cleanland",produces=MediaType.APPLICATION_JSON_VALUE,method= {RequestMethod.POST})
	@ResponseBody
	public Message cleanland(HttpServletRequest request,HttpSession session) {
		return cropsGrowService.cleanland( request, session);
	}
	
	@RequestMapping(value="harvest",produces=MediaType.APPLICATION_JSON_VALUE,method= {RequestMethod.POST})
	@ResponseBody
	public Message harvest(HttpServletRequest request,HttpSession session) {
		return cropsGrowService.harvest( request, session);
	}
	
	@RequestMapping(value="getacrop",produces=MediaType.APPLICATION_JSON_VALUE,method= {RequestMethod.POST})
	@ResponseBody
	public Crop getacrop(HttpServletRequest request,HttpSession session) {
		return cropsGrowService.getacrop( request, session);
	}
}
