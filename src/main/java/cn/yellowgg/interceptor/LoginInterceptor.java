package cn.yellowgg.interceptor;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * @Author:黄广
 * @Description:登录拦截器
 * @Date: Created in 19-4-3 下午3:07
 */
public class LoginInterceptor implements HandlerInterceptor {

    /**
     * 在拦截点执行前拦截，如果返回true则不执行拦截点后的操作（拦截成功）
     *
     * @param httpServletRequest
     * @param httpServletResponse
     * @param o
     * @return
     * @throws Exception
     */
    @Override
    public boolean preHandle(HttpServletRequest httpServletRequest,
                             HttpServletResponse httpServletResponse, Object o) throws Exception {
        //获取session
        HttpSession session = httpServletRequest.getSession();
        //获取请求地址
        String uri = httpServletRequest.getRequestURI();
        //如果已经登录，放行
        if (session.getAttribute("crrentUser") != null) {
            return true;
        } else {
            //如果是静态资源请求，放行
            if (uri.contains("css") || uri.contains("js")
                    || uri.contains("im") || uri.contains("fonts")
                    || uri.contains("layer")) {
                return true;
            } else {
                //即不是访问静态资源也没有登录还想访问拦截的地址，打下天牢（登录界面）
                String path = uri.substring(httpServletRequest.getContextPath().length());
                String query = httpServletRequest.getQueryString();//得到参数
                if (query == null) {
                    query = "";
                } else {
                    query = "?" + query;
                }
                String previousPath = path + query;
                session.setAttribute("previousPath", previousPath);

                //没有登录,跳转到登录界面
                httpServletResponse.sendRedirect(httpServletRequest.getContextPath() + "/user/loginUI");
            }
            return false;
        }
    }

    @Override
    public void postHandle(HttpServletRequest httpServletRequest,
                           HttpServletResponse httpServletResponse, Object o, ModelAndView modelAndView) throws Exception {
    }

    @Override
    public void afterCompletion(HttpServletRequest httpServletRequest,
                                HttpServletResponse httpServletResponse, Object o, Exception e) throws Exception {
    }
}
