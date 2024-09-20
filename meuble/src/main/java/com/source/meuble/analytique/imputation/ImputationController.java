package com.source.meuble.analytique.imputation;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

@Controller
public class ImputationController {
    @Autowired
    ImputationRepository imputationRepository;
}
