package com.py.util;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.URL;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.Map;

public class GetLatitudeUtils {

	private static final String AK = "3ufnNVxYGmMSiNg8BlQNkyAnh6aD5CST";
	
    /**
     * 返回输入地址的经纬度坐标 key lng(经度),lat(纬度)
     */
    public static Map<String, String> getGeocoderLatitude(String address) {
        BufferedReader in = null;
        try {
            Map<String, String> paramsMap = new LinkedHashMap<String, String>();
            paramsMap.put("address", address);
            paramsMap.put("output", "json");
            paramsMap.put("ak", AK);
            String quest = GetLatitude.toQueryString(paramsMap);
            URL tirc = new URL(
                    "http://api.map.baidu.com/geocoder/v2/?" + quest + "&sn=" + GetLatitude.result(paramsMap));

            in = new BufferedReader(new InputStreamReader(tirc.openStream(), "UTF-8"));
            String res;
            StringBuilder sb = new StringBuilder("");
            while ((res = in.readLine()) != null) {
                sb.append(res.trim());
            }
            String str = sb.toString();
            Map<String, String> map = null;
            if (str != null && ! "".equals(str.trim())) {
                int lngStart = str.indexOf("lng\":");
                int lngEnd = str.indexOf(",\"lat");
                int latEnd = str.indexOf("},\"precise");
                if (lngStart > 0 && lngEnd > 0 && latEnd > 0) {
                    String lng = str.substring(lngStart + 5, lngEnd);
                    String lat = str.substring(lngEnd + 7, latEnd);
                    map = new HashMap<String, String>();
                    map.put("lng", lng);
                    map.put("lat", lat);
                    return map;
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                in.close();
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
        return null;
    }

    public static void main(String args[]) {
        try {
            Map<String, String> json = GetLatitudeUtils.getGeocoderLatitude("广州市白云区白云文化广场");
            System.out.println("lng : " + json.get("lng"));
            System.out.println("lat : " + json.get("lat"));
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public static Map<String,String> getlnglat(String paht){
        Map<String, String> json = GetLatitudeUtils.getGeocoderLatitude("百度大厦");
        return json;
    }

}
