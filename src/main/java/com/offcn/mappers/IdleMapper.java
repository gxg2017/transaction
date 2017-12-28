package com.offcn.mappers;

import java.util.List;

import com.offcn.pojo.Idle;
import com.offcn.pojo.QueryVo;

public interface IdleMapper {

	public List<Idle> getIdleList();

	public void saveIdle(Idle idle);

	public List<Idle> getIdleListById(Integer id);

	public Idle getIdleById(Integer id);

	public void updateIdle(Idle idle);

	public void updateIdleStateById(QueryVo query);

}
