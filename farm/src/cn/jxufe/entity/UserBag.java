package cn.jxufe.entity;

import javax.persistence.Entity;
import javax.persistence.Table;

import cn.jxufe.bean.EntityID;

@Entity
@Table(name="T_UserBag")
public class UserBag extends EntityID{
	private String userName;
	private int seedId;
	private int seedNumber;
	
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public int getSeedId() {
		return seedId;
	}
	public void setSeedId(int seedId) {
		this.seedId = seedId;
	}
	public int getSeedNumber() {
		return seedNumber;
	}
	public void setSeedNumber(int seedNumber) {
		this.seedNumber = seedNumber;
	}
}
