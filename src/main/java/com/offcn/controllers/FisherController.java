package com.offcn.controllers;

import java.sql.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import com.offcn.pojo.Bill;
import com.offcn.pojo.Fisher;
import com.offcn.pojo.Idle;
import com.offcn.pojo.IdleType;
import com.offcn.service.BillService;
import com.offcn.service.FisherService;
import com.offcn.service.IdleService;
import com.offcn.service.IdleTypeService;

@Controller
public class FisherController {

	@Autowired
	private FisherService fisherService;
	@Autowired
	private IdleTypeService idleTypeService;
	@Autowired
	private IdleService idleService;
	@Autowired
	private BillService billService;
	String msg = "";

	/**
	 * 
	 @Title 验证用户登录
	 * @Author 抽刀断水
	 * @Description
	 * @param
	 * @rString
	 * @DateTime 2017年12月14日 上午9:01:05
	 * @throws
	 */
	@RequestMapping(value = "/identifyFisher.action")
	public String identifyFisher(Fisher fisher, Model model,
			HttpServletRequest request) {

		Fisher retFisher = fisherService.identifyFisher(fisher);

		if (retFisher == null) {
			msg = "登录失败";
			model.addAttribute("msg", msg);
			return "login";
		} else {

			request.getSession().setAttribute("fisher", retFisher);

			model.addAttribute("retFisher", retFisher);

			return "redirect:/initPage.action";
		}

	}

	/**
	 * 
	 @Title 初始化主页
	 * @Author 抽刀断水
	 * @Description
	 * @param
	 * @rString
	 * @DateTime 2017年12月14日 上午8:59:57
	 * @throws
	 */
	@RequestMapping(value = "/initPage.action")
	public String initPage(Model model) {
		List<IdleType> idleTypeList = idleTypeService.getIdleTypeList();
		List<Idle> idleList = idleService.getIdleList();

		model.addAttribute("idleTypeList", idleTypeList);
		model.addAttribute("idleList", idleList);

		return "index";

	}

	/**
	 * 
	 @Title 保存平台用户信息
	 * @Author 抽刀断水
	 * @Description
	 * @param
	 * @rString
	 * @DateTime 2017年12月14日 上午8:58:50
	 * @throws
	 */
	@RequestMapping(value = "/saveFisher.action")
	public String saveFisher(Fisher fisher, Model model,
			HttpServletRequest request) {
		fisherService.saveFisher(fisher);

		Integer id = fisher.getId();

		Fisher retFisher = fisherService.getFisher(id);

		request.getSession().setAttribute("fisher", retFisher);

		model.addAttribute("fisher", retFisher);

		return "redirect:/initPage.action";
	}

	/**
	 * 
	 @Title 完善平台用户信息
	 * @Author 抽刀断水
	 * @Description
	 * @param
	 * @rString
	 * @DateTime 2017年12月14日 上午8:57:41
	 * @throws
	 */
	@RequestMapping(value = "/updateFisher.action")
	public String updateFisher(Fisher fisher, HttpServletRequest request,
			Model model, String brith) {

		Integer id = fisher.getId();

		Date br = Date.valueOf(brith);

		fisher.setBirthday(br);

		fisherService.updateFisher(fisher);

		Fisher retFisher = fisherService.getFisher(id);

		if (retFisher != null) {
			msg = "完善成功，请继续其他操作";
		} else {
			msg = "完善失败，请继续完善";
		}
		model.addAttribute("msg", msg);
		request.getSession().setAttribute("fisher", retFisher);

		return "updateInfo";
	}

	/**
	 * 
	 @Title 保存闲置商品
	 * @Author 抽刀断水
	 * @Description
	 * @param
	 * @rString
	 * @DateTime 2017年12月14日 上午8:57:02
	 * @throws
	 */
	@RequestMapping(value = "/saveIdle.action")
	public String saveIdle(Idle idle, Model model, MultipartFile img,
			HttpServletRequest request) {

		Fisher fisher = (Fisher) request.getSession().getAttribute("fisher");
		Integer fid = fisher.getId();

		idle.setFk_fisher(fid);

		idleService.saveIdle(idle, img);

		return "redirect:/initPage.action";
	}

	/**
	 * 显示发布闲置页面，初始化页面
	 */
	@RequestMapping(value = "showPublishPage.action")
	public String showPublishPage(Model model) {
		List<IdleType> idleTypeList = idleTypeService.getIdleTypeList();
		model.addAttribute("idleTypeList", idleTypeList);

		return "publish";
	}

	/**
	 * 自己的闲置商品查询
	 */
	@RequestMapping(value = "getMyIdleList.action")
	public String getMyIdleList(Model model, HttpServletRequest request) {

		Fisher fisher = (Fisher) request.getSession().getAttribute("fisher");

		Integer fid = fisher.getId();

		List<Idle> myIdleList = idleService.getIdleListById(fid);

		model.addAttribute("myIdleList", myIdleList);

		return "myProduct";

	}

	/**
	 * 
	 * 查询单个商品，显示商品详情页
	 */
	@RequestMapping(value = "getIdleById.action")
	public String getIdleById(Integer id, Model model) {
		Idle idle = idleService.getIdleById(id);
		model.addAttribute("idle", idle);
		return "productInfo";
	}

	/**
	 * 
	 @Title 用户在详情页点击立即购买跳转到支付购买页面
	 * @Author 抽刀断水
	 * @Description
	 * @param
	 * @rString
	 * @DateTime 2017年12月13日 下午10:48:14
	 * @throws
	 */
	@RequestMapping(value = "buyIdlePage.action")
	public String buyIdlePage(Idle idle, Model model) {

		Integer amount = idle.getAmount();

		Integer id = idle.getId();
		// 跳入交易页面改变商品交易状态
		idleService.updateIdleStateById(id, 1);

		Idle retIdle = idleService.getIdleById(id);

		retIdle.setAmount(amount);

		Integer fid = retIdle.getFk_fisher();

		Fisher fisher = fisherService.getFisher(fid);

		model.addAttribute("fisher", fisher);

		model.addAttribute("newIdle", retIdle);

		return "buyProduct";

	}

	/**
	 * 
	 @Title 用户下单（模拟下单）
	 * @Author 抽刀断水
	 * @Description
	 * @param
	 * @rString
	 * @DateTime 2017年12月13日 下午11:50:07
	 * @throws
	 */
	@RequestMapping(value = "placeOrder.action")
	public String placeOrder(Bill bill, Idle idle, Model model) {

		billService.insertBill(bill);

		idle.setTransfer_state(2);

		idleService.updateIdle(idle);

		msg = "购买成功，请选择其他 操作";

		model.addAttribute("msg", msg);

		return "success";

	}

	/**
	 * 用户修改密码
	 */
	@RequestMapping(value = "updatePassword.action")
	public String updatePassword(Fisher fisher, HttpServletRequest request) {
		fisherService.updatePassword(fisher);
		request.getSession().removeAttribute("fisher");
		return "login";

	}

	/**
	 * 添加地址
	 */
	@RequestMapping(value = "updateShipAddress.action")
	public String updateShipAddress(Fisher fisher, HttpServletRequest request,
			Model model) {
		Integer id = fisher.getId();
		fisherService.updateShipAddress(fisher);
		Fisher retFisher = fisherService.getFisher(id);
		request.getSession().setAttribute("fisher", retFisher);

		msg = "修改成功，请选择其他操作";

		model.addAttribute("msg", msg);

		return "redirect:/updateInfo";

	}
}
