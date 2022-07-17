package com.spot.controller;

import org.openqa.selenium.By;
import org.openqa.selenium.Keys;
import org.openqa.selenium.PageLoadStrategy;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.chrome.ChromeDriver;
import org.openqa.selenium.chrome.ChromeOptions;

public class NaverDirec {
	
	public static final String WEB_DRIVER_ID = "webdriver.chrome.driver"; // 드라이버 ID
	public static final String WEB_DRIVER_PATH = "./chromedriver.exe"; // 드라이버 경로



	public static void main(String[] args) throws InterruptedException {

		System.setProperty(WEB_DRIVER_ID, WEB_DRIVER_PATH);
		
		ChromeOptions options = new ChromeOptions();
		options.addArguments("disable-gpu");
		options.addArguments("lang=ko_KR");
//		options.addArguments("headless");
		options.addArguments("user-agent=Mozilla/5.0 (Macintosh; Intel Mac OS X 10_12_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/61.0.3163.100 Safari/537.36");
		options.setPageLoadStrategy(PageLoadStrategy.NORMAL);
		
		WebDriver driver = new ChromeDriver(options);
		driver.get("https://map.naver.com/v5/directions/-/-/-/transit?c=14100939.1067141,4548416.6248709,14,0,0,0,dh");
		Thread.sleep(1000);
		driver.findElement(By.xpath("//*[@id=\"container\"]/shrinkable-layout/div/directions-layout/directions-result/div[1]/div/ul/li[2]/a")).sendKeys(Keys.RETURN);
		driver.findElement(By.id("directionStart0")).sendKeys("강릉");
		driver.findElement(By.id("directionStart0")).sendKeys(Keys.RETURN);
		Thread.sleep(1000);
		//검색결과 여러개 일 때
//		driver.findElement(By.xpath("//*[@id=\"container\"]/shrinkable-layout/div/directions-layout/directions-result/div[1]/directions-search-list/search-list/search-list-contents/perfect-scrollbar/div/div[1]/div/div/div/search-item-place[1]/div")).click();
		//검색결과 한 개 일 때
		driver.findElement(By.xpath("//*[@id=\"container\"]/shrinkable-layout/div/directions-layout/directions-result/div[1]/directions-search-list/search-list/search-list-contents/perfect-scrollbar/div/div[1]/div/div/div/search-item-address/div")).click();
		driver.findElement(By.id("directionGoal1")).sendKeys("당진");
		driver.findElement(By.id("directionGoal1")).sendKeys(Keys.RETURN);
		Thread.sleep(1000);
		//검색결과 여러개 일 때
//		driver.findElement(By.xpath("//*[@id=\"container\"]/shrinkable-layout/div/directions-layout/directions-result/div[1]/directions-search-list/search-list/search-list-contents/perfect-scrollbar/div/div[1]/div/div/div/search-item-place[1]/div")).click();
		//검색결과 한 개 일 때
		driver.findElement(By.xpath("//*[@id=\"container\"]/shrinkable-layout/div/directions-layout/directions-result/div[1]/directions-search-list/search-list/search-list-contents/perfect-scrollbar/div/div[1]/div/div/div/search-item-address/div")).click();
		driver.findElement(By.xpath("//*[@id=\"container\"]/shrinkable-layout/div/directions-layout/directions-result/div[1]/div[1]/directions-search/div[2]/button[3]")).sendKeys(Keys.RETURN);
		Thread.sleep(1000);
		System.out.println(driver.findElement(By.xpath("//*[@id=\"container\"]/shrinkable-layout/div/directions-layout/directions-result/div[1]/directions-summary-list/directions-hover-scroll/div/ul/li[1]/directions-summary-item-car/directions-summary-item-car-card/div[1]")).getText());
		System.out.println(driver.getCurrentUrl());
		
		driver.quit();

	}

}
