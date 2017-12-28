package com.offcn.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import com.offcn.pojo.Fisher;

public class HandlerInterceptor1 implements HandlerInterceptor {

	@Override
	public void afterCompletion(HttpServletRequest arg0,
			HttpServletResponse arg1, Object arg2, Exception arg3)
			throws Exception {
		// TODO Auto-generated method stub

	}

	@Override
	public void postHandle(HttpServletRequest arg0, HttpServletResponse arg1,
			Object arg2, ModelAndView arg3) throws Exception {
		// TODO Auto-generated method stub

	}

	@Override
	public boolean preHandle(HttpServletRequest request,
			HttpServletResponse response, Object arg2) throws Exception {
		String msg = "";
		Fisher fisher = (Fisher) request.getSession().getAttribute("fisher");

		if (fisher == null) {
			msg = "您好,您是非平台用户,请先注册";
			request.setAttribute("msg", msg);
			response.sendRedirect("/second-transaction/jsp/register.jsp");
			return false;
		} else {
			return true;
		}

	}

}
