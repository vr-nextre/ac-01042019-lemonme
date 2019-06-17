package it.nextre.academy.lemonme.service.impl;

import it.nextre.academy.lemonme.dto.DBErrorDTO;
import it.nextre.academy.lemonme.entity.DBError;
import it.nextre.academy.lemonme.repository.DBErrorRepository;
import it.nextre.academy.lemonme.service.DBErrorService;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


@Service
public class DBErrorServiceImpl implements DBErrorService {

    @Autowired
    DBErrorRepository dbErrorRepository;

    @Autowired
    Logger log;

    @Override
    public DBError salvaErrore(DBErrorDTO dbErrorDTO) {
        log.debug("DBErrorServiceImpl.salvaErrore");
        DBError dbError = new DBError(
                dbErrorDTO.getGravitaErrore(),
                dbErrorDTO.getMessaggio());
        return dbErrorRepository.save(dbError);
    }


}//end class
