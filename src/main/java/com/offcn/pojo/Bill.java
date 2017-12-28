package com.offcn.pojo;

public class Bill {

	private Integer id;
	private String productname;
	private Integer num;
	private Double price;
	private Integer fisher_id;
	private Double totalprice;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getProductname() {
		return productname;
	}

	public void setProductname(String productname) {
		this.productname = productname;
	}

	public Integer getNum() {
		return num;
	}

	public void setNum(Integer num) {
		this.num = num;
	}

	public Double getPrice() {
		return price;
	}

	public void setPrice(Double price) {
		this.price = price;
	}

	public Integer getFisher_id() {
		return fisher_id;
	}

	public void setFisher_id(Integer fisher_id) {
		this.fisher_id = fisher_id;
	}

	public Double getTotalprice() {
		return totalprice;
	}

	public void setTotalprice(Double totalprice) {
		this.totalprice = totalprice;
	}

}
