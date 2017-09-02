package hash;

import javax.servlet.http.HttpServletRequest;

public class Hash {
    HttpServletRequest request=null;
    Hash(HttpServletRequest request1){
        request=request1;
    }

    public String getHash(){
        return request.getParameter("hash");
    }

}

