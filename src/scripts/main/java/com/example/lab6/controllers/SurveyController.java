package com.example.lab6.controllers;

import com.example.lab6.entities.Survey;
import com.example.lab6.services.SurveyService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping(value = "/surveys")
public class SurveyController {
    private final SurveyService surveyService;

    @Autowired
    public SurveyController(SurveyService surveyService) {
        this.surveyService = surveyService;
    }

    @GetMapping
    public ResponseEntity<?> getAllSurvey() {
        try {
            return ResponseEntity.ok(surveyService.getAllSurveys());
        } catch (Exception exception) {
            return ResponseEntity.badRequest().body(exception.getMessage());
        }
    }

    @GetMapping("/{id}")
    public ResponseEntity<?> getSurvey(@PathVariable Long id) {
        try {
            return ResponseEntity.ok(surveyService.getSurveyById(id));
        } catch (Exception exception) {
            return ResponseEntity.badRequest().body(exception.getMessage());
        }
    }

    @PostMapping("/create")
    public ResponseEntity<?> createSurvey(@RequestBody Survey survey) {
        try {
            return ResponseEntity.ok(surveyService.createSurvey(survey));
        } catch (Exception exception) {
            return ResponseEntity.badRequest().body(exception.getMessage());
        }
    }

    @PutMapping("{id}/update_is_active/{isActive}")
    public ResponseEntity<?> updateIsActive(@PathVariable Long id, @PathVariable int isActive) {
        try {
            if (isActive == 0 || isActive == 1) {
                return ResponseEntity.ok(surveyService.changeIsActive(id, isActive));

            } else {
                throw new Exception("IsActive value should be either 0 or 1");
            }
        } catch (Exception exception) {
            return ResponseEntity.badRequest().body(exception.getMessage());
        }
    }

    @PutMapping("/update_title")
    public ResponseEntity<?> updateEmail(@RequestParam Long id, @RequestParam String title) {
        try {
            return ResponseEntity.ok(surveyService.changeSurveyTitle(id, title));
        } catch (Exception exception) {
            return ResponseEntity.badRequest().body(exception.getMessage());
        }
    }

    @DeleteMapping("/{id}")
    public ResponseEntity<?> deleteSurvey(@PathVariable Long id) {
        try {
            return ResponseEntity.ok(surveyService.deleteSurveyById(id));
        } catch (Exception exception) {
            return ResponseEntity.badRequest().body(exception.getMessage());
        }
    }

}
