
package com.mdr.config;


import java.io.BufferedReader;
import java.io.File;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.InetAddress;
import java.net.InetSocketAddress;
import java.net.MalformedURLException;
import java.net.ServerSocket;
import java.net.URL;
//import java.net.URI;
//import java.net.URISyntaxException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.concurrent.TimeUnit;

import org.apache.commons.io.FileUtils;
import org.openqa.selenium.OutputType;
import org.openqa.selenium.TakesScreenshot;
import org.openqa.selenium.remote.DesiredCapabilities;
import org.testng.annotations.Test;

import com.cucumber.listener.Reporter;
import com.mdr.base.BaseTest;
import com.mdr.utils.AppStringConstants;
import com.mdr.utils.CapsJsonParser;
import com.mdr.utils.ReadAppiumConfig;

import cucumber.api.Scenario;
import cucumber.api.java.After;
import cucumber.api.java.Before;
import io.appium.java_client.AppiumDriver;
import io.appium.java_client.MobileElement;
import io.appium.java_client.android.AndroidDriver;
import io.appium.java_client.android.AndroidElement;
import io.appium.java_client.ios.IOSDriver;
import io.appium.java_client.ios.IOSElement;
import io.appium.java_client.remote.IOSMobileCapabilityType;
import io.appium.java_client.remote.MobileCapabilityType;
import io.appium.java_client.service.local.AppiumDriverLocalService;
import io.appium.java_client.service.local.AppiumServerHasNotBeenStartedLocallyException;
import io.appium.java_client.service.local.AppiumServiceBuilder;
import io.appium.java_client.service.local.flags.GeneralServerFlag;


public class Hooks  {

	private static ThreadLocal<AppiumDriverLocalService> service = new ThreadLocal<>();
	//private static ThreadLocal<AppiumDriver<MobileElement>> driver = new ThreadLocal<>();
	public static AppiumDriver<MobileElement> driver = null;
	//public static AndroidDriver<MobileElement> driver1;
	//private static ThreadLocal<IOSDriver<IOSElement>> iosDriver = new ThreadLocal<>();
    //private static ThreadLocal<AndroidDriver<AndroidElement>> androidDriver = new ThreadLocal<>();
	
	public static AppiumDriver getDriver() 
	{   
		if(driver == null) {
			throw new IllegalStateException("Driver is not initialized. Please ensure setDriver() is called before getDriver().");
		}
		driver.manage().timeouts().implicitlyWait(20, TimeUnit.SECONDS);
		return driver;
	}

	public AppiumDriverLocalService getService() 
	{
		return service.get();
	}

	/**
	 * Start Appium Server Programmatically before each scenario
	 * @throws URISyntaxException 
	 * @throws MalformedURLException 
	 * @throws InterruptedException 
	 */

	// @Before, @After are called Global tagged hooks

	
	public static void startServer() throws MalformedURLException,  InterruptedException {
		
		ReadAppiumConfig.getInstance();
		//String platform = System.getProperty("platform", "Android"); // Default to Android
		String isAppiumServerStartProgrammatically = ReadAppiumConfig.getInstance().getAppiumConfigValue("isAppiumServerstartProgrammatically");
		
		
		if(isAppiumServerStartProgrammatically.equalsIgnoreCase("true")) {
			
		
		if(!isPortAvailable(4723)) {
	     killAppiumProcess(4723);
	     Thread.sleep(10000);
		}
		
		if (isPortAvailable(4723)) {
		AppiumServiceBuilder appiumServiceBuilder = new AppiumServiceBuilder();
		appiumServiceBuilder.usingDriverExecutable(new File("/Users/Prati/.nvm/versions/node/v18.19.0/bin/node"))
							.withAppiumJS(new File("/Users/Prati/OneDrive/Documents/appium/appium/build/lib/main.js"))
							.withIPAddress("127.0.0.1")
							.usingPort(4723)
							.withArgument(GeneralServerFlag.BASEPATH,"/wd/hub");
		
		service.set(appiumServiceBuilder.build());
		service.get().start();
		

		if (service.get() == null || !service.get().isRunning()) {
			System.out.println("Appium server failed to start.");
			throw new AppiumServerHasNotBeenStartedLocallyException("An Appium server node is not started!");
		}
		}
		}
		
		try {
			setDriver();
		} catch (Exception e) {
			e.printStackTrace();
			throw new IllegalStateException("Driver setup failed.",e);
		}
		/*if (driver.get() == null) {
			System.out.println("Initializing driver for " + platform);
			//setDriver();
		} */
	}

