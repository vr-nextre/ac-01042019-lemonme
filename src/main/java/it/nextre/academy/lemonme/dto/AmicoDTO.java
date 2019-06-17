package it.nextre.academy.lemonme.dto;

import lombok.Data;

import javax.validation.constraints.NotNull;

@Data
public class AmicoDTO {

    @NotNull
    private int id1;

    @NotNull
    private int id2;

} //end class
