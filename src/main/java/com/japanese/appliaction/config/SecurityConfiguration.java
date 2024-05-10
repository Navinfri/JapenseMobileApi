package com.japanese.appliaction.config;

import java.io.IOException;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.core.Authentication;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.SecurityFilterChain;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;

import com.japanese.appliaction.model.Authorities;
import com.japanese.appliaction.repository.AuthoritiesRepository;
import com.japanese.appliaction.repository.UserRepository;
import com.japanese.appliaction.service.UserService;

import org.springframework.security.core.userdetails.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

//Sahil
 
@Configuration
@EnableWebSecurity
public class SecurityConfiguration {
	
	private static final String ADMIN = "ADMIN";
	private static final String MODERATOR = "MODERATOR";
	private static final String CREATOR = "CREATOR";
	private static final String VIEWER = "VIEWER";
	
	String [] delete = {"/createUser","/getAllUsers","/deleteUsers/**",
			"/findUserById/**","/toggle-flag/**,/updateUser","/deleteCourse/**","/deleteTeacher/**"
			,"/deleteTeacherAndTeacherRole/**","/deleteBatches/**","/deleteCategory/**"
			,"/deleteAddMaterial","/deleteQueType"};
	
	String [] create = {"/saveCourse","/saveTeacher/**","/saveBatches","/saveCategoryData"
			,"/saveAddMaterial","/saveTypeOfQuestions","/saveRoles"};
	
	String [] update = {"/updateCourse/**","/updateTeacher/**","/updateRole"
			,"/updateTeacherDataInBothTable/**","/editBatches/**","/updateCategory"
			,"/updatematerial","/upadateQueType","/editRoles/**"};
	
	String [] find = {"/course/**","/courses/**","/getAllTeacher","/teacher/**"
			,"/getTeacherByFullName","/getAllBatchesData","/getBatchesDataById/**"
			,"/listCategory","/categoryFindById/**","/findMaterialById/**","/getAddMaterial"
			,"/listAllQuestions","/questionFindById/**","/getRolesData","/getRolesDataById/**"
			};
	
	
	@Autowired
	private DataSource dataSource;
	
	@Autowired
	private UserRepository userRepository;
	
	@Autowired
	private UserService userService;
	
	
	
	
	@Autowired
	public void authManager(AuthenticationManagerBuilder auth) throws Exception {
	    auth.jdbcAuthentication()
	        .dataSource(dataSource)
	        .passwordEncoder(new BCryptPasswordEncoder())
	        .usersByUsernameQuery("select email , password , flag from user where email = ?")
	        .authoritiesByUsernameQuery("select email , role_name from authorities where email = ?");
	}
	
	    @Bean
	    public SecurityFilterChain securityFilterChain(HttpSecurity http) throws Exception {

	  
	        http.csrf().disable().
            authorizeHttpRequests(authorize -> {
					
		  			authorize
		  			.requestMatchers(delete).hasRole(ADMIN)
		  			.requestMatchers(find).hasAnyRole(ADMIN,MODERATOR,CREATOR,VIEWER)
				    .requestMatchers(create).hasAnyRole(ADMIN,MODERATOR,CREATOR)
				    .requestMatchers(update).hasAnyRole(MODERATOR,ADMIN)
				    .requestMatchers("/logout").permitAll() 
				    .anyRequest().authenticated();
						    
					
				}
	            ).formLogin()
            .successHandler(authenticationSuccessHandler())
            .and()
            .logout()
                .logoutUrl("/JapaneseAdminWebApp/logout") // Specify the logout URL
                .logoutSuccessUrl("/JapaneseAdminWebApp/") // Redirect to form login page after logout
                .invalidateHttpSession(true)
                .deleteCookies("JSESSIONID");


	        return http.build();
	        
	        
	    }
	 

		// Custom authentication success handler to store email value in session
	    private AuthenticationSuccessHandler authenticationSuccessHandler() {
	        return new AuthenticationSuccessHandler() {
	            @Override
	            public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response, Authentication authentication) throws IOException, ServletException {
	                HttpSession session = request.getSession();
	                if (authentication != null && authentication.getPrincipal() instanceof User) {
	                    User user = (User) authentication.getPrincipal();
	                    String userEmail = user.getUsername(); // Assuming email is the username
	                   
	                    
	                    com.japanese.appliaction.model.User user2 = userRepository.findByemail(userEmail);
	                    
	                    Authorities authorities =  userService.findByemail(userEmail);
	                    
	                    session.setAttribute("module", user2.getModule()); // Store email in session
	                    session.setAttribute("name", user2.getName());
	                    
	                    String roleName = authorities.getRoleName(); 
	                    String trimmedRoleName = roleName.substring(5);
	                    session.setAttribute("roleName", trimmedRoleName);
	            
	                }
	                response.sendRedirect("/JapaneseAdminWebApp/"); // Redirect to home page after successful login
	            }
	        };
	    }
	    
	 
	   

	
	

}
