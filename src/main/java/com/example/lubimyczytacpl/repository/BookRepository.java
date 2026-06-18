package com.example.lubimyczytacpl.repository;

import com.example.lubimyczytacpl.model.Book;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface BookRepository extends JpaRepository<Book, Long> {
}