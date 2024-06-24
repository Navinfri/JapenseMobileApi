package com.japanese.appliaction.controller;

import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.nio.file.StandardOpenOption;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.japanese.appliaction.model.AddQuestions;
import com.japanese.appliaction.service.AddQueService;


@RestController
public class AddQuestionsController {
	
	@Autowired
	private AddQueService addQueService;
	
	 private static final String UPLOAD_DIR = "D:\\Japanese Tutorial APP\\New folder (2)\\JapenseAdminApi\\src\\main\\webapp\\uploadfiles\\";

	    @PostMapping("/saveAddQuestions")
	    public ResponseEntity<String> saveAddQuestions(
	            @RequestParam(name = "questionPaperId", required = false) Long questionPaperId,
	            @RequestParam(name = "answer1", required = false) String answer1,
	            @RequestParam(name = "answer2", required = false) String answer2,
	            @RequestParam(name = "answer3", required = false) String answer3,
	            @RequestParam(name = "answer4", required = false) String answer4,
	            @RequestParam(name = "correctAnswer", required = false) String correctAnswer,
	            @RequestParam(name = "description", required = false) String description,
	            @RequestParam(name = "textQuestion", required = false) String textQuestion,
	            @RequestParam(name = "audioFile", required = false) MultipartFile audioFile,
	            @RequestParam(name = "genericFile", required = false) MultipartFile genericFile,
	            @RequestParam(name = "imageFile", required = false) MultipartFile imageFile) throws IOException {

	        AddQuestions addQuestions = new AddQuestions();

	        addQuestions.setQuestionPaperId(questionPaperId);
	        addQuestions.setAnswer1(answer1);
	        addQuestions.setAnswer2(answer2);
	        addQuestions.setAnswer3(answer3);
	        addQuestions.setAnswer4(answer4);
	        addQuestions.setCorrectAnswer(correctAnswer);
	        addQuestions.setDescription(description);
	        addQuestions.setTextQuestion(textQuestion);

	        try {
	            // Save Audio File
	            if (audioFile != null && !audioFile.isEmpty()) {
	                byte[] audioFileData = audioFile.getBytes();
	                addQuestions.setAudioFile(audioFileData);
	                String audioFilePath = saveFile(audioFileData, "audio_file", "mp3");
	                if (audioFilePath == null) {
	                    return ResponseEntity.badRequest().body("Failed to save Audio File");
	                }
	            }

	            // Save Video File
	            if (genericFile != null && !genericFile.isEmpty()) {
	                byte[] videoFileData = genericFile.getBytes();
	                addQuestions.setGenericFile(videoFileData);
	                String videoFilePath = saveFile(videoFileData, "video_file", "mp4");
	                if (videoFilePath == null) {
	                    return ResponseEntity.badRequest().body("Failed to save Video File");
	                }
	            }

	            // Save Image File
	            if (imageFile != null && !imageFile.isEmpty()) {
	                byte[] imageFileData = imageFile.getBytes();
	                addQuestions.setImageFile(imageFileData);
	                String imageFilePath = saveFile(imageFileData, "image_file", "jpg");
	                if (imageFilePath == null) {
	                    return ResponseEntity.badRequest().body("Failed to save Image File");
	                }
	            }

	            // Save question details
	            addQueService.save(addQuestions);
	            return ResponseEntity.ok("Question saved successfully");
	        } catch (IOException e) {
	            e.printStackTrace();
	            return ResponseEntity.badRequest().body("Failed to save files: " + e.getMessage());
	        }
	    }

	    private String saveFile(byte[] fileData, String fileNamePrefix, String extension) {
	        String fileName = fileNamePrefix + "_" + System.currentTimeMillis() + "." + extension;
	        String filePath = UPLOAD_DIR + fileName;

	        try {
	            Files.write(Paths.get(filePath), fileData, StandardOpenOption.CREATE);
	            return filePath;
	        } catch (IOException e) {
	            e.printStackTrace();
	            return null;
	        }
	    }
	}


