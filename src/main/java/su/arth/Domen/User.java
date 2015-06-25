package su.arth.Domen;


import org.springframework.security.core.GrantedAuthority;

import javax.persistence.*;
import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

/**
 * Created by salimhanov on 19.03.2015.
 */

@Entity
@Table(name="users")
public class User {



    public User(){

    }

    public User(String login, String password) {
        this.login = login;
        this.password = password;

    }

    public User(String email, String password, String lastname, String firstname, String phone, Set<Car> cars,String role) {
        this.email = email;
        this.password = password;
        this.lastname = lastname;
        this.firstname = firstname;
        this.phone = phone;
        this.cars = cars;

    }

    public User(String email, String password, String lastname, String firstname, String phone) {
        this.email = email;
        this.password = password;
        this.lastname = lastname;
        this.firstname = firstname;
        this.phone = phone;

           }

    public User(String login, String password, List<GrantedAuthority> authorities) {
this.login = login;
        this.password = password;

    }

    @Id
    @Column(name = "idUser",nullable = false)
    @GeneratedValue
    private Integer id;

    @Pattern(regexp = "[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}", message = "Введите адрес почты в таком виде \"example@example.com\" ")
    @Column(name = "email")
    private String email;

    @Size(min = 6, max = 255)
    @Column(name = "password")
    private String password;

    @Size(max = 15)
    @Column(name = "lastname")
    private String lastname;

    @Size(max = 15)
    @Column(name = "firstname")
    private String firstname;


@Column(name = "username",nullable =  false)
private String login;


@Column(name = "phone",nullable = false)
private String phone;

    @ManyToMany(cascade=CascadeType.ALL,fetch = FetchType.LAZY)
    @JoinTable(name="common",
            joinColumns = {@JoinColumn(name="idUser")},
            inverseJoinColumns = {@JoinColumn(name="idCar")}
    )
    private Set<Car> cars = new HashSet<Car>(0);




    public Set<Car> getCars() {
        return this.cars;
    }

    public void setCars(Set<Car> cars) {
        this.cars = cars;
    }



   /* @OneToMany(cascade = CascadeType.ALL)
    @JoinTable(name = "roles")
    @JoinColumn(name = "nameRole")
    @MapsId("idRole")*/
    private String role;

    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }

    public String getLogin() {
        return login;
    }

    public void setLogin(String login) {
        this.login = login;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getLastname() {
        return lastname;
    }

    public void setLastname(String lastname) {
        this.lastname = lastname;
    }

    public String getFirstname() {
        return firstname;
    }

    public void setFirstname(String firstname) {
        this.firstname = firstname;
    }


    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }






}