	public static void setDriver() throws MalformedURLException  {
		DesiredCapabilities capabilities = new DesiredCapabilities();
		//String platform = System.getProperty("platform", "Android"); // Default to Android
		
		if (System.getProperty("platform").equalsIgnoreCase("ios")) {
			capabilities.setCapability(MobileCapabilityType.PLATFORM_NAME, "iOS");
			capabilities.setCapability(MobileCapabilityType.PLATFORM_VERSION, (String) CapsJsonParser.getJSONObjectValue("ios").get("platformVersion"));
			capabilities.setCapability(MobileCapabilityType.DEVICE_NAME, (String) CapsJsonParser.getJSONObjectValue("ios").get("deviceName"));
			capabilities.setCapability(MobileCapabilityType.UDID, (String) CapsJsonParser.getJSONObjectValue("ios").get("udid"));
			capabilities.setCapability(MobileCapabilityType.AUTOMATION_NAME, (String) CapsJsonParser.getJSONObjectValue("ios").get("automationName"));
			capabilities.setCapability(IOSMobileCapabilityType.RESET_ON_SESSION_START_ONLY, (String) CapsJsonParser.getJSONObjectValue("ios").get("resetOnSessionStartOnly"));  
			capabilities.setCapability(IOSMobileCapabilityType.USE_NEW_WDA, (String) CapsJsonParser.getJSONObjectValue("ios").get("resetOnSessionStartOnly"));  
			capabilities.setCapability(IOSMobileCapabilityType.UPDATE_WDA_BUNDLEID, (String) CapsJsonParser.getJSONObjectValue("ios").get("updatedWDABundleId"));            
			capabilities.setCapability(IOSMobileCapabilityType.BUNDLE_ID, (String) CapsJsonParser.getJSONObjectValue("ios").get("bundleId"));  
			capabilities.setCapability("newCommandTimeout", 600);
			
			driver = new AppiumDriver<MobileElement>(new URL("http://127.0.0.1:4723/wd/hub"), capabilities);
			//IOSDriver<IOSElement> iosDriver =new IOSDriver<>(service.get().getUrl(), capabilities);
			System.out.println("iOS device connected.");
			//IOSDriver<IOSElement> iosDriver.set(new IOSDriver<>(service.get().getUrl(), capabilities));
		
		} else {
			if(System.getProperty("platform").equalsIgnoreCase("Android")) {
				System.out.println("Testing started");
				System.setProperty("ANDROID_HOME", "/Users/Prati/Library/Android/sdk");

				capabilities.setCapability(MobileCapabilityType.PLATFORM_NAME, "Android");
				capabilities.setCapability(MobileCapabilityType.PLATFORM_VERSION, (String) CapsJsonParser.getJSONObjectValue("android").get("platformVersion"));
				String data=(String) CapsJsonParser.getJSONObjectValue("android").get("deviceName");
				capabilities.setCapability(MobileCapabilityType.DEVICE_NAME, (String) CapsJsonParser.getJSONObjectValue("android").get("deviceName"));
				capabilities.setCapability(MobileCapabilityType.AUTOMATION_NAME, (String) CapsJsonParser.getJSONObjectValue("android").get("automationName"));
				capabilities.setCapability(MobileCapabilityType.UDID, (String) CapsJsonParser.getJSONObjectValue("android").get("udid"));
				//capabilities.setCapability("appPackage", AppStringConstants.ANDROIDAPPPACKAGE);
				//capabilities.setCapability("appActivity", AppStringConstants.ANDROIDAPPACTIVITY);
				capabilities.setCapability("app", "/Users/Prati/Downloads/application.apk");
				capabilities.setCapability("appPackage", (String) CapsJsonParser.getJSONObjectValue("android").get("appPackage"));
				capabilities.setCapability("appActivity", (String) CapsJsonParser.getJSONObjectValue("android").get("appActivity"));
				capabilities.setCapability("newCommandTimeout", 600);
				capabilities.setCapability("ignoreHiddenApiPolicyError", true);
				capabilities.setCapability("fullReset", true);
				capabilities.setCapability("noReset", false);
				// capabilities.setCapability("adbExecTimeout", 50000);
				//capabilities.setCapability("appWaitForLaunch", false);
				//driver.set(new AndroidDriver<AndroidElement>(service.get().getUrl(), capabilities));
				driver = new AppiumDriver<MobileElement>(new URL("http://127.0.0.1:4723/wd/hub"),capabilities);
				System.out.println("Android device connected.");
				//androidDriver.set(new AndroidDriver<>(service.get().getUrl(), capabilities));
				//capabilities.setCapability("fullReset", true);   
			} else {
				throw new IllegalArgumentException("Unsupported platform: " + System.getProperty("platform"));
			}
		}
		if (driver == null) {
	        throw new IllegalStateException("Driver failed to initialize in setDriver().");
	    }
		//return driver1;
		/*if (driver.get() == null) {
	        System.out.println("Driver initialized successfully");
	    } else {
	        System.out.println("Driver is already initialized");
	    }*/
	    //return driver;
		
	}


