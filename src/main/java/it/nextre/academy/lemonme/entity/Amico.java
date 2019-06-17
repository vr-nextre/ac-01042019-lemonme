package it.nextre.academy.lemonme.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

import javax.persistence.*;


@Data
@NoArgsConstructor
@AllArgsConstructor
@Entity
@ToString
@Table(name="amico")
public class Amico extends BaseEntity {

   private int id1;
   private int id2;

   @Override
   public String toString() {
      return "Amico{" +
              "id1=" + id1 +
              ", id2=" + id2 +
              '}';
   }
} //end class
