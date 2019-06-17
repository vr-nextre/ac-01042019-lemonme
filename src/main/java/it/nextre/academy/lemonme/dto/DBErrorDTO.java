package it.nextre.academy.lemonme.dto;

import lombok.AllArgsConstructor;
import lombok.Data;

import javax.validation.constraints.NotNull;

@Data
@AllArgsConstructor
public class DBErrorDTO {

    @NotNull
    private int gravitaErrore;

    @NotNull
    private String messaggio;

}//end class
