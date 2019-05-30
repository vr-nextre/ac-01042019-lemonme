package it.nextre.academy.lemonme.dto;

import lombok.Data;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.NotNull;

@Data
public class SupportoDto {
    // https://www.javadevjournal.com/spring-mvc/spring-bean-validation/
    //todo @NotNull vs @NotEmpty vs @NotBlank

    @NotNull(message="Nome obbligatorio")
    private String nome;
    @NotNull
    @NotBlank //simile a @notEmpty ma trimma la stringa
    private String email;
    @NotNull
    private String oggetto;
    @NotNull
    private String messaggio;
}//end class
