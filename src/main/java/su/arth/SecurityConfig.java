package su.arth;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.authentication.encoding.Md5PasswordEncoder;
import org.springframework.security.authentication.encoding.PasswordEncoder;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.config.annotation.web.servlet.configuration.EnableWebMvcSecurity;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.web.authentication.AuthenticationFailureHandler;
import org.springframework.security.web.util.matcher.AntPathRequestMatcher;

/**
 * Created by salimhanov on 18.06.2015.
 */
@Configuration
@EnableWebMvcSecurity
public class SecurityConfig extends WebSecurityConfigurerAdapter {


    @Autowired
    @Qualifier("myUserDetailsService")
    UserDetailsService myUserDetailsService;

@Autowired
@Qualifier("authenticationFailureHandler")
AuthenticationFailureHandler authenticationFailureHandler;


    @Autowired
    public void configureGlobal(AuthenticationManagerBuilder auth) throws Exception {
        auth.userDetailsService(myUserDetailsService).passwordEncoder(passwordEncoder());
    }

    @Bean
    public PasswordEncoder passwordEncoder(){
        PasswordEncoder encoder = new Md5PasswordEncoder();
        return encoder;
    }




    @Override
    protected void configure(HttpSecurity http) throws Exception {
//        http.authorizeRequests().anyRequest().authenticated().and().formLogin().loginPage("/login").passwordParameter("password").usernameParameter("username").permitAll();



        http.authorizeRequests().antMatchers("/admin/**")
                .access("hasRole('ROLE_ADMIN')").and();



        http.csrf().and().authorizeRequests()
                .antMatchers("/resources/**").permitAll()
                .anyRequest().permitAll()
                .and();

        http.authorizeRequests().antMatchers("/**").access("isAuthenticated").and();

        http.formLogin()
                .loginPage("/login")
                .failureHandler(authenticationFailureHandler)
                .loginProcessingUrl("/j_spring_security_check")
                .usernameParameter("username")
                .passwordParameter("password").permitAll()
                .and()
                .logout().permitAll().logoutRequestMatcher(new AntPathRequestMatcher("/logout"))
                /*.logoutUrl("/j_spring_security_logout").logoutSuccessUrl("/login")*/
                .invalidateHttpSession(true).and().exceptionHandling().accessDeniedPage("/403");



    }




    }
