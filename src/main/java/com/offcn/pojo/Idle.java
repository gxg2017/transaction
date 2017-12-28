package com.offcn.pojo;

import java.sql.Date;

public class Idle {

	/*
	 * `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '������Ϣ����', `name` varchar(50)
	 * DEFAULT NULL COMMENT '������Ʒ����', `idleimg` varchar(30) DEFAULT NULL COMMENT
	 * '������Ʒ��ͼƬ����', `amount` int(11) DEFAULT NULL COMMENT '����', `location`
	 * varchar(50) DEFAULT NULL COMMENT '�������ڵ�', `purchasing_date` date DEFAULT
	 * NULL COMMENT '����ʱ�䣨��ʽ��yyyy-MM-dd��', `original_price` double(8,2) DEFAULT
	 * NULL COMMENT '����۸�ԭ�ۣ�', `transfer_price` double(8,2) DEFAULT NULL
	 * COMMENT 'ת�ü�(�ۿۼ�)', `transfer_mode` int(11) DEFAULT NULL COMMENT
	 * '֧�ֵĽ��׷�ʽ��1.���Ͻ��ס�2.���½��ס�3.���߾��ɣ�', `transfer_state` int(11) DEFAULT NULL
	 * COMMENT '����״̬(1.���ڽ��ס�2.�ѽ��ס�3.δ����)', `percentage` int(11) DEFAULT NULL
	 * COMMENT '��ɫ��1.ȫ�� 2.�˳��� 3 ����� 4 ������£�',
	 */

	private Integer id;
	private String name;
	private String idleimg;
	private Integer amount;
	private String location;
	private Date purchasing_date;
	private Double original_price;
	private Double transfer_price;
	private Integer transfer_mode;
	private Integer transfer_state;
	private Integer percentage;
	private Integer fk_idletype;
	private Integer fk_fisher;

	public Integer getFk_idletype() {
		return fk_idletype;
	}

	public void setFk_idletype(Integer fk_idletype) {
		this.fk_idletype = fk_idletype;
	}

	public Integer getFk_fisher() {
		return fk_fisher;
	}

	public void setFk_fisher(Integer fk_fisher) {
		this.fk_fisher = fk_fisher;
	}

	private Fisher fisher;

	private IdleType idleType;

	public IdleType getIdleType() {
		return idleType;
	}

	public void setIdleType(IdleType idleType) {
		this.idleType = idleType;
	}

	public Fisher getFisher() {
		return fisher;
	}

	public void setFisher(Fisher fisher) {
		this.fisher = fisher;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getIdleimg() {
		return idleimg;
	}

	public void setIdleimg(String idleimg) {
		this.idleimg = idleimg;
	}

	public Integer getAmount() {
		return amount;
	}

	public void setAmount(Integer amount) {
		this.amount = amount;
	}

	public String getLocation() {
		return location;
	}

	public void setLocation(String location) {
		this.location = location;
	}

	public Date getPurchasing_date() {
		return purchasing_date;
	}

	public void setPurchasing_date(Date purchasing_date) {
		this.purchasing_date = purchasing_date;
	}

	public Double getOriginal_price() {
		return original_price;
	}

	public void setOriginal_price(Double original_price) {
		this.original_price = original_price;
	}

	public Double getTransfer_price() {
		return transfer_price;
	}

	public void setTransfer_price(Double transfer_price) {
		this.transfer_price = transfer_price;
	}

	public Integer getTransfer_mode() {
		return transfer_mode;
	}

	public void setTransfer_mode(Integer transfer_mode) {
		this.transfer_mode = transfer_mode;
	}

	public Integer getTransfer_state() {
		return transfer_state;
	}

	public void setTransfer_state(Integer transfer_state) {
		this.transfer_state = transfer_state;
	}

	public Integer getPercentage() {
		return percentage;
	}

	public void setPercentage(Integer percentage) {
		this.percentage = percentage;
	}

}
