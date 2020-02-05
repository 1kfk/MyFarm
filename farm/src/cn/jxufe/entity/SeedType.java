package cn.jxufe.entity;

import javax.persistence.Entity;
import javax.persistence.Table;

import cn.jxufe.bean.EntityID;
@Entity
@Table(name="T_SeedType")
public class SeedType extends EntityID{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private int num;
	private String name;
	/**
	 * @return the num
	 */
	public int getNum() {
		return num;
	}
	/**
	 * @return the name
	 */
	public String getName() {
		return name;
	}
	/**
	 * @param num the num to set
	 */
	public void setNum(int num) {
		this.num = num;
	}
	/**
	 * @param name the name to set
	 */
	public void setName(String name) {
		this.name = name;
	}
	
	
	
}
