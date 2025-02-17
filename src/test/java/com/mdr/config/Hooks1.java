package com.mdr.config;

import io.appium.java_client.AppiumDriver;
import io.cucumber.java.After;
import io.cucumber.java.Before;

import java.util.concurrent.TimeUnit;

import org.testng.annotations.Parameters;

import com.mdr.utils.DriverManager;

public class Hooks1 {
    @Before
    @Parameters({"platformName", "deviceName", "platformVersion"})
    public void setUp(String platformName, String deviceName, String platformVersion) throws Exception {
        DriverManager.setUp(platformName, deviceName, platformVersion);
    }

    @After
    public void tearDown() {
        DriverManager.tearDown();
    }
    
    
}

