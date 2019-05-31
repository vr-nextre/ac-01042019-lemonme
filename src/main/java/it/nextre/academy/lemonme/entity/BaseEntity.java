package it.nextre.academy.lemonme.entity;

import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.ToString;

import javax.persistence.*;
import java.io.Serializable;
import java.sql.Timestamp;
import java.util.Date;

@MappedSuperclass  //permette di ereditare i campi su altre entity figlie
@EqualsAndHashCode
@ToString
@Getter
public class BaseEntity implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    public Integer id;

    public void setId(Integer id){
        this.id=id;
    }

    @Temporal(TemporalType.TIMESTAMP)
    @Column(name="data_creazione", updatable = false)
    private Date dataCreazione;

    @Temporal(TemporalType.TIMESTAMP)
    @Column(name="data_modifica", insertable = false)
    private Date dataModifica;

    @PrePersist
    void doCreate(){
        this.dataCreazione=new Timestamp(new Date().getTime());
    }

    @PreUpdate
    void doUpdate(){
        this.dataModifica=new Timestamp(new Date().getTime());
    }

}//end class
