package utils;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;

import org.hibernate.SessionFactory;
import org.springframework.context.ApplicationContext;
import org.springframework.web.context.WebApplicationContext;

@WebFilter("/*")
public class OpenSessionInViewFilter implements Filter {
	private FilterConfig filterConfig;
	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
		this.filterConfig = filterConfig;
		
		ApplicationContext context = (ApplicationContext)
				filterConfig.getServletContext().getAttribute(WebApplicationContext.ROOT_WEB_APPLICATION_CONTEXT_ATTRIBUTE);
		sessionFactory = (SessionFactory) context.getBean("sessionFactory");
	}
	private SessionFactory sessionFactory;
	@Override
	public void doFilter(ServletRequest req, ServletResponse resp,
			FilterChain chain) throws IOException, ServletException {
		try {
			System.out.println("transaction begin");
			sessionFactory.getCurrentSession().beginTransaction();
			chain.doFilter(req, resp);
			sessionFactory.getCurrentSession().getTransaction().commit();
			System.out.println("transaction commit");
		} catch (Exception e) {
			sessionFactory.getCurrentSession().getTransaction().rollback();
			e.printStackTrace();
			chain.doFilter(req, resp);
		}
	}
	@Override
	public void destroy() {

	}
}
