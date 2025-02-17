package com.mdr.runner;


import org.openqa.selenium.By;
import org.testng.annotations.AfterClass;

import org.testng.annotations.AfterSuite;
import org.testng.annotations.BeforeClass;
import org.testng.annotations.DataProvider;
import org.testng.annotations.Test;

import com.cucumber.listener.Reporter;
import com.mdr.base.BaseTest;
import com.mdr.base.BaseTest1;
import com.mdr.utils.ExtentReportGenerator;

import cucumber.api.CucumberOptions;
import cucumber.api.testng.CucumberFeatureWrapper;
import cucumber.api.testng.TestNGCucumberRunner;
import io.cucumber.junit.Cucumber;
import org.junit.runner.RunWith;

//@RunWith(Cucumber.class)
@CucumberOptions(
                features = "src/test/resources/features",
		        glue = "com.mdr.stepDefinitions",
		        tags = {"@NewPrenatalCareCompleteFlow"},
		        dryRun = false,
		        //monochrome = true,
		        plugin = {
		                "html:target/cucumber-reports/cucumber-pretty",
		                "com.cucumber.listener.ExtentCucumberFormatter:target/cucumber-reports/extent-report/report.html",
		                "json:target/cucumber-reports/CucumberTestReport.json",
		                "pretty",
		                "rerun:target/cucumber-reports/rerun.txt"
		        })
public class RunCukesTest extends BaseTest {


    private TestNGCucumberRunner testNGCucumberRunner;
    @BeforeClass(alwaysRun = true)
    public void setUpClass() throws Exception { 
        testNGCucumberRunner = new TestNGCucumberRunner(this.getClass());
        //System.setProperty("platform", "android");
    }
   
    @Test(description = "Runs Cucumber Feature", dataProvider = "features")
    public void feature(CucumberFeatureWrapper cucumberFeature) {
        testNGCucumberRunner.runCucumber(cucumberFeature.getCucumberFeature());
    }

    @DataProvider
    public Object[][] features() {
        return testNGCucumberRunner.provideFeatures();
    }

    @AfterClass(alwaysRun = true)
    public void tearDownClass() throws Exception {
        testNGCucumberRunner.finish();

    }

	
    @AfterSuite
    public void generateExtentReport()
    {
        Reporter.loadXMLConfig(ExtentReportGenerator.getReportConfigPath());
    }


}
