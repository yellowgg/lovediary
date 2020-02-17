// document.write("<script type='text/javascript' " +
//     "src='https://blog-static.cnblogs.com/files/yellowgg/L2Dwidget.min.js'></script>");


/*存在看板娘的地方肯定会请求日志分类*/
$(document).ready(function () {
    var allData;

    function loadingMonth(months) {
        $("#c_ul").empty();
        for (var i = 0; i < months.length; i++) {
            var typeId = months[i].categoryid;
            var typeCount = months[i].count;
            var typeName = months[i].categoryname;
            $("#c_ul").append("<a " + "href='" + $("#pageContextOfjs").val() + "/diary/findPage/1&" + typeId +
                "' class='list-group-item'><span class='badge' style='background-color: #1380ab;'>" + typeCount + "</span>" + typeName + "</a>")
        }
    }

    $(function () {
        //发送ajax 读取日记月份分类
        $.ajax({
            type: 'post',
            url: $("#pageContextOfjs").val() + '/category/findAll',
            contentType: 'application/json;charset=utf-8',
            data: {"": ""},//数据格式是json串
            success: function (data) {
                allData = data;
                // 后台的map是年份降序的，传过来却依然是年份降序
                var years = Object.keys(data).sort(function (a, b) {
                    return b - a;
                });
                for (var i = 0; i < years.length; i++) {
                    $("#yearSelect").append("<option value='" + years[i] + "'>" + years[i] + "年" + "</option>");
                }
                // 挂载下拉框中的年份对应月份
                loadingMonth(allData[$("#yearSelect").val()])
            }
        })
    });
    $(function () {
        $('#yearSelect').change(function () {
            loadingMonth(allData[$("#yearSelect").val()])
        });
    });
})

L2Dwidget.init({
    "model": {
        jsonPath: "https://unpkg.com/live2d-widget-model-miku@1.0.5/assets/miku.model.json",
        "scale": 1
    },
    "display": {
        "position": "right",
        "width": 200,
        "height": 300,
        "hOffset": 0,
        "vOffset": -20
    },
    "mobile": {
        "show": false,
        "scale": 0.5
    },
    "react": {
        "opacityDefault": 1,
        "opacityOnHover": 1
    }
});

