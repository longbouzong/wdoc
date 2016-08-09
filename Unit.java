package com.wonders.wdoc.entity;

import java.util.UUID;

import org.nutz.dao.entity.annotation.Column;
import org.nutz.dao.entity.annotation.EL;
import org.nutz.dao.entity.annotation.Name;
import org.nutz.dao.entity.annotation.Prev;
import org.nutz.dao.entity.annotation.Table;
import org.nutz.lang.Strings;

@Table("OC_UNIT_INFO")
public class Unit {
	
	/*
	 * 单位编号
	 */
	@Name
	@Prev(els = @EL("$me.initUUID()"))
	@Column("UNIT_ID")
	private String unitId;
	
	/**
	 * 单位名称
	 */
	@Column("UNIT_NAME")
	private String unitName;
	
	/**
	 * 单位电话
	 */
	@Column("UNIT_TELEPHONE")
	private String unitTelephone;
	
	/**
	 * 单位地址
	 */
	@Column("UNIT_ADDRESS")
	private String unitAddress;
	
	/**
	 * 单位联系人
	 */
	@Column("UNIT_CONTACT_PERSON")
	private String unitContactPerson;
	
	/**
	 * 检测状态
	 */
	@Column("STATE")
	private String state;
	
	public String initUUID() {
		if (Strings.isEmpty(unitId))
			return UUID.randomUUID().toString().replaceAll("-", "");
		return this.unitId;
	}

	public String getUnitId() {
		return unitId;
	}

	public void setUnitId(String unitId) {
		this.unitId = unitId;
	}

	public String getUnitName() {
		return unitName;
	}

	public void setUnitName(String unitName) {
		this.unitName = unitName;
	}

	public String getUnitTelephone() {
		return unitTelephone;
	}

	public void setUnitTelephone(String unitTelephone) {
		this.unitTelephone = unitTelephone;
	}

	public String getUnitAddress() {
		return unitAddress;
	}

	public void setUnitAddress(String unitAddress) {
		this.unitAddress = unitAddress;
	}

	public String getUnitContactPerson() {
		return unitContactPerson;
	}

	public void setUnitContactPerson(String unitContactPerson) {
		this.unitContactPerson = unitContactPerson;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}
	
}











