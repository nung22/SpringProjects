package com.nicholasung.mvc.controllers;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.nicholasung.mvc.models.Book;
import com.nicholasung.mvc.services.BookService;

@Controller
public class BookController {
    private final BookService bookService;
    public BookController(BookService bookService){
        this.bookService = bookService;
    }
    
    @RequestMapping("/")
    public String index() {
        return "redirect:/books";
    }
    
    @RequestMapping("/books")
    public String index(Model model) {
        List<Book> books = bookService.allBooks();
        model.addAttribute("books", books);
        return "books.jsp";
    }
    
    @RequestMapping("/books/{id}")
    public String showBookById(
    		@PathVariable("id") Long id,
    		HttpSession session) {
        Book book = bookService.findBook(id);
        session.setAttribute("book", book);
        return "show.jsp";
    }
}
