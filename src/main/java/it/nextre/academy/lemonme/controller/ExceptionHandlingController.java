package it.nextre.academy.lemonme.controller;

import it.nextre.academy.lemonme.dto.DBErrorDTO;
import it.nextre.academy.lemonme.entity.DBError;
import it.nextre.academy.lemonme.service.DBErrorService;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.web.servlet.error.ErrorController;
import org.springframework.dao.DataAccessException;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import java.sql.SQLDataException;
import java.sql.SQLException;

@Controller
public class ExceptionHandlingController implements ErrorController {

    @Autowired
    Logger log;

    @Autowired
    private DBErrorService dbErrorService;


    @PostMapping("/error")
    public String handleError(HttpServletRequest request, Model model) {
        Object status = request.getAttribute(RequestDispatcher.ERROR_STATUS_CODE);
        String msg = "Errore generale";
        DBErrorDTO dbErrorDTO = new DBErrorDTO(1, request.getPathInfo());
        DBError dbError = dbErrorService.salvaErrore(dbErrorDTO);
        if(dbError != null){
            log.info("Errore scritto su db");
        }
        model.addAttribute("message",msg );


        if (status != null) {
            Integer statusCode = Integer.valueOf(status.toString());
            HttpStatus code = HttpStatus.valueOf(statusCode);
            msg=code.getReasonPhrase();
            model.addAttribute("statusCode", statusCode);
            model.addAttribute("message",msg );
            return "error";
        }
        return "error";
    }

    @Override
    public String getErrorPath() {
        return "redirect:/error";
    }


/*
    // @RequestHandler methods

    // Exception handling methods

    // Convert a predefined exception to an HTTP Status code
    @ResponseStatus(value= HttpStatus.CONFLICT,
            reason="Data integrity violation")  // 409
    @ExceptionHandler(DataIntegrityViolationException.class)
    public void conflict() {
        // Nothing to do
    }

    // Specify name of a specific view that will be used to display the error:
    @ExceptionHandler(DataAccessException.class)
    public DBError databaseError(DataAccessException e) {
        DBErrorDTO dbErrorDTO = new DBErrorDTO(3,e.getMessage());
        // Nothing to do.  Returns the logical view name of an error page, passed
        // to the view-resolver(s) in usual way.
        // Note that the exception is NOT available to this view (it is not added
        // to the model) but see "Extending ExceptionHandlerExceptionResolver"
        // below.
        return dbErrorService.salvaErrore(dbErrorDTO);
    }


    // Specify name of a specific view that will be used to display the error:
    @ExceptionHandler(SQLException.class)
    public String databaseError(SQLDataException e) {
        log.error("Errore SQL");
        DBErrorDTO dbErrorDTO = new DBErrorDTO(3,e.getMessage());
        DBError dbError = dbErrorService.salvaErrore(dbErrorDTO);
        if(dbError != null){
            log.info("Errore scritto");
            return "redirect:/error";
        }
        // Nothing to do.  Returns the logical view name of an error page, passed
        // to the view-resolver(s) in usual way.
        // Note that the exception is NOT available to this view (it is not added
        // to the model) but see "Extending ExceptionHandlerExceptionResolver"
        // below.
        return "redirect:/registrati";
    }


    // Total control - setup a model and return the view name yourself. Or
    // consider subclassing ExceptionHandlerExceptionResolver (see below).
    @ExceptionHandler(Exception.class)
    public ModelAndView handleError(HttpServletRequest req, Exception ex) {
        log.error("Request: " + req.getRequestURL() + " raised " + ex);

        ModelAndView mav = new ModelAndView();
        mav.addObject("exception", ex);
        mav.addObject("url", req.getRequestURL());
        mav.setViewName("error");
        return mav;
    }

 */

}//end class
