package it.nextre.academy.lemonme.service;

import it.nextre.academy.lemonme.dto.LogErrorDTO;
import it.nextre.academy.lemonme.entity.LogError;

public interface LogErrorService {

    LogError save(LogErrorDTO logErrorDTO);

}
