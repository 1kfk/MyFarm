package cn.jxufe.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import cn.jxufe.bean.Message;
import cn.jxufe.utils.FileSaver;

@Controller
@RequestMapping(value="file")
public class FileController {
	@RequestMapping(value="saveHeadImg",produces=MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public Message saveHeadImg(HttpServletRequest request,@RequestParam("filePathName") MultipartFile uploadFile) {
		return FileSaver.save("farm/images/head/",request,uploadFile);
	}
}