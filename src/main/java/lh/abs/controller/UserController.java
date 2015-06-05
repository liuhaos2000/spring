package lh.abs.controller;

import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import lh.abs.service.UserService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import lh.abs.model.MUser;

@Controller
@RequestMapping("/UserController")
public class UserController {
    
    @Autowired
	private UserService userService;
	
	@RequestMapping(value="/listUser")
	public String listUser(HttpServletRequest request) {
		
		List <MUser> list = userService.getAll();
		request.setAttribute("userlist", list);
		return "listUser";
	}
	
	@RequestMapping(value="/addUser")
	public String addUser(MUser muser) {
			
		String id = UUID.randomUUID().toString();
		muser.setUserId(id);
		userService.insert(muser);
		return "redirect:/muserController/listUser.do";
	}
	
	@RequestMapping(value="/deleteUser")
	public String deleteUser(String id) {
		
	    userService.delete(id);
		return "redirect:/muserController/listUser.do";
	}
	
	@RequestMapping(value="/updateUserUI")
	public String updateUserUI(String id, HttpServletRequest request) {
		
		MUser muser = userService.selectByPrimaryKey(id);
		request.setAttribute("user", muser);
		return "updateUser";
	}

	@RequestMapping(value="/updateUser")
	public String updateUser(MUser muser) {
		
	    userService.update(muser);
		return "redirect:/muserController/listUser.do";
	}
}
