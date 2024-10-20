package com.example.lab6.services;

import com.example.lab6.entities.Survey;
import com.example.lab6.repositories.SurveyRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class SurveyService {
    private final SurveyRepository surveyRepository;

    @Autowired
    public SurveyService(SurveyRepository surveyRepository) {
        this.surveyRepository = surveyRepository;
    }

    public Iterable<Survey> getAllSurveys() {
        return surveyRepository.findAll();
    }

    public Survey getSurveyById(Long id) throws Exception {
        if (surveyRepository.existsById(id)) {
            return surveyRepository.findById(id).get();
        } else {
            throw new Exception("Survey not found");
        }
    }

    public Survey createSurvey(Survey survey) {
        return surveyRepository.save(survey);
    }

    public Survey changeIsActive(Long id, int isActive) throws Exception {
        if (surveyRepository.existsById(id)) {
            Survey survey = surveyRepository.findById(id).get();
            survey.setIsActive(isActive);
            return surveyRepository.save(survey);
        } else {
            throw new Exception("Survey with provided id doesn't exist");
        }
    }

    public Survey changeSurveyTitle(Long id, String title) throws Exception {
        if (surveyRepository.existsById(id)) {
            Survey survey = surveyRepository.findById(id).get();
            survey.setTitle(title);
            return surveyRepository.save(survey);
        } else {
            throw new Exception("Survey with provided id doesn't exist");
        }
    }

    public String deleteSurveyById(Long id) throws Exception {
        if (surveyRepository.existsById(id)) {
            surveyRepository.deleteById(id);
        } else {
            throw new Exception("Failed to delete survey");
        }
        return String.format("Survey %d was deleted", id);
    }

}
