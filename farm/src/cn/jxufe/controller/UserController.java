package cn.jxufe.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

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
import cn.jxufe.entity.User;
import cn.jxufe.service.FarmService;
import cn.jxufe.service.UserService;

@Controller
@RequestMapping(value="/user")
public class UserController {
	@Autowired
	private UserService userService;
	@Autowired
	private FarmService farmService;
	
	@RequestMapping(value="/user/grid")
	public String grid() {
		return "userManage/grid";
	}
	
	@RequestMapping(value="choseuser")
	public String chose() {
		return "choseuser/grid";
	}
	
	@RequestMapping(value="/chosedata",produces=MediaType.APPLICATION_JSON_VALUE)
    @ResponseBody
    public Iterable<User> data() throws Exception {
        return userService.findAll();        
    }
	
	@RequestMapping(value="/datagrid",produces= MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public EasyUIData<?> getdata(EasyUIDataPageRequest pageRequest,@RequestParam(defaultValue="") String userName){
		List<Sort.Order> orders=new ArrayList<Sort.Order>();
		if(pageRequest.getOrder().equals("asc")) {
			orders.add(new Sort.Order(Direction.ASC, pageRequest.getSort()));
		}else {
			orders.add(new Sort.Order(Direction.DESC, pageRequest.getSort()));
		}
		Pageable pageable=new PageRequest(pageRequest.getPage()-1, pageRequest.getRows(), new Sort(orders));
		if("".equals(userName)) {
			return userService.list(pageable);
		}
		else {
			return userService.findSome(userName, pageable);
		}
	}
	
	@RequestMapping(value="/save",produces=MediaType.APPLICATION_JSON_VALUE)
    @ResponseBody
    public Message save(User user,Model model){       
        return userService.save(user);
    }
    
    @RequestMapping(value="/delete",produces=MediaType.APPLICATION_JSON_VALUE)
    @ResponseBody
    public Message delete(User user,Model model){     
        return userService.delete(user);
    }
	
    @RequestMapping(value="updataPic",produces=MediaType.APPLICATION_JSON_VALUE,method= {RequestMethod.POST})
    public void upPic(HttpServletRequest request) {
		String id=request.getParameter("id");
		String pic=request.getParameter("pic");
		long Id=(long)Integer.parseInt(id);
		userService.uppic(Id, pic); 
		}
    
	@RequestMapping(value="/updatamenu",produces=MediaType.APPLICATION_JSON_VALUE,method= {RequestMethod.POST})
	@ResponseBody
	public Message up(HttpSession session,HttpServletRequest request) {
		return farmService.setCurUser(session, request);
	}
}
