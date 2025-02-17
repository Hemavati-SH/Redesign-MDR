package com.mdr.utils;

import java.io.FileInputStream;
import java.io.IOException;
import java.util.Properties;
import java.io.File;

public class ReadAppiumConfig {
	
	public static FileInputStream fis = null;
	public static Properties prop=null;
	
	public static ReadAppiumConfig getInstance() {
		ReadAppiumConfig appiumobj =new ReadAppiumConfig();
		return appiumobj;
	}
	
	public static void loadProp() throws IOException {
		fis = new FileInputStream(new File("./config/appiumConfig.properties"));
		prop= new Properties();
		prop.load(fis);
	}
	public static String getAppiumConfigValue(String key) {
		String value = null;
		
		try {
			loadProp();
			value = prop.getProperty(key);
		} catch(Exception e) {
			
		}
		return value;
	}
}

