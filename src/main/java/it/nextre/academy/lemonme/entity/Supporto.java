package it.nextre.academy.lemonme.entity;


import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.Entity;
import javax.persistence.Table;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Entity
@Table(name="supporto")
public class Supporto extends BaseEntity{

    private String nome;
    private String email;
    private String oggetto;
    private String messaggio;

}//end class
