package com.example.lab6.entities;

import jakarta.persistence.*;
import lombok.*;

@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
@Entity
@Builder
@Table(name = "category")
public class Category {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(nullable = false)
    private String name;

    @ManyToOne
    @JoinColumn(
            name = "parent_id",
            referencedColumnName = "id",
            foreignKey = @ForeignKey(name = "fk_category_category")
    )
    private Category category;
}
