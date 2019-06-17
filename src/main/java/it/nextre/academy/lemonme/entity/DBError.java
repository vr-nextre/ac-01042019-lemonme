package it.nextre.academy.lemonme.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;

@Data
@NoArgsConstructor
@AllArgsConstructor
@ToString
@Entity
@Table (name = "db_error")
public class DBError extends BaseEntity{

    @Column(name = "gravita_errore")
    private int gravitaErrore;

    private String messaggio;

}//end class
