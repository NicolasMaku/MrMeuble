package com.source.meuble.achat.marchandise;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/marchandise")
public class MarchandiseController {
    @Autowired
    MarchandiseService marchandiseService;


}
