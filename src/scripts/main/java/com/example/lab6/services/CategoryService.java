package com.example.lab6.services;

import com.example.lab6.entities.Category;
import com.example.lab6.repositories.CategoryRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class CategoryService {
    private final CategoryRepository categoryRepository;

    @Autowired
    public CategoryService(CategoryRepository categoryRepository) {
        this.categoryRepository = categoryRepository;
    }

    public Iterable<Category> getAllCategories() {
        return categoryRepository.findAll();
    }

    public Category getCategoryById(Long id) throws Exception {
        if (categoryRepository.existsById(id)) {
            return categoryRepository.findById(id).get();
        } else {
            throw  new Exception("Category not found");
        }
    }

    public Category createCategory(Category category) {
        return categoryRepository.save(category);
    }

    public Category updateCategoryName(Long id, String name) throws Exception {
        if (categoryRepository.existsById(id)) {
            Category category = categoryRepository.findById(id).get();
            category.setName(name);
            return categoryRepository.save(category);
        } else {
            throw new Exception("Category with provided id doesn't exist");
        }
    }

    public String deleteCategoryById(Long id) throws Exception {
        if (categoryRepository.existsById(id)) {
            categoryRepository.deleteById(id);
        } else {
            throw new Exception("Failed to delete category");
        }
        return String.format("Category %d was deleted", id);
    }
}
