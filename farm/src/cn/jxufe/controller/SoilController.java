package cn.jxufe.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.jxufe.entity.Soil;
import cn.jxufe.service.SoilService;

@Controller
@RequestMapping(value="soil")
public class SoilController {
	@Autowired
	private SoilService soilService;
	@RequestMapping(value="chosedata",produces=MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public Iterable<Soil> chosedata(){
		return soilService.findAll();
	}
	
	/**
     * @param request
     * @return
     */
    @RequestMapping(value="/soilData",method= {RequestMethod.POST})
    @ResponseBody
    public Soil soilGet(HttpServletRequest request) {
    	String param=request.getParameter("num");
    	int num=Integer.parseInt(param);
    	return soilService.getSoilByNum(num);
    }
}
