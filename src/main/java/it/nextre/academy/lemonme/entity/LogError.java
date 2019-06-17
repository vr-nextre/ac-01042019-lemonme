package it.nextre.academy.lemonme.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.Entity;
import javax.persistence.Table;
import java.time.LocalDateTime;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Entity
@Table(name="log_error")
public class LogError extends BaseEntity{

    private String messaggio;
    private int gravita;
    private String categoria;

}//End class
