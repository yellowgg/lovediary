var ii = -1;
// var t = ['愿', '得', '一', '人', '心', '白', '首', '不', '分', '离', '致', '彤', '彤'];
// var t = [];
(function (window, document, undefined) {
    var hearts = [];
    window.requestAnimationFrame = (function () {
        return window.requestAnimationFrame || window.webkitRequestAnimationFrame || function (callback) {
            setTimeout(callback, 1000 / 60)
        }
    })();
    init();

    function init() {
        css(".heart{position: fixed;font-size:3em;}");
        attachEvent();
        gameloop()
    }

    function gameloop() {
        for (var i = 0; i < hearts.length; i++) {
            if (hearts[i].alpha <= 0) {
                document.body.removeChild(hearts[i].el);
                hearts.splice(i, 1);
                continue
            }
            hearts[i].y--;
            hearts[i].alpha -= 0.013;
            hearts[i].el.style.cssText = "left:" + hearts[i].x + "px;top:" + hearts[i].y + "px;opacity:" + hearts[i].alpha + ";color:" + hearts[i].color + ";transform:scale(1,1)"
        }
        requestAnimationFrame(gameloop)
    }

    function attachEvent() {
        var old = typeof window.onclick === "function" && window.onclick;
        window.onclick = function (event) {
            old && old();
            createHeart(event)
        }
    }

    function createHeart(event) {
        var d = document.createElement("font");
        if (ii != t.length - 1) {
            ii++
        } else {
            ii = 0
        }
        d.innerHTML = t[ii];
        d.className = "heart";
        hearts.push({
            el: d,
            x: event.clientX - 10,
            y: event.clientY - 10,
            alpha: 1.5,
            color: randomColor()
        });
        document.body.appendChild(d)
    }

    function css(css) {
        var style = document.createElement("style");
        style.type = "text/css";
        try {
            style.appendChild(document.createTextNode(css))
        } catch (ex) {
            style.styleSheet.cssText = css
        }
        document.getElementsByTagName('head')[0].appendChild(style)
    }

    function randomColor() {
        return "rgb(" + (~~(Math.random() * 255)) + "," + (~~(Math.random() * 255)) + "," + (~~(Math.random() * 255)) + ")"
    }
})(window, document);