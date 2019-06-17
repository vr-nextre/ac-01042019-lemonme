package it.nextre.academy.lemonme.dto;

import it.nextre.academy.lemonme.entity.Utente;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.web.multipart.MultipartFile;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.NotNull;
import java.io.File;
import java.sql.Date;
import java.util.List;

@NoArgsConstructor
@Data
public class UtenteDTO {

    //@NotNull prende stringhe nulle
    //@NotEmpty guarda se la stringa è più lunga di 0
    //@NotBlank guarda se la stringa trimmata è più lunga di 0

    @NotBlank(message = "Campo obbligatorio")
    private String nome;

    @NotBlank(message = "Campo obbligatorio")
    private String cognome;

    @NotBlank(message = "Campo obbligatorio")
    private String mail;

    @NotNull
    /*@NotEmpty(message = "Valore non valido")*/
    private String password;

    @NotNull
    /*@NotEmpty(message = "Valore non valido")*/
    private String confirmPassword;

    @NotNull(message = "Campo obbligatorio")
    private Date dataDiNascita;

    private Character sesso;

    private Character interesse;

    private String descrizione;

    private List<Utente> amici;

    private List<Utente> amiciDi;

    private List<Utente> limoni;

    private MultipartFile immagine;


    public UtenteDTO(Utente utente){
        this.nome = utente.getNome();
        this.cognome = utente.getCognome();
        this.mail = utente.getMail();
        //this.password = utente.getPassword();
        //this.confirmPassword = utente.getPassword();
        this.dataDiNascita = utente.getDataDiNascita();
        this.sesso = utente.getSesso();
        this.interesse = utente.getInteresse();
        this.descrizione = utente.getDescrizione();
        this.amici = utente.getAmici();
        this.amiciDi = utente.getAmiciDi();
    }

}//end class
