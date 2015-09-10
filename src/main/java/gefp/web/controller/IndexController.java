package gefp.web.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

@Controller

public class IndexController {

    @RequestMapping({ "/index.html", "index2.html" })
    public String index( ModelMap models )
    {
        models.put( "username", "cysun" );
        models.put( "password", "abcd" );
        return "index";
    }

}
