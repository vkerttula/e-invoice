package fi.vamk.elasku;

import javax.sql.DataSource;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

@Configuration
@EnableWebSecurity
public class SecurityConfig extends WebSecurityConfigurerAdapter {
	
	@Autowired
	DataSource dataSource;
	
	@Autowired
	public void configureSecurity(AuthenticationManagerBuilder auth) throws Exception {
		auth.jdbcAuthentication().dataSource(this.dataSource)
		.usersByUsernameQuery("select userEmail,password,'true' as enabled from user where userEmail=?")
		.authoritiesByUsernameQuery("select userEmail,rolename from user where userEmail=?")
		.passwordEncoder(new BCryptPasswordEncoder());
	}

	@Override
	protected void configure(HttpSecurity http) throws Exception {
		http.authorizeRequests().antMatchers("/ManageUsers") // Admin rights
		.access("hasRole('ROLE_ADMIN')")
		.antMatchers("/app*", "/app/*").access("hasRole('ROLE_USER') or hasRole('ROLE_ADMIN')") // User rights
		.and()
		.formLogin()
		.loginPage("/login")
		.permitAll()
		.loginProcessingUrl("/Perform_login")
		.defaultSuccessUrl("/Testrole", true)
		.failureUrl("/login?error")
		.usernameParameter("userEmail")
		.passwordParameter("password")
		.and()
		.logout()
		.permitAll()
		.invalidateHttpSession(true)
		 .clearAuthentication(true)
		.logoutSuccessUrl("/login?logout")
		.and()
		.csrf().disable(); // Cross-Site Request Forgery disabled
	}
	
}