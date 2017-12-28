package com.offcn.serviceImpl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.offcn.mappers.IdleTypeMapper;
import com.offcn.pojo.IdleType;
import com.offcn.service.IdleTypeService;

@Service("idleTypeService")
public class IdleTypeServiceImpl implements IdleTypeService {

	@Autowired
	private IdleTypeMapper idleTypeMapper;

	@Override
	public List<IdleType> getIdleTypeList() {
		List<IdleType> idleTypeList = idleTypeMapper.getIdelTypeList();

		List<IdleType> newList = new ArrayList<IdleType>();

		for (IdleType idleType : idleTypeList) {
			String enumerate = idleType.getEnumerate();
			String[] a = enumerate.split(",");
			idleType.setEnumerateArr(a);
			newList.add(idleType);
		}

		return newList;

	}

}
