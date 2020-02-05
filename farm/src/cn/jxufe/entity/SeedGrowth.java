package cn.jxufe.entity;

import javax.persistence.Entity;
import javax.persistence.Table;

import cn.jxufe.bean.EntityID;
@Entity
@Table(name="T_SeedGrowth")
public class SeedGrowth extends EntityID{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private int seedId;
	private int growthNum;
	private String growthName;
	private int growthTime;
	private float bug;
	private int width;
	private int height;
	private int offsetX;
	private int offsetY;
	private int state;
	/**
	 * @return the seedId
	 */
	public int getSeedId() {
		return seedId;
	}
	/**
	 * @return the growthNum
	 */
	public int getGrowthNum() {
		return growthNum;
	}
	/**
	 * @return the growthName
	 */
	public String getGrowthName() {
		return growthName;
	}
	/**
	 * @return the growthTime
	 */
	public int getGrowthTime() {
		return growthTime;
	}
	/**
	 * @return the bug
	 */
	public float getBug() {
		return bug;
	}
	/**
	 * @return the width
	 */
	public int getWidth() {
		return width;
	}
	/**
	 * @return the height
	 */
	public int getHeight() {
		return height;
	}
	/**
	 * @return the offsetX
	 */
	public int getOffsetX() {
		return offsetX;
	}
	/**
	 * @return the offsetY
	 */
	public int getOffsetY() {
		return offsetY;
	}
	/**
	 * @return the state
	 */
	public int getState() {
		return state;
	}
	/**
	 * @param seedId the seedId to set
	 */
	public void setSeedId(int seedId) {
		this.seedId = seedId;
	}
	/**
	 * @param growthNum the growthNum to set
	 */
	public void setGrowthNum(int growthNum) {
		this.growthNum = growthNum;
	}
	/**
	 * @param growthName the growthName to set
	 */
	public void setGrowthName(String growthName) {
		this.growthName = growthName;
	}
	/**
	 * @param growthTime the growthTime to set
	 */
	public void setGrowthTime(int growthTime) {
		this.growthTime = growthTime;
	}
	/**
	 * @param bug the bug to set
	 */
	public void setBug(float bug) {
		this.bug = bug;
	}
	/**
	 * @param width the width to set
	 */
	public void setWidth(int width) {
		this.width = width;
	}
	/**
	 * @param height the height to set
	 */
	public void setHeight(int height) {
		this.height = height;
	}
	/**
	 * @param offsetX the offsetX to set
	 */
	public void setOffsetX(int offsetX) {
		this.offsetX = offsetX;
	}
	/**
	 * @param offsetY the offsetY to set
	 */
	public void setOffsetY(int offsetY) {
		this.offsetY = offsetY;
	}
	/**
	 * @param state the state to set
	 */
	public void setState(int state) {
		this.state = state;
	}
	
	
}
