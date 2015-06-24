package su.arth.Domen;

import javax.persistence.*;
import java.util.HashSet;
import java.util.Set;

/**
 * Created by arthur on 28.03.15.
 */
@Entity
@Table(name = "cars")
public class Car {

    public  Car(){

    }

    public Car(String name, String url, String status, double lon, double lat, boolean onStarting, boolean onProtection, Set<User> users,long vincode) {
        this.name = name;
        this.url = url;
        this.status = status;
        this.lon = lon;
        this.lat = lat;
        this.onStarting = onStarting;
        this.onProtection = onProtection;
        this.users = users;
        this.vincode = vincode;
    }

    public Car(String name, String url, long vincode, Set<User> users) {
        this.name = name;
        this.url = url;
        this.vincode = vincode;
        this.users = users;
    }

    @Id
    @Column(name = "idCar",nullable = false)
    @GeneratedValue
    private Integer id;


    @Column(name = "name")
   private String name;
    @Column(name="url")
    private String url;
    @Column(name="status")
    private String status;
    @Column(name = "lon")
    private  double lon;
    @Column(name = "lat")
    private double lat;
    @Column(name = "onStarting")
    private boolean onStarting;
    @Column(name = "onProtection")
    private boolean onProtection;
@Column(name = "vin",nullable = false)
private long vincode;



    @ManyToMany(cascade=CascadeType.ALL,mappedBy = "cars")

    private Set<User> users = new HashSet<User>();



    public Set<User> getUsers() {
        return this.users;
    }

    public void setUsers(Set<User> users) {
        this.users = users;
    }


    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public double getLon() {
        return lon;
    }

    public void setLon(double lon) {
        this.lon = lon;
    }

    public double getLat() {
        return lat;
    }

    public void setLat(double lat) {
        this.lat = lat;
    }

    public boolean isOnStrting() {
        return onStarting;
    }

    public void setOnStrting(boolean onStrting) {
        this.onStarting = onStrting;
    }

    public boolean isOnprotection() {
        return onProtection;
    }

    public void setOnprotection(boolean onprotection) {
        this.onProtection = onprotection;
    }


    public boolean isOnStarting() {
        return onStarting;
    }

    public void setOnStarting(boolean onStarting) {
        this.onStarting = onStarting;
    }

    public boolean isOnProtection() {
        return onProtection;
    }

    public void setOnProtection(boolean onProtection) {
        this.onProtection = onProtection;
    }

    public long getVincode() {
        return vincode;
    }

    public void setVincode(long vincode) {
        this.vincode = vincode;
    }
}
