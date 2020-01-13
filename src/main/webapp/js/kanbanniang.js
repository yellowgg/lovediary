// document.write("<script type='text/javascript' " +
//     "src='https://blog-static.cnblogs.com/files/yellowgg/L2Dwidget.min.js'></script>");


/*存在看板娘的地方肯定会请求日志分类*/
$(document).ready(function () {
    $(function () {
        //发送ajax 读取日记月份分类
        $.ajax({
            type: 'post',
            url: $("#pageContextOfjs").val() + '/category/findAll',
            contentType: 'application/json;charset=utf-8',
            data: {"": ""},//数据格式是json串
            success: function (data) {
                //挂载到右边，遍历json列表，获取每一个分类，包装成li标签，插入到ul内部
                for (var i = 0; i < data.length; i++) {
                    var typeId = data[i].categoryid;
                    var typeCount = data[i].count;
                    var typeName = data[i].categoryname;
                    $("#c_ul").append("<a " +
                        "href='" + $("#pageContextOfjs").val() + "/diary/findPage/1&" + typeId +
                        "' class='list-group-item'><span class='badge' style='background-color: #1380ab;'>" +
                        typeCount + "</span>" + typeName + "</a>")
                }
            }
        })
    })
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

