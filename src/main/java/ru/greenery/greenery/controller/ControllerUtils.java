package ru.greenery.greenery.controller;

import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;

import java.util.HashMap;
import java.util.Map;

public class ControllerUtils {
    public static Map<String,String> getErrorsFromBinding(BindingResult bindingResult){
        Map<String,String> result = new HashMap<>();
        for (FieldError fe :bindingResult.getFieldErrors()){
            result.put(fe.getField()+"Error",fe.getDefaultMessage());
        }
        return result;
    }
    public static Map<String,String> getPswdErrors(String pswd,String pswdCheck){
        Map<String,String> result=new HashMap<>();
        if(!pswd.equals(pswdCheck)){
            result.put("passwordsNotEquals","Пароли должны совпадать");
        }
        if(!(pswd.length()>=4&&pswd.length()<=30)){
            result.put("passwordError","Длина пароля должна быть от 4 до 30 символов");
        }
        return result;
    }
}
