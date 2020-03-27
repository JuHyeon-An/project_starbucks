package bean;

import java.io.File;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

public class ReviewUp {

	String dir="c:/Users/uk/git/project_starbucks/starbucks/WebContent/review_img/";
	String temp="c:/temp/";
	
	int maxSize=1024*1024*50;
	
	HttpServletRequest req;
	HttpServletResponse resp;
	
	public ReviewUp(HttpServletRequest req, HttpServletResponse resp) {
		this.req=req;
		this.resp=resp;
	}
	public boolean encCheck() {
		boolean flag = ServletFileUpload.isMultipartContent(req);
		return flag;
	}
	public ReviewVo upload() {
		ReviewVo vo=new ReviewVo();
		Review_imgs imgs=new Review_imgs();
		List<String> list2=new ArrayList<String>(); 
		DiskFileItemFactory factory=new DiskFileItemFactory();
		
		factory.setSizeThreshold(4096);
		factory.setRepository(new File(temp));
		
		ServletFileUpload sfu=new ServletFileUpload(factory);
		
		sfu.setHeaderEncoding("utf-8");
		sfu.setFileSizeMax(maxSize);

		try {
			List<FileItem> list=sfu.parseRequest(req);
			for(FileItem fileitem:list) {
				String key=fileitem.getFieldName();
				String value=fileitem.getString("utf-8");
				
				if(fileitem.isFormField()) {
					switch(key) {
					case"member_id":
						vo.setMember_id(value);
						break;
					case"item_code":
						vo.setItem_code(value);
						break;
					case"review_title":
						vo.setReview_title(value);
						break;
					case"review_content":
						vo.setReview_content(value);
						break;
					case"review_like":
						vo.setReview_like(Integer.parseInt(value));
						break;
					default: break;
					}
				}else {
					if(fileitem.getSize()>0) { 
						String filename=fileitem.getName();
						String sysFile="";
						if(filename!=null) {
							sysFile=new Date().getTime()+"-"+filename;
						}
						list2.add(sysFile);
						File filef=new File(dir+sysFile);
						fileitem.write(filef);
						fileitem.delete();
					}
				}
			}
			imgs.setSys_imgs(list2);
			vo.setReview_img(imgs);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return vo;
	}
}
