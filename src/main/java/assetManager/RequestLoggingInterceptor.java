//package assetManager;
//
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpServletResponse;
//
//import org.slf4j.Logger;
//import org.slf4j.LoggerFactory;
//import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;
//
//
//public class RequestLoggingInterceptor extends HandlerInterceptorAdapter {
//
//    private static final Logger logger = LoggerFactory.getLogger(RequestLoggingInterceptor.class);
//
////    @Override
////    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
////    	logger.info("Incoming request data: method={}, URI={}, query string={}", 
////    			request.getMethod(), 
////                request.getRequestURI(), 
////                request.getQueryString());
////        return true;
////    }
//}