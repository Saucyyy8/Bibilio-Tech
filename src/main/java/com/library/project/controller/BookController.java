package com.library.project.controller;

import com.library.project.model.Book;

import com.library.project.repository.BookRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Map;
import java.util.LinkedHashMap;
import java.util.stream.Collectors;

@Controller
public class BookController {

    @Autowired
    private BookRepository bookRepository;

    @GetMapping("/")
    public String home(Model model) {
        List<Book> featuredBooks = bookRepository.findRandomFeaturedBooks();
        model.addAttribute("featuredBooks", featuredBooks);
        return "index";
    }

    @GetMapping("/books")
    public String allBooks(Model model) {
        List<Book> books = bookRepository.findAll();
        // Group books by category (genre)
        Map<String, List<Book>> booksByGenre = books.stream()
            .collect(Collectors.groupingBy(
                b -> b.getCategory() != null && !b.getCategory().isEmpty() ? b.getCategory() : "Other",
                LinkedHashMap::new, Collectors.toList()
            ));
        model.addAttribute("booksByGenre", booksByGenre);
        return "books";
    }

    @GetMapping("/books/{id}")
    public String bookDetails(@PathVariable Long id, Model model) {
        Book book = bookRepository.findById(id)
                .orElseThrow(() -> new RuntimeException("Book not found"));
        model.addAttribute("book", book);
        return "book-details";
    }

    @GetMapping("/search")
    public String searchBooks(@RequestParam(required = false) String query,
                            @RequestParam(required = false) String category,
                            Model model) {
        List<Book> books;
        
        if (query != null && !query.isEmpty()) {
            if (category != null && !category.isEmpty()) {
                books = bookRepository.findByTitleContainingIgnoreCaseAndCategoryIgnoreCase(query, category);
            } else {
                books = bookRepository.findByTitleContainingIgnoreCaseOrAuthorContainingIgnoreCase(query, query);
            }
        } else if (category != null && !category.isEmpty()) {
            books = bookRepository.findByCategoryIgnoreCase(category);
        } else {
            books = bookRepository.findAll();
        }
        
        model.addAttribute("books", books);
        model.addAttribute("query", query);
        model.addAttribute("category", category);
        return "search-results";
    }
}
