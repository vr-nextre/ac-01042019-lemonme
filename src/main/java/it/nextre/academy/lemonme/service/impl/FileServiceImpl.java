package it.nextre.academy.lemonme.service.impl;

import org.apache.logging.log4j.Logger;
import org.springframework.http.MediaType;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import java.io.File;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

@Service
public class FileServiceImpl {

    @Autowired
    Logger log;

    public List<String> getSupportedExtensions() {
        String[] imgExt = {"jpg"};
        return Arrays.asList(imgExt);
    }

    /**
     * Se non è stata inserita nessuna immagine restituisce errore
     * @param multipartFile file img
     * @return true se esiste, false altrimenti
     */
    public boolean isEmpty(MultipartFile multipartFile){
        return multipartFile.isEmpty();
    }

    public String getFileExtension(File file) {

        String name = file.getName().substring(Math.max(file.getName().lastIndexOf('/'),
                file.getName().lastIndexOf('\\')) < 0 ? 0 : Math.max(file.getName().lastIndexOf('/'),
                file.getName().lastIndexOf('\\')));
        int lastIndexOf = name.lastIndexOf(".");
        if (lastIndexOf == -1) {
            return ""; // empty extension
        }
        return name.substring(lastIndexOf + 1); // doesn't return "." with extension
    }

    public boolean isValidImage(MultipartFile image) {
        log.debug("Validazione estensione immagine");
        //estensione ok
        String ext = getFileExtension(new File(image.getOriginalFilename())).toLowerCase();
        boolean isExtOk = getSupportedExtensions().contains(ext);
        if (!isExtOk)return isExtOk; //non vado avanti se estensione non è valida

        //mediaType ok
        MediaType mt = MediaType.valueOf(image.getContentType());
        boolean isMtOk = getSupportedMediaTypes().contains(mt);
        return isExtOk && isMtOk;
    }

    public boolean isBigger(MultipartFile image){
        log.debug("Validazione dimensione immagine");
        if (image.getSize()>625000)return false; //non vado avanti se immagine troppo grande
        return true;
    }

    public List<MediaType> getSupportedMediaTypes() {
        List<MediaType> list = new ArrayList<>();
        list.add(MediaType.IMAGE_JPEG);
        //list.add(MediaType.APPLICATION_OCTET_STREAM);
        return list;
    }

}
