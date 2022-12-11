package com.nicholasung.bookclub.services;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.nicholasung.bookclub.models.Book;
import com.nicholasung.bookclub.repositories.BookRepository;

@Service
public class BookService {
	
	@Autowired
	BookRepository bookRepo;
	
    // returns all the books
    public List<Book> allBooks() {
        return bookRepo.findAll();
    }
    // creates a book
    public Book createBook(Book b) {
        return bookRepo.save(b);
    }
    // retrieves a book
    public Book findBook(Long id) {
    	return bookRepo.findById(id).orElse(null);
    }
    // updates a book
    public Book updateBook(Book b) {
        return bookRepo.save(b);
    }
    // deletes a book
    public void deleteBook(Long id) {
    	Optional<Book> optionalBook = bookRepo.findById(id);
    	if(optionalBook.isPresent()) {
    		bookRepo.deleteById(id);    		
    	}
    }
}
