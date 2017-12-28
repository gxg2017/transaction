package com.offcn.serviceImpl;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.multipart.MultipartFile;

import com.offcn.mappers.IdleMapper;
import com.offcn.pojo.Idle;
import com.offcn.pojo.QueryVo;
import com.offcn.service.IdleService;

@Controller("idleService")
public class IdleServiceImpl implements IdleService {

	@Autowired
	private IdleMapper idleMapper;

	@Override
	public List<Idle> getIdleList() {

		List<Idle> idleList = idleMapper.getIdleList();

		return idleList;

	}

	@Override
	public void saveIdle(Idle idle, MultipartFile file) {

		String fileName = sumName(file);

		File newFile = new File("D:/upload/" + fileName);

		try {
			file.transferTo(newFile);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		idle.setIdleimg(fileName);

		idleMapper.saveIdle(idle);

	}

	public String getRandomName(MultipartFile file) {

		String fileName = file.getOriginalFilename();

		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");

		String randomName = sdf.format(new Date());

		return randomName;

	}

	public String getExt(MultipartFile file) {

		String fileName = file.getOriginalFilename();

		String ext = fileName.substring(fileName.lastIndexOf("."));

		return ext;

	}

	public String sumName(MultipartFile file) {

		return getRandomName(file) + getExt(file);
	}

	@Override
	public List<Idle> getIdleListById(Integer id) {
		List<Idle> idleList = idleMapper.getIdleListById(id);
		return idleList;
	}

	@Override
	public Idle getIdleById(Integer id) {
		Idle idle = idleMapper.getIdleById(id);
		return idle;
	}

	@Override
	public void updateIdle(Idle idle) {
		idleMapper.updateIdle(idle);

	}

	@Override
	public void updateIdleStateById(Integer id, Integer state) {

		QueryVo query = new QueryVo();

		query.setId(id);

		query.setTransfer_state(state);

		idleMapper.updateIdleStateById(query);

	}

}
