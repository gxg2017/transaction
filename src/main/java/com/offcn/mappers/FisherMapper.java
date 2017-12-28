package com.offcn.mappers;

import com.offcn.pojo.Fisher;

public interface FisherMapper {

	public Fisher identifyFisher(Fisher fisher);

	public void saveFisher(Fisher fisher);

	public Fisher getFisher(Integer id);

	public void updateFisher(Fisher fisher);

	public void updatePassword(Fisher fisher);

	public void updateShipAddress(Fisher fisher);

}
