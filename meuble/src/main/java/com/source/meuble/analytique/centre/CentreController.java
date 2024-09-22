package com.source.meuble.analytique.centre;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class CentreController {

    @Autowired
    CentreRepository centreRepository;

    @GetMapping("/nico")
    public String getMethodName(@RequestParam String param) {
        return new String();
    }

}
