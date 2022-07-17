package com.spot.vo;

public class MapVo {
	
	private double lat, lon;
	
	public MapVo() {
		
	}
	
	public MapVo(double lat, double lon) {
		this.lat = lat;
		this.lon = lon;
	}

	public double getLat() {
		return lat;
	}

	public void setLat(double lat) {
		this.lat = lat;
	}

	public double getLon() {
		return lon;
	}

	public void setLon(double lon) {
		this.lon = lon;
	}

	@Override
	public String toString() {
		return "MapVo [lat=" + lat + ", lon=" + lon + "]";
	}
	
	

}
