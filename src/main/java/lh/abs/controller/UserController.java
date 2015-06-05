package lh.abs.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import lh.abs.service.UserService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import lh.abs.model.MUser;

@Controller
@RequestMapping("/user")
public class UserController {
    
    @Autowired
	private UserService userService;
    
    @RequestMapping(value="/init")
    public String initUser(HttpServletRequest request, ModelMap modelMap) {
        modelMap.put("pageSize", 10);
        return "abs/user/userlist";
    }
	
	@RequestMapping(value="/doSearch")
	@ResponseBody
	public Map<String, Object> listUser(HttpServletRequest request) {
	    Map<String, Object> result = new HashMap<String, Object>();
        
	    List<MUser> userList = userService.getAll();
	    int count = 0;
	    if(userList!=null){
	        count = userList.size();
	    }
	    
	    result.put("total", count);
	    result.put("rows", userList);
	    return result;
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
