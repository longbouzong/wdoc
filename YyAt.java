package com.wonders.wdoc.at;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.nutz.dao.Cnd;
import org.nutz.dao.Dao;
import org.nutz.dao.sql.Criteria;
import org.nutz.ioc.loader.annotation.IocBean;
import org.nutz.lang.Strings;
import org.nutz.mvc.annotation.At;
import org.nutz.mvc.annotation.Ok;
import org.nutz.mvc.annotation.Param;

import com.wonders.wdoc.entity.Unit;
import com.wonders.wdoc.entity.User;


@At("/yy")
@IocBean(fields = "dao")
public class YyAt {

    private Dao dao;
    /**
     * 到首页.
     */
    @At
    @Ok("jsp:jsp.wdoc.yy.index")
    public void toIndex() {
    }
    
    /**
     * 单位管理.
     */
    @At
    @Ok("jsp:jsp.wdoc.yy.user.unit_list")
    public Map<String,Object> toUnitList() {
    	Map<String,Object> result = new HashMap<String,Object>();
    	Criteria cri = Cnd.cri();
    	cri.where().and("state","=","1");
    	List<Unit> unitList = dao.query(Unit.class, cri);
    	result.put("unitList", unitList);
    	return result;
    }
    
    /**
     * 用户管理
     */
    @At
    @Ok("jsp:jsp.wdoc.yy.user.user_list")
    public Map<String,Object> toUserList() {
    			Map <String,Object> result = new HashMap <String,Object>();
    			Criteria cri = Cnd.cri();
    			cri.where().and("state","=","1");
    			List <User> userList = dao.query(User.class, cri);
    	    	List<Unit> unitList = dao.query(Unit.class, cri);
    			result.put("userList", userList);
    			result.put("unitList", unitList);
    			return result;    			   			
    		}
    
    /**
	 * 进入新增、修改用户功能
	 * @param workId
	 * @return
	 */
	@At
	@Ok("jsp:jsp.wdoc.yy.work.work_edit")
		public Map<String, Object> toUserEdit(@Param("userId") String userId,String unitId){		
		Unit u =dao.fetch(Unit.class,Cnd.where("UNIT_ID","=",unitId));
		Map<String, Object> result = new HashMap<String, Object>();	
		if(!Strings.isEmpty(userId)){
			User user = dao.fetch(User.class, userId);
			result.put("user", user);			
		} 	
		result.put("unit", u);
		
		//result.put("unitName", unitName);
		return result;
	}
	
	 /**
		 * 进入新增、修改单位功能
		 * @param unitId
		 * @return
		 */
		@At
		@Ok("jsp:jsp.wdoc.yy.work.unit_edit")
			public Map<String, Object> toUnitEdit(@Param("unitId") String unitId){
				Map<String, Object> result = new HashMap<String, Object>();				
				if(!Strings.isEmpty(unitId)){
					Unit unit = dao.fetch(Unit.class, unitId);
					result.put("unit", unit);
				}
				return result;
			}

	/**
	 * 保存用户
	 */
	
	@At
	@Ok("jsp:jsp.wdoc.yy.work.success")
	public void saveWork(@Param("::user.") User user){
		if(Strings.isEmpty(user.getUserId()) ){
			dao.insert(user);
		}else{
			dao.update(user);
		}
	}
	
	/**
	 * 保存单位
	 */
	
	@At
	@Ok("jsp:jsp.wdoc.yy.work.success")
	public void saveUnit(@Param("::unit.") Unit unit){
		if(unit != null){
			dao.insert(unit);
		}
	}
	
	/**
	 * 验证用户是否存在.
	 */
	@At
	@Ok("json")
	public Map<String, Object> checkUser(String logonName){
		Map<String, Object> result = new HashMap<String, Object>();
		result.put("result", "0");
		try{
			if(!Strings.isEmpty(logonName)){
				User user = dao.fetch(User.class, Cnd.where("logonName", "=", logonName));
				if(user != null){
					result.put("result", "1");
				}
			}
		}catch(Exception e){
			result.put("result", "0");
		}
		return result;
	}
	
	/**
	 * 验证单位是否存在.
	 */
	@At
	@Ok("json")
	public Map<String, Object> checkUnit(String unitName){
		Map<String, Object> result = new HashMap<String, Object>();
		result.put("result", "0");
		try{
			if(!Strings.isEmpty(unitName)){
				Unit unit = dao.fetch(Unit.class, Cnd.where("unitName", "=", unitName));
				if(unit != null){
					result.put("result", "1");
				}
			}
		}catch(Exception e){
			result.put("result", "0");
		}
		return result;
	}
	
	/**
	 * 重置密码
	 */
	@At
	@Ok("json")
	public Map<String, Object> resetPassword(String userId){
		Map<String, Object> result = new HashMap<String, Object>();
		result.put("result", "1");
		try{
			if(!Strings.isEmpty(userId)){
				User user = dao.fetch(User.class, userId);
				if(user != null){
					//重新置密码为111111
					user.setPassword("96E79218965EB72C92A549DD5A330112");
					dao.update(user);
				}
			}
		}catch(Exception e){
			result.put("result", "0");
		}
		return result;
	}
	
	/**
	 * 单位的删除功能,ajax调用.
	 */
	@At
	@Ok("json")
	public void toDelUnit(@Param("unitId") String unitId){
		if(!Strings.isEmpty(unitId)){
			Unit unit = dao.fetch(Unit.class, unitId);
			if(unit != null){
				dao.delete(unit);
				//多对多映射删除
				//dao.clear("WORK_FILE", Cnd.where("WORK_ID","=",work.getWorkId()));
			}
		}
	}
	
}









