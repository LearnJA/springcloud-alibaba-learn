package com.common.code.utils;

import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang3.StringUtils;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import javax.servlet.http.HttpServletRequest;
import java.net.InetAddress;
import java.net.UnknownHostException;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Map;

/**
 * request请求处理工具
 */
@Slf4j
public class RequestUtil {

    private static final String STR_UNKNOWN = "unknown";

    /**
     * 静态获取request请求，本地junit非容器运行时无法使用， 服务未启动完成 无法使用
     * @return
     */
    public static HttpServletRequest getRequest() {
        try {
            ServletRequestAttributes attr = (ServletRequestAttributes) RequestContextHolder.currentRequestAttributes();
            if (attr != null) {
                return attr.getRequest();
            }
        } catch (Exception e) {
            log.error("", e);
        }
        return null;
    }

    /**
     * 取完整根路径， 防止重复contextpath
     * @param request request
     * @param page page
     * @return
     */
    public static String getRootURL(HttpServletRequest request, String page) {
        StringBuffer url = request.getRequestURL();
        String rootUrl = url.substring(0, url.indexOf(request.getRequestURI()));
        if (StringUtils.isEmpty(page)) {
            return rootUrl;
        }
        if (!rootUrl.endsWith("/") && !page.startsWith("/")) {
            rootUrl = rootUrl + "/";
        }
        return rootUrl + page;
    }

    /**
     * 取重定向完整根路劲，防止重复contextpath
     * @param request request
     * @param page page
     * @return
     */
    public static String getRootRedirectURL(HttpServletRequest request, String page) {
        StringBuffer url = request.getRequestURL();
        String redirect = url.substring(0, url.indexOf(request.getRequestURI()));

        String host = request.getHeader("Real-Host");
        if (StringUtils.isNotBlank(host)){
            redirect = redirect.replace(request.getHeader("Host"), host);
        }
        if (redirect.startsWith("http:")) {
            String referer = request.getHeader("referer");
            if (StringUtils.isNotBlank(referer) && referer.startsWith("https")) {
                redirect = redirect.replace("http:", "https:");
            }
        }
        if (StringUtils.isEmpty(page)) {
            return "redirect:" + redirect;
        }
        if (!redirect.endsWith("/") && !page.startsWith("/")) {
            redirect = redirect + "/";
        }
        return "redirect:" + redirect + page;

    }

    /**
     * 获取IP地址
     * @param request
     * @return
     */
    public static String getIpAddress(HttpServletRequest request) {
        String ipAddress = request.getHeader("x-forwarded-for");
        if (ipAddress == null || ipAddress.length() == 0 || "unknown".equalsIgnoreCase(ipAddress)) {
            ipAddress = request.getHeader("Proxy-Client-IP");
        }
        if (ipAddress == null || ipAddress.length() == 0 || "unknown".equalsIgnoreCase(ipAddress)) {
            ipAddress = request.getHeader("WL-Proxy-Client-IP");
        }
        if (ipAddress == null || ipAddress.length() == 0 || "unknown".equalsIgnoreCase(ipAddress)) {
            ipAddress = request.getRemoteAddr();
            if (ipAddress.equals("127.0.0.1") || ipAddress.equals("0:0:0:0:0:0:0:1")){
                // 根据网卡取本机配置的IP
                try{
                    InetAddress inet = InetAddress.getLocalHost();
                    ipAddress = inet.getHostAddress();
                } catch (UnknownHostException e) {
                    log.error("根据网卡获取本机配置的IP异常", e);
                }
            }
        }
        // 对于通过多个代理的情况， 第一个IP为客户端真实IP, 多个IP按照',' 分割
        if (ipAddress != null && ipAddress.indexOf(",") > 0) {
            // "***.***.***.***".length()
            ipAddress = ipAddress.split(",")[0];
        }
        return ipAddress;
    }

    /**
     * @param request
     * @return
     * @category 获取request参数
     */
    public static Map<String, String> request2Map(HttpServletRequest request) {
        Map<String, String> map = new HashMap<>();
        Enumeration<String> enums = request.getParameterNames();
        while (enums.hasMoreElements()) {
            String name = enums.nextElement();
            String value = request.getParameter(name);
            if (request.getParameter(name) != null) {
                value = StringUtils.join(request.getParameter(name), ",");
            }
            map.put(name, value);
        }
        return map;
    }
}
