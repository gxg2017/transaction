package com.offcn.service;

import com.offcn.pojo.Fisher;

public interface FisherService {
	public Fisher identifyFisher(Fisher fisher);

	public void saveFisher(Fisher fisher);

	public Fisher getFisher(Integer id);

	public void updateFisher(Fisher fisher);

	public void updatePassword(Fisher fisher);

	public void updateShipAddress(Fisher fisher);

}
