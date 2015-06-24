package su.arth.Service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

@Service("myUserDetailsService")
public class MyUserDetailsService implements UserDetailsService {

//    private static final Logger logger = Logger.getLogger(MyUserDetailsService.class);


    @Autowired
    UserService userService;



    @Override
    public UserDetails loadUserByUsername (final String username)  {
        su.arth.Domen.User user = userService.getUser(username);

                       if(user==null){
                           throw new UsernameNotFoundException("user with username:"+username+" not fount");

                       }


        return buildUserForAuthentication(user);


    }

    private User buildUserForAuthentication(su.arth.Domen.User user) {

        List<GrantedAuthority> authorities = buildUserAuthority(user.getRole());

        return new User(user.getLogin(), user.getPassword(),authorities);
    }

    private List<GrantedAuthority> buildUserAuthority(String userRole) {

        Set<GrantedAuthority> setAuths = new HashSet<GrantedAuthority>();

        // Build user's authorities

            setAuths.add(new SimpleGrantedAuthority(userRole));


        List<GrantedAuthority> Result = new ArrayList<GrantedAuthority>(setAuths);

        return Result;
    }










}
