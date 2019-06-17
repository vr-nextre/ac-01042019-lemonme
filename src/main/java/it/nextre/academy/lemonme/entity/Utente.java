package it.nextre.academy.lemonme.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.*;
import java.sql.Date;
import java.util.Collection;
import java.util.List;


@Data
@AllArgsConstructor
@NoArgsConstructor
@Entity
@Table(name="utente")
public class Utente extends BaseEntity{

    private String nome;
    private String cognome;


    @Column(name= "data_di_nascita",updatable = false )
    private Date dataDiNascita;

    private Character sesso;

    private Character interesse;



    @Column(unique = true)
    private String mail;

    private String password;

    @Column(columnDefinition = "TEXT")
    private String descrizione;

    @OneToMany(fetch = FetchType.EAGER,cascade = CascadeType.ALL)
    @JoinTable(
            name = "users_roles",
            joinColumns = @JoinColumn(
                    name = "user_id", referencedColumnName = "id"),
            inverseJoinColumns = @JoinColumn(
                    name = "role_id", referencedColumnName = "id"))
    private Collection<Role> roles;

    @ManyToMany
    @JoinTable(name="amico",
            joinColumns=@JoinColumn(name="id1"),
            inverseJoinColumns=@JoinColumn(name="id2")
    )
    private List<Utente> amici;

    @ManyToMany
    @JoinTable(name="amico",
            joinColumns=@JoinColumn(name="id2"),
            inverseJoinColumns=@JoinColumn(name="id1")
    )
    private List<Utente> amiciDi;

    public Utente(String nome, String cognome, String mail, String password, Collection<Role> roles, Integer id) {
        this.nome=nome;
        this.cognome=cognome;
        this.mail=mail;
        this.password=password;
        this.roles = roles;
        this.id=id;
    }


    public Utente(String nome, String cognome, Date dataDiNascita, Character sesso, Character interesse, String mail, String descrizione,List<Utente> amici, List<Utente> amiciDi){

        this.nome=nome;
        this.cognome=cognome;
        this.dataDiNascita=dataDiNascita;
        this.sesso=sesso;
        this.interesse=interesse;
        this.mail=mail;
        this.descrizione=descrizione;
        this.amici=amici;
        this.amiciDi=amiciDi;
    }
/*
    @ManyToMany
    @JoinTable(name="limone",
            joinColumns=@JoinColumn(name="id1"),
            inverseJoinColumns=@JoinColumn(name="id2")
    )
    private List<Utente> limoni;

    @ManyToMany
    @JoinTable(name="limone",
            joinColumns=@JoinColumn(name="id2"),
            inverseJoinColumns=@JoinColumn(name="id1")
    )
    private List<Utente> limoniDi;*/

    @Override
    public String toString() {
        return "Utente{" +
                "nome='" + nome + '\'' +
                ", cognome='" + cognome + '\'' +
                ", mail='" + mail + '\'' +
                ", id=" + id +
                '}';
    }




}//end class
