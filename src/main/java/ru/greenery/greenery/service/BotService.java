package ru.greenery.greenery.service;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.telegram.telegrambots.meta.api.methods.send.SendMessage;
import org.telegram.telegrambots.meta.exceptions.TelegramApiException;
import ru.greenery.greenery.entity.Bot;

@Service
public class BotService {

    private final Bot bot;

    @Value("${devChat}")
    private String devChat;

    public BotService(Bot bot) {
        this.bot = bot;
    }

    public void sendPraysToMainChat(String name) {
        SendMessage message = new SendMessage();
        message.setChatId(devChat);
        message.setText("Люди просят ввести следующий товар: "+name);
        try {
            bot.execute(message);
        } catch (TelegramApiException e) {
            throw new RuntimeException(e);
        }
    }
}