	@After(order = 2)
	public void screenShotforFailedScenarios(Scenario scenario) {
		@SuppressWarnings("static-access")
		AppiumDriver driver = Hooks.getDriver();
		if(driver != null) {
			String timeStamp;
			timeStamp = new SimpleDateFormat("yyyyMMdd_HHmmss").format(Calendar.getInstance().getTime());

			String screenshotName = (timeStamp + scenario.getName().replaceAll(" ", "_"));

		if (scenario.isFailed()) {
			try {
				File sourcePath = ((TakesScreenshot) driver).getScreenshotAs(OutputType.FILE);

				File destinationDir = new File("./target/cucumber-reports/extent-report/");
				
				if (!destinationDir.exists()) {
					destinationDir.mkdir();
				}
				
				File destinationPath = new File(destinationDir + "/" + screenshotName + ".png");
				FileUtils.copyFile(sourcePath, new File(destinationPath + "/"));
				Reporter.addScreenCaptureFromPath(screenshotName + ".png");
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	} else {
		System.out.println("Driver is not initialised,cannot capture screenshot. ");
			return;
		}
	}
		

	@After(order = 1)
	public void stopServer() {

		@SuppressWarnings("static-access")
		AppiumDriver driver = Hooks.getDriver();
		
		if(driver != null) {
			System.out.println("before restapp");
			try {
				driver.resetApp();
				System.out.println("after restapp");
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else {
			System.out.println("Driver is null, cannot reset the app.");
		}
		
		if (service.get() != null && service.get().isRunning()) {
	        service.get().stop();  // Stop the Appium server if it's running
	        System.out.println("Appium server stopped.");
	    } else {
	        System.out.println("Appium server is not running.");
		}

	}
	
	public static void killAppiumProcess(int port) {
		
		try {
			String command = String.format("lsof -i :%d -t", port);
			Process process = Runtime.getRuntime().exec(new String[] {"/bin/sh", "-c", command});
			BufferedReader reader = new BufferedReader(new InputStreamReader(process.getInputStream()));
			
			String line;
			while ( (line = reader.readLine()) != null) {
				
				String pid = line.trim();
				
				Runtime.getRuntime().exec("kill -9 " + pid);
				System.out.println("Killed process with pid:" + pid);
				
			}
			reader.close();
			
	} catch (Exception e) {
		e.printStackTrace();
	}
	}		
	
	public static boolean isPortAvailable(int port) {
		try (ServerSocket serverSocket =new ServerSocket()) {
			 serverSocket.setReuseAddress(false);
			 serverSocket.bind(new InetSocketAddress(InetAddress.getByName("localhost"), port), 1);
			 return true;
		} catch(Exception e) {
			return false;
		}
		}
	}














