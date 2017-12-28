package com.offcn.service;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import com.offcn.pojo.Idle;

public interface IdleService {
	public List<Idle> getIdleList();

	public void saveIdle(Idle idle, MultipartFile file);

	public List<Idle> getIdleListById(Integer id);

	public Idle getIdleById(Integer id);

	public void updateIdle(Idle idle);

	public void updateIdleStateById(Integer id, Integer state);
}
