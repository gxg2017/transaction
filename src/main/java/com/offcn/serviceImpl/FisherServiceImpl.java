package com.offcn.serviceImpl;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.offcn.mappers.FisherMapper;
import com.offcn.pojo.Fisher;
import com.offcn.service.FisherService;

@Service("fisherService")
public class FisherServiceImpl implements FisherService {

	@Autowired
	private FisherMapper fisherMapper;

	@Override
	public Fisher identifyFisher(Fisher fisher) {
		Fisher retFisher = fisherMapper.identifyFisher(fisher);

		return retFisher;
	}

	@Override
	public void saveFisher(Fisher fisher) {

		Date date = new Date();

		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

		String nowTime = sdf.format(date);

		Timestamp dates = Timestamp.valueOf(nowTime);

		fisher.setRegistration_date(dates);

		fisherMapper.saveFisher(fisher);

	}

	@Override
	public Fisher getFisher(Integer id) {
		Fisher retFisher = fisherMapper.getFisher(id);

		return retFisher;
	}

	@Override
	public void updateFisher(Fisher fisher) {

		fisherMapper.updateFisher(fisher);

	}

	@Override
	public void updatePassword(Fisher fisher) {
		fisherMapper.updatePassword(fisher);

	}

	@Override
	public void updateShipAddress(Fisher fisher) {
		fisherMapper.updateShipAddress(fisher);

	}

}
