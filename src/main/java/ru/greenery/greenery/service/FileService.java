package ru.greenery.greenery.service;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.PostConstruct;
import java.io.File;
import java.util.UUID;

@Service
public class FileService {
    @Value("${upload.path}")
    private String resPath;

    private String fileLocation;

    @PostConstruct
    private void init(){
        fileLocation = new File("src\\main\\resources\\static").getAbsolutePath() + "\\" + resPath;

    }

    public String createFileAndGetName(MultipartFile file) throws Exception {
        if(file!=null&&!file.getOriginalFilename().isEmpty()){
            String resultFileName = UUID.randomUUID() +"."+file.getOriginalFilename();
            file.transferTo(new File(fileLocation+"/"+resultFileName));
            return resultFileName;
        }else{
            throw new NullPointerException("Файл для сохранения пуст или не существует");
        }
    }

    public void deleteFile(String fileName){
        File f = new File(fileLocation+"/"+fileName);
        f.delete();
    }

    public String getResPath() {
        return resPath;
    }
}
