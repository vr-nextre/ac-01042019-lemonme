package it.nextre.academy.lemonme.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.Column;
import javax.validation.constraints.NotNull;


@Data
@NoArgsConstructor
@AllArgsConstructor
public class Hidden{

    @NotNull
    @Column(name="value")
    private String value;

}//End class
