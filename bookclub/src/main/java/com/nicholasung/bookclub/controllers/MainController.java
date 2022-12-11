package com.nicholasung.bookclub.controllers;

import java.util.List;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;

import com.nicholasung.bookclub.models.Book;
import com.nicholasung.bookclub.models.LoginUser;
import com.nicholasung.bookclub.models.User;
import com.nicholasung.bookclub.services.BookService;
import com.nicholasung.bookclub.services.UserService;

@Controller
public class MainController {
   @Autowired
   private UserService userServ;
    
   @Autowired
   private BookService bookServ;
   
   // LOGIN & REGISTRATION
   @GetMapping("/")
   public String index(Model model) {
       // Bind empty User and LoginUser objects to the JSP
       // to capture the form input
       model.addAttribute("newUser", new User());
       model.addAttribute("newLogin", new LoginUser());
       return "index.jsp";
   }
   // Registration
   @PostMapping("/register")
   public String register(@Valid @ModelAttribute("newUser") User newUser, 
           BindingResult result, Model model, HttpSession session) {
       
       // TO-DO Later -- call a register method in the service 
       // to do some extra validations and create a new user!
       userServ.register(newUser, result);
   	
       if(result.hasErrors()) {
           // Be sure to send in the empty LoginUser before 
           // re-rendering the page.
           model.addAttribute("newUser", newUser);
           model.addAttribute("newLogin", new LoginUser());
           return "index.jsp";
       }
       
       // No errors! 
       // TO-DO Later: Store their ID from the DB in session, 
       // in other words, log them in.
       session.setAttribute("user", newUser);
       return "redirect:/books";
   }
   // Login
   @PostMapping("/login")
   public String login(@Valid @ModelAttribute("newLogin") LoginUser newLogin, 
           BindingResult result, Model model, HttpSession session) {
       
       // Add once service is implemented:
       // User user = userServ.login(newLogin, result);
   	User user = userServ.login(newLogin, result);
   	
       if(result.hasErrors()) {
           model.addAttribute("newUser", new User());
           model.addAttribute("newLogin", newLogin );
           return "index.jsp";
       }
   
       // No errors! 
       // TO-DO Later: Store their ID from the DB in session, 
       // in other words, log them in.
       session.setAttribute("user", user);
       return "redirect:/books";
   }
   
   // DASHBOARD
   @GetMapping("/books")
   public String home(HttpSession session, Model model) {
	   if(session.getAttribute("user") == null) {
		   return "redirect:/logout";
	   }
	   List<Book> books = bookServ.allBooks();
	   model.addAttribute("books", books);
	   return "books.jsp";
   }
   
   // SHOW BOOK INFO
   @GetMapping("/books/{id}")
   public String show(HttpSession session, @PathVariable("id") Long id, 
		   Model model) {
	   if(session.getAttribute("user") == null) {
		   return "redirect:/logout";
	   }
	   Book book = bookServ.findBook(id);
	   model.addAttribute("book", book);
	   return "/books/show.jsp";
   }
   
   // ADD BOOK PAGE
   @GetMapping("/books/new")
   public String addBook(HttpSession session, 
		   @ModelAttribute("book") Book emptyBook) {
	   if(session.getAttribute("user") == null) {
		   return "redirect:/logout";
	   }
	   return "/books/create.jsp";
   }
   // Add Book
   @PostMapping("/books/new")
   public String addBook(@Valid @ModelAttribute("book") Book filledBook, 
		   BindingResult result) {
	   if(result.hasErrors()) {		   
		   return "/books/create.jsp";
	   }
	   bookServ.createBook(filledBook);
	   return "redirect:/books";
   }
   
   // EDIT BOOK PAGE
   @GetMapping("/books/{id}/edit")
   public String editBook(HttpSession session, 
		   @PathVariable("id") Long id, Model model) {
	   if(session.getAttribute("user") == null) {
		   return "redirect:/logout";
	   }
	   Book book = bookServ.findBook(id);
	   model.addAttribute("book", book);
	   return "/books/edit.jsp";
   }
   // Edit Book
   @PutMapping("/books/{id}/edit")
   public String editBook(@PathVariable("id") Long id,
		   @Valid @ModelAttribute("book") Book editedBook,
		   BindingResult result) {
	   if(result.hasErrors()) {
		   return "/books/edit.jsp";
	   }
	   bookServ.updateBook(editedBook);
	   return "redirect:/books";
   }
   
   // DELETE BOOK
   @GetMapping("/books/{id}/delete")
   public String delete(@PathVariable("id") Long id) {
	   bookServ.deleteBook(id);
	   return "redirect:/books";
   }
   
   // LOGOUT
   @GetMapping("/logout")
   public String logout(HttpSession session) {
   	session.invalidate();
   	return "redirect:/";
   }
}
