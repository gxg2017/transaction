package com.offcn.pojo;

import java.sql.Timestamp;

public class IdleType {

	private Integer id;
	private String typename;
	private String enumerate;
	private Timestamp creation_date;

	private String[] enumerateArr;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String gettypename() {
		return typename;
	}

	public void settypename(String typename) {
		this.typename = typename;
	}

	public String getEnumerate() {
		return enumerate;
	}

	public void setEnumerate(String enumerate) {
		this.enumerate = enumerate;
	}

	public Timestamp getCreation_date() {
		return creation_date;
	}

	public void setCreation_date(Timestamp creation_date) {
		this.creation_date = creation_date;
	}

	public String[] getEnumerateArr() {
		return enumerateArr;
	}

	public void setEnumerateArr(String[] enumerateArr) {
		this.enumerateArr = enumerateArr;
	}

}
