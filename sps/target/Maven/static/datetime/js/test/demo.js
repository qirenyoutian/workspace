/**
 * jeDate 演示
 */
    var enLang = {                            
        name  : "en",
        month : ["01", "02", "03", "04", "05", "06", "07", "08", "09", "10", "11", "12"],
        weeks : [ "日","一","二","三","四","五","六" ],
        times : ["时","分","秒"],
        timetxt: ["时间","Start Time","End Time"],
        backtxt:"返回",
        clear : "清除",
        today : "现在",
        yes   : "确定",
        close : "关闭"
    }
    //英文语言
    jeDate("#startTime",{
        language:enLang,
        format: "YYYY-MM-DD hh:mm:ss"
    });
    jeDate("#endTime",{
    	language:enLang,
    	format: "YYYY-MM-DD hh:mm:ss"
    });