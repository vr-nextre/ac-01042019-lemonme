package it.nextre.academy.lemonme.config;

import it.nextre.academy.lemonme.entity.Utente;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

public class CustomUserDetails extends Utente implements UserDetails {

    //private User ut;

    public CustomUserDetails(Utente ut){
        super(ut.getNome(),ut.getCognome(),ut.getMail(),ut.getPassword(),ut.getRoles(),ut.getId());
    }



    @Override
    public Collection<? extends GrantedAuthority> getAuthorities() {
        List<GrantedAuthority> authorities = new ArrayList<>();
        getRoles().stream().forEach(r->{
            authorities.add(new SimpleGrantedAuthority(r.getName()));
        });
        return authorities;
    }

    @Override
    public String getPassword() {
        return super.getPassword();
    }

    @Override
    public String getUsername() {
        return super.getMail();
    }

    @Override
    public boolean isAccountNonExpired() {
        return true;
    }

    @Override
    public boolean isAccountNonLocked() {
        return true;
    }

    @Override
    public boolean isCredentialsNonExpired() {
        return true;
    }

    @Override
    public boolean isEnabled() {
        return true;
    }

    @Override
    public String toString() {
        return super.toString();
    }
}//end class
