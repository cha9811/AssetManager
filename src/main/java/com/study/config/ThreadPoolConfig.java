package com.study.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.scheduling.concurrent.ThreadPoolTaskExecutor;
import java.util.concurrent.Executor;

@Configuration
public class ThreadPoolConfig {

	 @Bean(name = "clientInboundChannelExecutor")
	    public Executor clientInboundChannelExecutor() {
	        ThreadPoolTaskExecutor executor = new ThreadPoolTaskExecutor();
	        executor.setCorePoolSize(10);
	        executor.setMaxPoolSize(50);
	        executor.setQueueCapacity(100);
	        executor.setThreadNamePrefix("clientInboundChannel-");
	        executor.initialize();
	        return executor;
	    }

	    @Bean(name = "clientOutboundChannelExecutor")
	    public Executor clientOutboundChannelExecutor() {
	        ThreadPoolTaskExecutor executor = new ThreadPoolTaskExecutor();
	        executor.setCorePoolSize(10);
	        executor.setMaxPoolSize(50);
	        executor.setQueueCapacity(100);
	        executor.setThreadNamePrefix("clientOutboundChannel-");
	        executor.initialize();
	        return executor;
	    }
}