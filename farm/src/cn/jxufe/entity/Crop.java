package cn.jxufe.entity;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.Table;

import cn.jxufe.bean.EntityID;

@Entity
@Table(name="T_Crop")
public class Crop extends EntityID{
	private String username;
	private int seedid;
	private int seedstate;
	private Date nexttime;
	private int lateseason;
	private int isbug;
	private String land;
	private int seedget;
	
	
	
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public int getSeedid() {
		return seedid;
	}
	public void setSeedid(int seedid) {
		this.seedid = seedid;
	}
	public int getSeedstate() {
		return seedstate;
	}
	public void setSeedstate(int seedstate) {
		this.seedstate = seedstate;
	}
	public Date getNexttime() {
		return nexttime;
	}
	public void setNexttime(Date nexttime) {
		this.nexttime = nexttime;
	}
	public int getLateseason() {
		return lateseason;
	}
	public void setLateseason(int lateseason) {
		this.lateseason = lateseason;
	}
	public int getIsbug() {
		return isbug;
	}
	public void setIsbug(int isbug) {
		this.isbug = isbug;
	}
	public String getLand() {
		return land;
	}
	public void setLand(String land) {
		this.land = land;
	}
	public int getSeedget() {
		return seedget;
	}
	public void setSeedget(int seedget) {
		this.seedget = seedget;
	}
	
	
	
}
