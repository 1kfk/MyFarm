package cn.jxufe.entity;

import javax.persistence.Entity;
import javax.persistence.Table;

import cn.jxufe.bean.EntityID;
/**
 * @author hound
 *
 */
@Entity
@Table(name="T_SeedList")
public class SeedList extends EntityID{

	/**
	 * 
	 */
	private static final long serialVersionUID = 6710754697122731160L;
	private int seedId;
	private String seedName;
	private int season;
	private int seedGrade;
	private int seedType;
	private int experience;
	private int matureTime;
	private int getNum;
	private int buyPrice;
	private int salePrice;
	private int soil;
	private int points;
	private String tip;
	/**
	 * @return the seedId
	 */
	public int getSeedId() {
		return seedId;
	}
	/**
	 * @param seedId the seedId to set
	 */
	public void setSeedId(int seedId) {
		this.seedId = seedId;
	}
	/**
	 * @return the seedName
	 */
	public String getSeedName() {
		return seedName;
	}
	/**
	 * @param seedName the seedName to set
	 */
	public void setSeedName(String seedName) {
		this.seedName = seedName;
	}
	/**
	 * @return the season
	 */
	public int getSeason() {
		return season;
	}
	/**
	 * @param season the season to set
	 */
	public void setSeason(int season) {
		this.season = season;
	}
	/**
	 * @return the seedGrade
	 */
	public int getSeedGrade() {
		return seedGrade;
	}
	/**
	 * @param seedGrade the seedGrade to set
	 */
	public void setSeedGrade(int seedGrade) {
		this.seedGrade = seedGrade;
	}
	/**
	 * @return the seedType
	 */
	public int getSeedType() {
		return seedType;
	}
	/**
	 * @param seedType the seedType to set
	 */
	public void setSeedType(int seedType) {
		this.seedType = seedType;
	}
	/**
	 * @return the experience
	 */
	public int getExperience() {
		return experience;
	}
	/**
	 * @param experience the experience to set
	 */
	public void setExperience(int experience) {
		this.experience = experience;
	}
	/**
	 * @return the matureTime
	 */
	public int getMatureTime() {
		return matureTime;
	}
	/**
	 * @param matureTime the matureTime to set
	 */
	public void setMatureTime(int matureTime) {
		this.matureTime = matureTime;
	}
	/**
	 * @return the getNum
	 */
	public int getGetNum() {
		return getNum;
	}
	/**
	 * @param getNum the getNum to set
	 */
	public void setGetNum(int getNum) {
		this.getNum = getNum;
	}
	/**
	 * @return the buyPrice
	 */
	public int getBuyPrice() {
		return buyPrice;
	}
	/**
	 * @param buyPrice the buyPrice to set
	 */
	public void setBuyPrice(int buyPrice) {
		this.buyPrice = buyPrice;
	}
	/**
	 * @return the salePrice
	 */
	public int getSalePrice() {
		return salePrice;
	}
	/**
	 * @param salePrice the salePrice to set
	 */
	public void setSalePrice(int salePrice) {
		this.salePrice = salePrice;
	}
	/**
	 * @return the soil
	 */
	public int getSoil() {
		return soil;
	}
	/**
	 * @param soil the soil to set
	 */
	public void setSoil(int soil) {
		this.soil = soil;
	}
	/**
	 * @return the points
	 */
	public int getPoints() {
		return points;
	}
	/**
	 * @param points the points to set
	 */
	public void setPoints(int points) {
		this.points = points;
	}
	/**
	 * @return the tip
	 */
	public String getTip() {
		return tip;
	}
	/**
	 * @param tip the tip to set
	 */
	public void setTip(String tip) {
		this.tip = tip;
	}
	
}
