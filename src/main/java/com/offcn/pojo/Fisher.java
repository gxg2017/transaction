package com.offcn.pojo;

import java.sql.Date;
import java.sql.Timestamp;
import java.util.Set;

public class Fisher {

	private Integer id;
	private String nickname;
	private String phonenum;
	private String password;
	private String account;
	private Date birthday;
	private Timestamp registration_date;

	private String address;
	private String shipaddress;

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getShipaddress() {
		return shipaddress;
	}

	public void setShipaddress(String shipaddress) {
		this.shipaddress = shipaddress;
	}

	private Set<Idle> idleList;

	public Set<Idle> getIdleList() {
		return idleList;
	}

	public void setIdleList(Set<Idle> idleList) {
		this.idleList = idleList;
	}

	public Date getBirthday() {
		return birthday;
	}

	public void setBirthday(Date birthday) {
		this.birthday = birthday;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public String getPhonenum() {
		return phonenum;
	}

	public void setPhonenum(String phonenum) {
		this.phonenum = phonenum;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getAccount() {
		return account;
	}

	public void setAccount(String account) {
		this.account = account;
	}

	public Timestamp getRegistration_date() {
		return registration_date;
	}

	public void setRegistration_date(Timestamp registration_date) {
		this.registration_date = registration_date;
	}

}
