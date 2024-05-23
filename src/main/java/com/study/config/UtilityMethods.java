package com.study.config;

import java.text.SimpleDateFormat;
import java.util.Date;

public class UtilityMethods{
   
	public String formatDate(Date date) {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		return sdf.format(date);
	}
	
}