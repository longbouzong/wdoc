package com.wonders.wdoc.entity;

import java.sql.Date;
import java.util.UUID;

import org.nutz.dao.entity.annotation.Column;
import org.nutz.dao.entity.annotation.EL;
import org.nutz.dao.entity.annotation.Name;
import org.nutz.dao.entity.annotation.Prev;
import org.nutz.dao.entity.annotation.Table;
import org.nutz.lang.Strings;


@Table("OC_USER_INFO")
public class User {

	/*
	 * 用户编号
	 */
	@Name
	@Prev(els = @EL("$me.initUUID()"))
	@Column("USER_ID")
	private String userId;

	/**
	 * 登陆名
	 */
	@Column("LOGON_NAME")
	private String logonName;
	/**
	 * 密码
	 */
	@Column("PASSWORD")
	private String password;
	/**
	 * 用户姓名
	 */
	@Column("DISPLAY_NAME")
	private String displayName;
	/**
	 * 区域编号
	 */
	@Column("REGION_ID")
	private String regionId;
	/**
	 *状态 有效、无效 
	 */
	@Column("STATE")
	private String state;
	/**
	 * 本次登陆日期
	 */
	@Column("CURRENT_LOGON_DATE")
	private Date currentLogonDate;
	/**
	 * 上次登录日期
	 */
	@Column("LAST_LOGON_DATE")
	private Date lastLogonDate;
	/**
	 * 连续登录失败次数
	 */
	@Column("LOGON_FAIL_TIMES")
	private String logonFailTimes;
	/**
	 * 锁定标志 是、否
	 */
	@Column("LOCK_FLAG")
	private String lockFlag;
	/**
	 * 锁定日期
	 */
	@Column("LOCK_DATE")
	private Date lockDate;
	/**
	 * 人员编号
	 */
	@Column("PERSON_ID")
	private String personId;
	/**
	 * 
	 */
	@Column("POSITION")
	private String position;
	/**
	 * 邮箱
	 */
	@Column("E_MAIL")
	private String eMail;
	/**
	 * 
	 */
	@Column("TEAM")
	private String team;
	/**
	 * 
	 */
	@Column("SUPER_ADMIN")
    private String superAdmin;
	/**
	 * 
	 */
	@Column("DEPT")
	private String dept;
	/**
	 * 
	 */
	@Column("ADMIN")
	private String admin;
	
	/**
	 * 
	 */
	@Column("UNIT_ID")
	private String unitId;
	
	
	public String initUUID() {
		if (Strings.isEmpty(userId))
			return UUID.randomUUID().toString().replaceAll("-", "");
		return this.userId;
	}
	
	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getLogonName() {
		return logonName;
	}

	public void setLogonName(String logonName) {
		this.logonName = logonName;
	}

	public String getDisplayName() {
		return displayName;
	}

	public void setDisplayName(String displayName) {
		this.displayName = displayName;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getRegionId() {
		return regionId;
	}

	public void setRegionId(String regionId) {
		this.regionId = regionId;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	public Date getCurrentLogonDate() {
		return currentLogonDate;
	}

	public void setCurrentLogonDate(Date currentLogonDate) {
		this.currentLogonDate = currentLogonDate;
	}

	public Date getLastLogonDate() {
		return lastLogonDate;
	}

	public void setLastLogonDate(Date lastLogonDate) {
		this.lastLogonDate = lastLogonDate;
	}

	public String getLogonFailTimes() {
		return logonFailTimes;
	}

	public void setLogonFailTimes(String logonFailTimes) {
		this.logonFailTimes = logonFailTimes;
	}

	public String getLockFlag() {
		return lockFlag;
	}

	public void setLockFlag(String lockFlag) {
		this.lockFlag = lockFlag;
	}

	public Date getLockDate() {
		return lockDate;
	}

	public void setLockDate(Date lockDate) {
		this.lockDate = lockDate;
	}

	public String getPersonId() {
		return personId;
	}

	public void setPersonId(String personId) {
		this.personId = personId;
	}

	public String getPosition() {
		return position;
	}

	public void setPosition(String position) {
		this.position = position;
	}

	public String geteMail() {
		return eMail;
	}

	public void seteMail(String eMail) {
		this.eMail = eMail;
	}

	public String getTeam() {
		return team;
	}

	public void setTeam(String team) {
		this.team = team;
	}

	public String getSuperAdmin() {
		return superAdmin;
	}

	public void setSuperAdmin(String superAdmin) {
		this.superAdmin = superAdmin;
	}

	public String getDept() {
		return dept;
	}

	public void setDept(String dept) {
		this.dept = dept;
	}

	public String getAdmin() {
		return admin;
	}

	public void setAdmin(String admin) {
		this.admin = admin;
	}

	public String getUnitId() {
		return unitId;
	}

	public void setUnitId(String unitId) {
		this.unitId = unitId;
	}

	
	
}
