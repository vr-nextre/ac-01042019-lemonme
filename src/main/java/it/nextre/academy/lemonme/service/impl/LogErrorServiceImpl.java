package it.nextre.academy.lemonme.service.impl;

import it.nextre.academy.lemonme.dto.LogErrorDTO;
import it.nextre.academy.lemonme.entity.LogError;
import it.nextre.academy.lemonme.repository.LogErrorRepository;
import it.nextre.academy.lemonme.service.LogErrorService;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class LogErrorServiceImpl implements LogErrorService {

    @Autowired
    private LogErrorRepository logErrorRepository;

    @Autowired
    private Logger log;

    @Override
    public LogError save(LogErrorDTO logErrorDTO) {
        log.debug("LogErrorServiceImpl.save");
        LogError logError = new LogError(
          logErrorDTO.getMessaggio(),
          logErrorDTO.getGravita(),
          logErrorDTO.getCategoria()
        );
        return logErrorRepository.save(logError);
    }
}//End class
