package com.py.util;

public class Map2 {
	private static final double PI = 3.14159265358979323; //圆周率
    private static final double R = 6371229;              //地球的半径
    public static final double LONGT = 10227.5985;
    public static final double LAT = 11131.9859;
   
   
    public static double getDistance(double longt1, double lat1, double longt2, double lat2){
        double x,y,distance;
        x=(longt2-longt1)*PI*R*Math.cos( ((lat1+lat2)/2) *PI/180)/180;
        y=(lat2-lat1)*PI*R/180;
        distance=Math.hypot(x,y);
        return distance;
    }
   
    public static double getLongt(double longt1, double lat1, double distance){
        double a = (180*distance)/(PI*R*Math.cos(lat1*PI/180));
        return a/10;
    }
   
   
    public static double getLat(double longt1, double lat1, double distance){
        double a = (180*distance)/(PI*R*Math.cos(lat1*PI/180));
        return a/10;
    }
}
