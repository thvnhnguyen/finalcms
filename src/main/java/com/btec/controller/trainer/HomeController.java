package com.btec.controller.trainer;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.btec.dto.ClassDTO;
import com.btec.service.IClassService;
import com.btec.util.MessageUtil;

@Controller(value = "homeControllerOfTrainer")
public class HomeController {
	
	
	@Autowired
	private IClassService classService;
	
	@Autowired
	private MessageUtil messageUtil;
	
	@RequestMapping(value = "/trainer/home", method = RequestMethod.GET)
	   public ModelAndView trainerHome() {
	      ModelAndView mav = new ModelAndView("trainer/home");
	      return mav;
	   }
	
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	   public ModelAndView loginPage() {
	      ModelAndView mav = new ModelAndView("login");
	      return mav;
	   }
	
	@RequestMapping(value = "/trainer/manageclass", method = RequestMethod.GET)
	   public ModelAndView manageClass(@RequestParam("page") int page, @RequestParam("limit") int limit,
				HttpServletRequest request) {
		ClassDTO model = new ClassDTO();
		model.setPage(page);
		model.setLimit(limit);
		ModelAndView mav = new ModelAndView("trainer/manageclass");
		Pageable pageable = new PageRequest(page - 1, limit);
		model.setListResult(classService.findAll(pageable));
		model.setTotalItem(classService.getTotalItem());
		model.setTotalPage((int) Math.ceil((double) model.getTotalItem() / model.getLimit()));
		if (request.getParameter("message") != null) {
			Map<String, String> message = messageUtil.getMessage(request.getParameter("message"));
			mav.addObject("message", message.get("message"));
			mav.addObject("alert", message.get("alert"));
		}
		mav.addObject("model", model);
		return mav;
	   }
	
	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public ModelAndView logout(HttpServletRequest request, HttpServletResponse response) {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		if (auth != null) {
			new SecurityContextLogoutHandler().logout(request, response, auth);
		}
		return new ModelAndView("redirect:/trainer/home");
	}
	
	@RequestMapping(value = "/accessDenied", method = RequestMethod.GET)
	public ModelAndView accessDenied() {
		return new ModelAndView("redirect:/login?accessDenied");
	}
}
