package Manipulator;

import java.sql.Timestamp;
import java.util.Date;

public class TimeConvert {
	private String today, hmtoday, sHours, sMinutes;
	private String bDate;
	private Date d = new Date();
	/**
	 * @param today
	 */
	public TimeConvert() {
		today = (d.getYear()+1900)+"-"+(d.getMonth()+1)+"-"+d.getDate(); 
	}
	
	public void clear() {
		today = "";
		sHours = "";
		sMinutes = "";
		bDate = "";
	}
	
	public String getHmtoday() {
		return hmtoday;
	}

	public void setHmtoday(String hmtoday) {
		this.hmtoday = hmtoday;
	}

	public boolean timeCompare(Timestamp date) {
		bDate = (date.getYear()+1900)+"-"+(date.getMonth()+1)+"-"+date.getDate(); 
		return today.equals(bDate);
	}
	
	public void timeConversion(Timestamp date) {
		int hours = date.getHours();
		int minutes = date.getMinutes();
		
		if (hours < 10){
			sHours = "0" + hours;
		}else{ sHours = hours + "";}
		if (minutes < 10){
			sMinutes = "0" + minutes;
		}else{ sMinutes = minutes + "";}
		
	}

	public String getToday() {
		return today;
	}

	public void setToday(String today) {
		this.today = today;
	}

	public String getsHours() {
		return sHours;
	}

	public void setsHours(String sHours) {
		this.sHours = sHours;
	}

	public String getsMinutes() {
		return sMinutes;
	}

	public void setsMinutes(String sMinutes) {
		this.sMinutes = sMinutes;
	}

	public String getbDate() {
		return bDate;
	}

	public void setbDate(String bDate) {
		this.bDate = bDate;
	}

	public Date getD() {
		return d;
	}

	public void setD(Date d) {
		this.d = d;
	}
	

	
	

}
