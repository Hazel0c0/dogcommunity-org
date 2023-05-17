package company.friendsdog.dogcommunity.config;

import company.friendsdog.dogcommunity.interceptor.AutoLoginInterceptor;
import lombok.RequiredArgsConstructor;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration
@RequiredArgsConstructor
public class InterCeptorConfig implements WebMvcConfigurer {
  private final AutoLoginInterceptor autoLoginInterceptor;
  @Override
  public void addInterceptors(InterceptorRegistry registry) {

    // 자동 로그인 인터셉터 설정
    registry.addInterceptor(autoLoginInterceptor)
        .addPathPatterns("/**");
  }
}

