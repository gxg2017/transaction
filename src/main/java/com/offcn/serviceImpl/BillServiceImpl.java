package com.offcn.serviceImpl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.offcn.mappers.BillMapper;
import com.offcn.pojo.Bill;
import com.offcn.service.BillService;

@Service("billService")
public class BillServiceImpl implements BillService {

	@Autowired
	private BillMapper billMapper;

	@Override
	public void insertBill(Bill bill) {
		billMapper.insertBill(bill);

	}

}
