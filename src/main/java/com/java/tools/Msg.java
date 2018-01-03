package com.java.tools;

import java.util.HashMap;
import java.util.Map;

/**
 * json封装类
 * @author latob
 *
 */
public class Msg {
	
	private int code;
	private String msg;
	private Map<String,Object> map = new HashMap<String,Object>();

	public int getCode() {
		return code;
	}
	
	public void setCode(int code) {
		this.code = code;
	}
	
	public String getMsg() {
		return msg;
	}
	
	public void setMsg(String msg) {
		this.msg = msg;
	}
	
	public Map<String, Object> getMap() {
		return map;
	}
	
	public void setMap(Map<String, Object> map) {
		this.map = map;
	}
	
	public Msg Success(String str){
		Msg m = new Msg();
		m.setCode(100);
		m.setMsg(str);
		return m;
	}
	
	public Msg Success(){
		Msg m = new Msg();
		m.setCode(100);
		return m;
	}
	
	public Msg Fail(String str){
		Msg m = new Msg();
		m.setCode(200);
		m.setMsg(str);
		return m;
	}
	
	public Msg msg(String key,Object value){
		this.getMap().put(key, value);
		return this;
	}
}
