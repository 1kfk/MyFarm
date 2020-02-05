package cn.jxufe.utils;

import java.io.File;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.MultipartFile;

import cn.jxufe.bean.Message;

public class FileSaver {

	public static Message save(String string, HttpServletRequest request, MultipartFile file) {
		Message mes=new Message();
		// 判断文件是否为空  
        if (!file.isEmpty()) {  
            try {  
                // 文件保存路径  
                String filePath = request.getSession().getServletContext().getRealPath("/") + "images/head/"  
                        + file.getOriginalFilename();  
                // 转存文件  
                file.transferTo(new File(filePath));  
                mes.setCode(0);
                mes.setMsg(file.getOriginalFilename());
                System.out.println("-----------------------------"+mes.getMsg());
                
            } catch (Exception e) {  
            	mes.setCode(-1);
                mes.setMsg("上传失败");
                e.printStackTrace();  
            }  
        }  
        else {
        	mes.setCode(1);
        	mes.setMsg("文件为空");
        }
        return mes;
	}

}
