package it.nextre.academy.lemonme.dto;

import lombok.AllArgsConstructor;
import lombok.Data;

@Data
@AllArgsConstructor
public class LogErrorDTO {

    private String messaggio;
    private int gravita;
    private String categoria;

}//End class
