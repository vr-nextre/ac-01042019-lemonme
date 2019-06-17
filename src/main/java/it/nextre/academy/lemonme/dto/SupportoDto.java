package it.nextre.academy.lemonme.dto;

import lombok.Data;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;

@Data
public class SupportoDTO {

    //@NotNull prende stringhe nulle
    //@NotEmpty guarda se la stringa è più lunga di 0
    //@NotBlank guarda se la stringa trimmata è più lunga di 0

    @NotNull(message = "Campo obbligatorio")
    private String nome;
    @NotNull
    @NotBlank(message = "Campo obbligatorio")
    private String email;
    @NotNull(message = "Campo obbligatorio")
    private String oggetto;
    @NotNull(message = "Campo obbligatorio")
    private String messaggio;

}//end class
