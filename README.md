# 开发笔记
随便做的一个小demo哄女友开心的。顺便记下一些遇到的问题。

## 防止访问ajax的url
>@RequestMapping(value = "/findAll", method = RequestMethod.POST)

## 拦截登录，登录之后返回上一个页面
在拦截器里获取所拦截的url，存入session，然后跳转到登录页面，  
然后登录成功之后，扫描session有没有要跳转的页面，有就跳转

## 时间会少一天
在连接数据库的字符串加上
>serverTimezone=Asia/Shanghai

## 密码双重加密
前端md5一次，服务器md5一次

## 注
jdbc配置文件已擦除


