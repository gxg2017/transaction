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
	 @Title ��֤�û���¼
	 * @Author �鵶��ˮ
	 * @Description
	 * @param
	 * @rString
	 * @DateTime 2017��12��14�� ����9:01:05
	 * @throws
	 */
	@RequestMapping(value = "/identifyFisher.action")
	public String identifyFisher(Fisher fisher, Model model,
			HttpServletRequest request) {

		Fisher retFisher = fisherService.identifyFisher(fisher);

		if (retFisher == null) {
			msg = "��¼ʧ��";
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
	 @Title ��ʼ����ҳ
	 * @Author �鵶��ˮ
	 * @Description
	 * @param
	 * @rString
	 * @DateTime 2017��12��14�� ����8:59:57
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
	 @Title ����ƽ̨�û���Ϣ
	 * @Author �鵶��ˮ
	 * @Description
	 * @param
	 * @rString
	 * @DateTime 2017��12��14�� ����8:58:50
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
	 @Title ����ƽ̨�û���Ϣ
	 * @Author �鵶��ˮ
	 * @Description
	 * @param
	 * @rString
	 * @DateTime 2017��12��14�� ����8:57:41
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
			msg = "���Ƴɹ����������������";
		} else {
			msg = "����ʧ�ܣ����������";
		}
		model.addAttribute("msg", msg);
		request.getSession().setAttribute("fisher", retFisher);

		return "updateInfo";
	}

	/**
	 * 
	 @Title ����������Ʒ
	 * @Author �鵶��ˮ
	 * @Description
	 * @param
	 * @rString
	 * @DateTime 2017��12��14�� ����8:57:02
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
	 * ��ʾ��������ҳ�棬��ʼ��ҳ��
	 */
	@RequestMapping(value = "showPublishPage.action")
	public String showPublishPage(Model model) {
		List<IdleType> idleTypeList = idleTypeService.getIdleTypeList();
		model.addAttribute("idleTypeList", idleTypeList);

		return "publish";
	}

	/**
	 * �Լ���������Ʒ��ѯ
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
	 * ��ѯ������Ʒ����ʾ��Ʒ����ҳ
	 */
	@RequestMapping(value = "getIdleById.action")
	public String getIdleById(Integer id, Model model) {
		Idle idle = idleService.getIdleById(id);
		model.addAttribute("idle", idle);
		return "productInfo";
	}

	/**
	 * 
	 @Title �û�������ҳ�������������ת��֧������ҳ��
	 * @Author �鵶��ˮ
	 * @Description
	 * @param
	 * @rString
	 * @DateTime 2017��12��13�� ����10:48:14
	 * @throws
	 */
	@RequestMapping(value = "buyIdlePage.action")
	public String buyIdlePage(Idle idle, Model model) {

		Integer amount = idle.getAmount();

		Integer id = idle.getId();
		// ���뽻��ҳ��ı���Ʒ����״̬
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
	 @Title �û��µ���ģ���µ���
	 * @Author �鵶��ˮ
	 * @Description
	 * @param
	 * @rString
	 * @DateTime 2017��12��13�� ����11:50:07
	 * @throws
	 */
	@RequestMapping(value = "placeOrder.action")
	public String placeOrder(Bill bill, Idle idle, Model model) {

		billService.insertBill(bill);

		idle.setTransfer_state(2);

		idleService.updateIdle(idle);

		msg = "����ɹ�����ѡ������ ����";

		model.addAttribute("msg", msg);

		return "success";

	}

	/**
	 * �û��޸�����
	 */
	@RequestMapping(value = "updatePassword.action")
	public String updatePassword(Fisher fisher, HttpServletRequest request) {
		fisherService.updatePassword(fisher);
		request.getSession().removeAttribute("fisher");
		return "login";

	}

	/**
	 * ��ӵ�ַ
	 */
	@RequestMapping(value = "updateShipAddress.action")
	public String updateShipAddress(Fisher fisher, HttpServletRequest request,
			Model model) {
		Integer id = fisher.getId();
		fisherService.updateShipAddress(fisher);
		Fisher retFisher = fisherService.getFisher(id);
		request.getSession().setAttribute("fisher", retFisher);

		msg = "�޸ĳɹ�����ѡ����������";

		model.addAttribute("msg", msg);

		return "redirect:/updateInfo";

	}
}
