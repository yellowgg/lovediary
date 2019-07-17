// document.write("<script type='text/javascript' " +
//     "src='https://blog-static.cnblogs.com/files/yellowgg/L2Dwidget.min.js'></script>");
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