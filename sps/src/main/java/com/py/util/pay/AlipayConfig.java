package com.py.util.pay;

public class AlipayConfig {
    // 1.商户appid
    public static String APPID = "2018041402556436";    
    
    // 2.私钥 pkcs8格式的
    public static String RSA_PRIVATE_KEY ="MIIEvwIBADANBgkqhkiG9w0BAQEFAASCBKkwggSlAgEAAoIBAQDev9UbhU/OsyUoadtIultNLY93RsufYcmQxV9SKcCi9zcd5Pkff7USikqpAHei2YnSpWi/beRmY3uwzpIej1CIzf5qjhMMnBmcUnz8uHf5Q4TfaFM/InV9uxMNd7iZU4/kVITRi9goIi3wfBFrrXvyjSeo0cjsLR0inyn8I0IUijo/JjRMghDnDel6w5NmRYNcUDKeL8T1DwNQDGK+fGAsR/yW2GrR0lOMkA8ekf9tU7VnhoZm3RH26WHz2X1xb4jLxJa6K01YFyvD94A7uqgqE5Wpeg9L1JMsylcalw/Fbu7429wqDOEgYislPihUdaSa1c9vZllO7xhmtOyj8IaZAgMBAAECggEABC/3AZ1v8qLLgAb9aFCYhsrkd4mNKmHcOCx9rj26sVWUY6t6Q21TKhYPcT3hAd61CJCzd2XJdWNJX/mCJbDsAqZcsgQZt5L3qEiksNuG5divFsQPTJCJROPPZ+FoRvmbKt+r34SRe6+ozWyHp06LlfOxWysWa9otQglb8LF4/InTs91a+czb5EqLWlDcRCP2Yen7vAFqc7QERf+gwEQmknVAGyO9yAmH/FVXzRQaIrdG+qkJmDz8oiTKcc78Z3r1xvC4vNjhRxoeX7ILNL0bwQUYnkZDSYzgi23FKMzJma1b8OflvFzarlbPtZpiPXG34UikxmKItQwkmjasAJetQQKBgQDx/aG/44bRhsUf4sTiQF5v9kCTG+tThuZCly6K3EFZOVQwlzWPGi/jPuYPGoPVLEAQfngQ8mPEVnx9KyuN3V+UTnaVLtJ65tQlBajDDqoC5rgbtMxa51/LUWfnNj17HT6820IsbcjzMmTkMgPuNdpY+VMmVkMedXAqy3do2wtYawKBgQDrpQmuxHHAzKlG6+YNMydh+EVOeOKviRMltLsxrARpUOlKQVSJekVXz+GpEjSP5wRUty7SR+KuORCC/z1ErSEl9vehokiWmh1RK+9iAB3XhayXLW42F/RYarIbaO6xPFo/xlx2VKmH3Q5OWDHyrL7CsgZje1vwIaF+kj+MP9GuCwKBgQDBkXd8Lf0exyYRfmys6n5gIuO+iNuxobu4UoRJUSv4uhHtGFcgU/swVJTkSfpgX5gTWYajT7CcUe4clZauUQDueeEDLkPxSYky4BcBiE5YKcPlbbb1lBSdZ02stkdxnpAbs2t4bI0MdCgeHR/lwTAacb2gceoYiCokIUMwHd8yZwKBgQCdxIN1FWUrtlrndu0xjTwi5bxRS7JJ4DaHmjdyjD7v3BI1ewQEf26J2k61idDTP9KwfWzFsQddqisZ6ZW1s0xsRKuK9kIvQsO6IvZE4NsZ/w+MsAgIA4W+5MCWhWy6ETRDWqVxPEG9Cw2W+omGdo3JgLOyS1dEsN+VBImzds8F/QKBgQC+wCH99ViE5ES2UNAXvGTdQUtWnx1OFnPutUy/SS/CDnKsM4LXrcoIIk08MXZ7gn864P2Nn8GnL9e7d5kVEbZT+/ItrKZWXSelG9PgnqKYxRZAR24SjsdZ99Z+Je65W/2Vyb4KpWLTN7zOey/xirlIngXv++X83v8UxVHY3Q5S/g==";
    
    // 3.支付宝公钥
    public static String ALIPAY_PUBLIC_KEY = "MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAjWIF2Tffjw7rpeBPgDLOqvvrPHUoPsvuKFgx/zXg0MHCJ6JG1/9ORaA9CA1EugvENMKVDQtXHJ0+Xn9M3eC2+0BjEnn/uGD6cdq0FolzLo/3A2jtwsx4NSekdlKC2uTe0qWb9l+8+UDA8i6ZWm29MYIIPjYlrt/Cu+VMT1aAYmMV2EGoqncWGVwKYFpDbzzqZPSO/Fs2q5ATQ7NxyqHSySuydY+lTL1Yzbauntb1YWzqgmIfmJo+vHOOeZv6lscxd61mQYJapxNcP9zzsisLBj1lRZQG8TA5ITuk2Z3lGxGoSQUN3DovCrL2AbnpGEmjZVz7j8zMrS0PJSvoTuUztwIDAQAB";
    
    //(转账)网关地址
  	public static final  String gateway_url = "	https://openapi.alipay.com/gateway.do";
    
    // 4.服务器异步通知页面路径 需http://或者https://格式的完整路径，不能加?id=123这类自定义参数，必须外网可以正常访问
    public static String notify_url = "http://39.108.239.193:8080/alipayNotify";
    
    // 5.页面跳转同步通知页面路径 需http://或者https://格式的完整路径，不能加?id=123这类自定义参数，必须外网可以正常访问 商户可以自定义同步跳转地址
    public static String return_url = "http://39.108.239.193:8080/alipay/return_url";
    
    // 6.请求网关地址
    public static String URL = "https://openapi.alipay.com/gateway.do";    
    //沙箱支付网关
    public static String sandbox_url = "https://openapi.alipaydev.com/gateway.do";
    // 7.编码
    public static String CHARSET = "utf-8";
    
    // 8.返回格式
    public static String FORMAT = "json";
    
    // 9.加密类型
    public static String SIGNTYPE = "RSA2";
    
    public static boolean falg = true;
}
