package com.utc.entity;

import lombok.*;
import org.hibernate.annotations.DynamicInsert;
import org.hibernate.annotations.DynamicUpdate;

import javax.persistence.*;
import java.io.Serializable;
import java.util.List;


@Table(name = "`UserType`")
@Entity
@Getter
@Setter
@NoArgsConstructor
@DynamicInsert
@DynamicUpdate
public class UserType implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "`ut_id`")
    private int id;

    @Column(name = "`ut_name`" ,nullable = false, columnDefinition = "DEFAULT 'GUESTS'")
    @Enumerated(EnumType.STRING)
    private Type type;

//    @OneToMany(mappedBy = "userType")
//    private List<Guests> guests;

    public enum Type{
        GUESTS,ADMIN;

        public static Type toEnum(String strClient){
            for (Type item : Type.values()){
                if (item.toString().equalsIgnoreCase(strClient)){
                    return item;
                }
            }
            return null;
        }
    }

}
