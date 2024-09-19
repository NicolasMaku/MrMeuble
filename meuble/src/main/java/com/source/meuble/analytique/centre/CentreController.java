package com.source.meuble.analytique.centre;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

@Controller
public class CentreController {

    @Autowired
    CentreRepository centreRepository;

}
