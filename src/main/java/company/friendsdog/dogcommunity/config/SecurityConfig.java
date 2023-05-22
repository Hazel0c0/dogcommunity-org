package company.friendsdog.dogcommunity.config;

import org.springframework.context.annotation.Bean;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.SecurityFilterChain;

//@Configuration -EnableWebSecurity에 포함되어있음
@EnableWebSecurity // 웹 보안 관련 설정을 이파일을 기반으로 적용
public class SecurityConfig {

  // 비밀번호 암호화 객체 빈 등록
  @Bean
  public PasswordEncoder encoder() {
    return new BCryptPasswordEncoder();
  }

  // 시큐리티 기본 설정을 처리하는 빈 등록
  @Bean
  public SecurityFilterChain filterChain(HttpSecurity http)
    throws Exception{
    //시큐리티 설치시 초기에 뜨는 강제 인증을 해제
    http.csrf().disable() // csrf 토큰공격 방어기능 해제
        .authorizeRequests() // 인증요청을 어느 url 패턴에서 인증해줄 것인가
        .antMatchers("/**") // /**은 모든페이지 인증없이 들어와
        .permitAll();

    return http.build();
  }
}
